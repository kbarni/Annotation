# Annotation

Advanced annotation tool for agricultural field work.

[image]

**Features**

- Cross platform  
  - Full support for Android, iOS, Windows, Linux, MacOS
  - Provided executables for Windows and Android
- Fully configurable user interface (see [Creating interfaces] for details)
- Project-specific user form
- Multi-language
- Dark theme (for reduced power consumption on oled devices)
- Easy acess to the data
- Free and open source (see [License] for details)

## Useage

The app has a fully configurable interface that you can adapt for your project.

Before using the app, you **must** create a form adapted for your needs. See the [Creating interfaces]() document or the provided example files. Copy the created `.ui` file to the `Documents` folder on your device. 

On startup, create a new project by specifying the file name, project and selecting the desired form; or select an existing file.

Now, the form appears, and you can start to fill in the data.

The data can be found in the `Documents` folder of your device as `.ant` files; the images in the `Pictures` or `DCIM` folder. The data is TAB delimited, so it can be imported directly to Excel.

## Build instructions

**Prerequisites**

- Build tools [^1]
- Qt development libraries (5.12+) [^2]
- QtQuick2 development libraries [^2]
- [Optional] Qt Creator [^2]
- [Optional] Android or iOS Development Kit [^3]

[^1]: *mingw* for Windows, *build-essential* package for Linux/MacOS
[^2]: easiest way to install is through the [Qt online installer]()
[^3]: see configuring Qt for [Android]() or [iOS]()

**Building**

```
git clone ...
cd Annotation
mkdir build
cd build
qmake ../Annotation.pro
make
```

...or open the Annotation.pro project in QtCreator and press "Build".
