echo "== Install the google translator"
echo "== mkdir /tmp/translator"
mkdir /tmp/translator
echo "== cd /tmp/translator"
cd /tmp/translator
echo "== wget git.io/trans"
wget git.io/trans
echo "== chmod +x trans"
chmod +x trans
echo "== git clone https://github.com/soimort/translate-shell"
git clone https://github.com/soimort/translate-shell
echo "== cd translate-shell/"
cd translate-shell/
echo "== make"
make
echo "== sudo make install"
sudo make install
echo "== trans --version" 
trans --version 
echo "== rm -rf /tmp/translator"
rm -rf /tmp/translator

