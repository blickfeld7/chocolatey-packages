# Chocolatey Packages
[![](https://ci.appveyor.com/api/projects/status/github/blickfeld7/chocolatey-packages?svg=true)](https://ci.appveyor.com/project/blickfeld7/chocolatey-packages)

[Update status](https://gist.github.com/blickfeld7/84807e4bbf71b96c70d06deb17e75925)

## Chocolatey Packages Template
this repo is a fork of https://github.com/chocolatey-community/chocolatey-packages-template

### Folder Structure

* automatic - where automatic packaging and packages are kept. These are packages that are automatically maintained using [AU](https://chocolatey.org/packages/au).
* icons - Where you keep icon files for the packages. This is done to reduce issues when packages themselves move around.
* manual - where packages that are not automatic are kept.
* setup - items for prepping the system to ensure for auto packaging.

For setting up your own automatic package repository, please see [Automatic Packaging](https://chocolatey.org/docs/automatic-packages)

### Requirements

* Chocolatey (choco.exe)
* PowerShell v5+.
* The [AU module](https://chocolatey.org/packages/au).

For daily operations check out the AU packages [template README](https://github.com/majkinetor/au-packages-template/blob/master/README.md).