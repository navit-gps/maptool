git clone https://github.com/navit-gps/navit.git
pushd navit
mkdir bin && cd bin
cmake ../
make -j32 || exit 1
