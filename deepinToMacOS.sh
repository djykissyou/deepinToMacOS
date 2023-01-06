#!/bin/sh

mkdir /tmp/tomacos
cd /tmp/tomacos
wget -c https://github.com/djykissyou/deepinToMacOS/archive/refs/tags/v0.0.2.zip
unzip -q v0.0.1.zip
wget -c https://github.com/SeptemberHX/dde-top-panel/releases/download/v0.6.8/dde-top-panel-0.6.8-Linux.zip
unzip -q dde-top-panel-0.6.8-Linux.zip
sudo dpkg -i dde-top-panel-0.6.8-Linux.deb
sudo apt install -f
sudo dpkg -i dde-top-panel-0.6.8-Linux.deb
dde-top-panel
cp -f top-panel.conf ~/.config/dde-top-panel
cp -f dde-top-panel.desktop /usr/share/dde-globalmenu-service.desktop
gsettings set com.deepin.dde.watchdog dde-dock false
killall dde-dock

wget -c https://github.com/SeptemberHX/dde-globalmenu-service/releases/download/v1.0.1/dde-globalmenu-service-1.0.1-Linux.zip
unzip -q dde-globalmenu-service-1.0.1-Linux.zip
sudo dpkg -i dde-globalmenu-service-1.0.1-Linux.deb
sudo cp -f dde-globalmenu-service.desktop /usr/share/dde-globalmenu-service.desktop
#修改~/.gtkrc-2.0及~/.config/gtk-3.0/settings.ini，在末尾追加gtk-modules=appmenu-gtk-module
sudo apt install plank
sudo cp -f plank.desktop /usr/share/applications/plank.desktop
#设置plank，鼠标放在dock栏上，ctrl+鼠标右键--首选项
sudo chmod -x /usr/bin/dde-dock
mkdir ~/.local/lib
mkdir ~/.local/lib/dde-top-panel
mkdir ~/.local/lib/dde-top-panel/plugins
mv ./*.so ~/.local/lib/dde-top-panel/plugins/
#感谢https://www.bilibili.com/read/cv13897168
sudo apt install systemsettings
