#!/bin/bash
DIAG_SIZE="20 60"

if dialog --yesno "Install spotify?" $DIAG_SIZE; then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt update
  sudo apt install spotify-client
fi

if dialog --yesno "Install skype?" $DIAG_SIZE; then
  SKYPE_FILENAME="skype-ubuntu-precise_4.3.0.37-1_i386.deb"
  EXPECTED_HASH="d274ab94a7772766417b18e66d1864df"
  SKYPE_DEPENDENCIES="gcc-5-base:i386 gstreamer1.0-plugins-base:i386 libasound2:i386 libasound2-plugins:i386 libasyncns0:i386 libaudio2:i386 libavahi-client3:i386 libavahi-common-data:i386 libavahi-common3:i386 libbsd0:i386 libcdparanoia0:i386 libcups2:i386 libdbus-1-3:i386 libdrm-amdgpu1:i386 libdrm-intel1:i386 libdrm-nouveau2:i386 libdrm-radeon1:i386 libdrm2:i386 libedit2:i386 libelf1:i386 libexpat1:i386 libffi6:i386 libflac8:i386 libfontconfig1:i386 libfreetype6:i386 libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libglapi-mesa:i386 libglib2.0-0:i386 libgmp10:i386 libgnutls30:i386 libgssapi-krb5-2:i386 libgstreamer-plugins-base1.0-0:i386 libgstreamer1.0-0:i386 libhogweed4:i386 libice6:i386 libicu55:i386 libidn11:i386 libjack-jackd2-0:i386 libjbig0:i386 libjpeg-turbo8:i386 libjpeg8:i386 libjson-c2:i386 libk5crypto3:i386 libkeyutils1:i386 libkrb5-3:i386 libkrb5support0:i386 liblcms2-2:i386 libllvm3.8:i386 libmng2:i386 libmysqlclient20:i386 libnettle6:i386 libogg0:i386 libopus0:i386 liborc-0.4-0:i386 libp11-kit0:i386 libpciaccess0:i386 libpng12-0:i386 libpulse0:i386 libqt4-dbus:i386 libqt4-declarative:i386 libqt4-network:i386 libqt4-opengl:i386 libqt4-script:i386 libqt4-sql:i386 libqt4-sql-mysql:i386 libqt4-xml:i386 libqt4-xmlpatterns:i386 libqtcore4:i386 libqtdbus4:i386 libqtgui4:i386 libqtwebkit4:i386 libsamplerate0:i386 libsm6:i386 libsndfile1:i386 libspeexdsp1:i386 libsqlite3-0:i386 libssl1.0.0:i386 libstdc++6:i386 libtasn1-6:i386 libtheora0:i386 libtiff5:i386 libtxc-dxtn-s2tc0:i386 libvisual-0.4-0:i386 libvorbis0a:i386 libvorbisenc2:i386 libwrap0:i386 libx11-6:i386 libx11-xcb1:i386 libxau6:i386 libxcb-dri2-0:i386 libxcb-dri3-0:i386 libxcb-glx0:i386 libxcb-present0:i386 libxcb-sync1:i386 libxcb1:i386 libxdamage1:i386 libxdmcp6:i386 libxext6:i386 libxfixes3:i386 libxi6:i386 libxml2:i386 libxrender1:i386 libxshmfence1:i386 libxslt1.1:i386 libxss1:i386 libxt6:i386 libxv1:i386 libxxf86vm1:i386 qt-at-spi:i386"

  cd /tmp
  if [ ! -e $SKYPE_FILENAME ]; then
    wget "https://download.skype.com/linux/$SKYPE_FILENAME"
  fi

  echo "$EXPECTED_HASH $SKYPE_FILENAME" | md5sum -c -

  if [ $? -ne 0 ]; then
    echo "Hash for file $SKYPE_FILENAME is invalid, expected: $EXPECTED_HASH"
    exit 1
  fi

  sudo apt install -y $SKYPE_DEPENDENCIES
  sudo dpkg -i $SKYPE_FILENAME
  rm $SKYPE_FILENAME
fi
