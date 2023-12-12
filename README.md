# Funky Fisheye

## Purpose

The purpose of this shader was to provide a more customizable Fisheye Lens shader that could allow the user more flexability and usability in projects.
 
 Some of the possible use cases for this shader can be:

 - ### Inversion of Fisheye Lens Images:
 ![Uninverted Image Example](https://github.com/Nomok/Funky-Fisheye/assets/32122105/b90ef36e-93e7-4d67-b82b-dba7b2a93acd) ![Inverted Image Example](https://github.com/Nomok/Funky-Fisheye/assets/32122105/af08f3d7-0ca8-444e-bb73-f84ad8a33007)

 - ### Magnifying Glass Effect:
 ![Magnifying Glass Example](https://github.com/Nomok/Funky-Fisheye/assets/32122105/20a407a1-2a0f-4456-bda1-1e4240de92a9)

 - ### CRT Bulge Effect:
 ![CRT Example](https://github.com/Nomok/Funky-Fisheye/assets/32122105/797b062c-5a46-4a81-a3b4-6eb6bfc4f9b4)

## Compiling:

### Requisites:
FXC (apart of the [Windows SDK](https://developer.microsoft.com/en-us/windows/downloads/sdk-archive/))

### Windows: 
1. Insert `FXC.exe` into the root directory or insert the path for FXC in line 11 of `CompileShader.bat`
2. Run `CompileShader.bat`
3. You should get a successful compilation message:
```
fxc.exe "funky_fisheye.hlsl" /nologo /WX /Ges /Qstrip_reflect /Qstrip_debug /Tps_4_0 /Eps_main /Fo"funky_fisheye.fxc"
compilation object save succeeded; see ROOT\funky_fisheye.fxc

fxc.exe "funky_fisheye.hlsl" /nologo /WX /Ges /Qstrip_reflect /Qstrip_debug /Tps_4_0 /Eps_main_pm /Fo"funky_fisheye.premultiplied.fxc"
compilation object save succeeded; see ROOT\funky_fisheye.premultiplied.fxc
.
Shaders compiled ok
```

## TODO
- Android Support
- MacOS Support
- IOS Support