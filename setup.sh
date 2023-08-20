# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/{$whoami}/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing AWS CLI..."
sudo softwareupdate --install-rosetta
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
aws --version
rm AWSCLIV2.pkg

echo "Installing other brew stuff..."
brew install git
brew install nvm

# github
printf "Githubのメールアドレスを入力してください。"
read -r email
printf "Githubのユーザー名を入力してください。"
read -r username
echo "Creating an Github SSH key for you..."
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t ed25519 -C "$email" -f github
chmod 600 github

echo "
Host github github.com
  HostName github.com
  IdentityFile ~/.ssh/github
  User git
" >> ~/.ssh/config

pbcopy < ~/.ssh/github.pub
echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

ssh -T git@github.com


# Apps
apps=(
  arc
  appcleaner
  1password
  docker
  drawio
  google-chrome
  google-japanese-ime
  rectangle
  slack
  spotify
  visual-studio-code
  warp
  phpstorm
)

# TODO : 未対応アプリ
# - LINE
# - Pages

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask --appdir="/Applications" ${apps[@]}

brew cleanup

echo "Setting some Mac settings..."
# TODO : 設定できるようにしたい
# - マウス速度
# - Dockの表示アプリ
# - 起動時に起動するアプリ


killall Finder

rm setup.sh

echo "Done!"
