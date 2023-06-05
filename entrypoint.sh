# Set proxy if it exists
if [ $PROXY ];then
	echo 'Set proxy'
	git config --global --add http.proxy $PROXY
	git config --global --add https.proxy $PROXY
	export all_proxy=$PROXY
fi

# Clone repo
git config --global pull.rebase false
if [ ! -d "/git/binding" ];then
	cd /git && git clone https://github.com/REI-Network/binding && cd binding
else
	cd /git/binding && git pull origin master
fi
git submodule update --init --recursive

# Print versions
echo '------- g++ -------'
g++ --version
echo '------- node ------'
node -v
echo '-------------------'

# Build
npm install
npm run build
npm run build:tsc
