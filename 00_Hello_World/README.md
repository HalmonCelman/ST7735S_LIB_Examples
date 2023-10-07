# 00_Hello_World
This example fills screen with red, creates blue rectangle and shows "hello world!" text
## Compiling
### CMake - Linux:
```
mkdir build
cmake -S . -B build
cmake --build build
```
### CMake - Windows:
```
mkdir build
cmake -S . -B build -G "MinGW Makefiles"
cmake --build build
```
## Uploading
### Linux:
```
./upload.sh
```
### Windows:
```
./upload.bat
```

***Of course you can also compile it with STM32CubeIDE or other IDEs, but I recommend to learn and use CMake ;)***