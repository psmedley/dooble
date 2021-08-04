#!/usr/bin/bash

cd ~/Development/dooble.d/
mkdir -p ./opt/dooble/Data
mkdir -p ./opt/dooble/Documentation
mkdir -p ./opt/dooble/Lib
mkdir -p ./opt/dooble/Translations
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5Charts.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5Core.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5DBus.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5Gui.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5Network.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5Positioning.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5PrintSupport.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5Qml.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5QmlModels.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5Quick.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5QuickWidgets.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5Sql.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5Svg.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5WebChannel.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5WebEngineCore.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5WebEngineWidgets.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5Widgets.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libQt5XcbQpa.so.5 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libicudata.so.56 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libicui18n.so.56 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/lib/libicuuc.so.56 ./opt/dooble/Lib/.
cp -p ~/Qt/5.15.2/gcc_64/libexec/QtWebEngineProcess ./opt/dooble/.
cp -pr ~/Qt/5.15.2/gcc_64/plugins ./opt/dooble/.
cp -pr ~/Qt/5.15.2/gcc_64/resources ./opt/dooble/.
cp -pr ~/Qt/5.15.2/gcc_64/translations ./opt/dooble/.
chmod -x,g+w ./opt/dooble/Lib/*
~/Qt/5.15.2/gcc_64/bin/lupdate dooble.pro
~/Qt/5.15.2/gcc_64/bin/lrelease dooble.pro
~/Qt/5.15.2/gcc_64/bin/qmake -o Makefile dooble.pro && make -j 10
cp -p ./Documentation/Documents/*.pdf ./opt/dooble/Documentation/.
cp -p ./Documentation/KDE ./opt/dooble/Documentation/.
cp -p ./Documentation/TO-DO ./opt/dooble/Documentation/.
cp -p ./Documentation/dooble.asc ./opt/dooble/Documentation/.
cp -p ./Documentation/dooble.pol ./opt/dooble/Documentation/.
cp -p ./Dooble ./opt/dooble/.
cp -p ./Icons/Logo/dooble.png ./opt/dooble/.
cp -p ./Qt/qt.conf ./opt/dooble/.
cp -p ./Translations/*.qm ./opt/dooble/Translations/.
cp -pr ./Charts ./opt/dooble/.
cp -pr ./Data/*.txt ./opt/dooble/Data/.
cp -pr ./Data/README ./opt/dooble/Data/.
cp -pr ./qtwebengine_dictionaries ./opt/dooble/.
find ./opt/dooble/plugins -name '*.so' -exec chmod -x {} \;
mkdir -p dooble-debian.d/opt
mkdir -p dooble-debian.d/usr/bin
mkdir -p dooble-debian.d/usr/share/applications
mkdir -p dooble-debian.d/usr/share/pixmaps
cp -p dooble.desktop dooble-debian.d/usr/share/applications/.
cp -pr DEBIAN dooble-debian.d/.
cp -r ./opt/dooble dooble-debian.d/opt/.
cp Icons/Logo/dooble.png dooble-debian.d/usr/share/pixmaps/.
cp dooble.sh dooble-debian.d/usr/bin/dooble
dpkg-deb --build dooble-debian.d Dooble-2021.08.05_amd64.deb
rm -fr ./opt
rm -fr dooble-debian.d
make distclean
