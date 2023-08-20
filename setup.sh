# Check for Homebrew,
# Install if we don't have it
if ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
aws --version

echo "Installing other brew stuff..."
brew install git
brew install nvm

# github
printf "Githubのメールアドレスを入力してください。"
read -r email
printf "Githubのユーザー名を入力してください。"
read -r username
echo "Creating an Github SSH key for you..."
ssh-keygen -t ed25519 -C "$email" -f github

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
brew cask install --appdir="/Applications" ${apps[@]}

brew cleanup

echo "Setting some Mac settings..."
# TODO : 設定できるようにしたい
# - マウス速度
# - Dockの表示アプリ
# - 起動時に起動するアプリ


killall Finder

echo "Done!"
