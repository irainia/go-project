echo
echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo
echo "Updating Homebrew"
brew update

echo
echo "Installing GO"
brew install go

echo
echo "Installing Dep"
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

echo
echo "Installing Git"
brew install git
