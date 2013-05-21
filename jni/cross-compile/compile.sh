#!/bin/sh

echo "===>start cross-compile ..."

#ffmpeg
echo "===>start compiling ffmpeg"

if [ ! -d "android" ]; then
	mkdir android
fi

if [ ! -d "android/ffmpeg" ]; then
	tar xvf tarballs/ffmpeg-0.8.14.tar.bz2
	mv ffmpeg-0.8.14/ android/ffmpeg
	cd android/ffmpeg
	./configure  --prefix=../../../arm-linux-androideabi --enable-cross-compile --target-os=linux --arch=arm --cpu=cortex-a8 --enable-neon --cross-prefix=arm-linux-androideabi-
else
	cd android/ffmpeg
fi

make -j4
make install
echo "===>compiling ffmpeg down"
