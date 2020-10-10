# HwpKit

> 본 제품은 한글과컴퓨터의 한글 문서 파일(.hwp) 공개 문서를 참고하여 개발하였습니다.

![Test](https://github.com/sboh1214/HwpKit/workflows/Test/badge.svg)
![Coverage](https://github.com/sboh1214/HwpKit/workflows/Coverage/badge.svg)
![Documentation](https://github.com/sboh1214/HwpKit/workflows/Documentation/badge.svg)
![Lint](https://github.com/sboh1214/HwpKit/workflows/Lint/badge.svg)

[![Discord](https://img.shields.io/discord/761775951012692018?label=Discord)](https://discord.gg/rV6d5JX)

Swift Package for Reading & Writing HWP File

## Install

### Swift Package Manager

Go to ```File``` > ```Swift Packages``` > ```Add Package Dependency...``` in Xcode.

Or add dependency manually.
```swift
dependencies: [
    .package(url: "https://github.com/sboh1214/HwpKit.git", .branch("main")),
],
```

## Contribute

[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=sboh1214_HwpKit&metric=ncloc)](https://sonarcloud.io/dashboard?id=sboh1214_HwpKit)

### Code Quality

[![Maintainability](https://api.codeclimate.com/v1/badges/6950359f807606deb022/maintainability)](https://codeclimate.com/github/sboh1214/HwpKit/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/6950359f807606deb022/test_coverage)](https://codeclimate.com/github/sboh1214/HwpKit/test_coverage)

[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=sboh1214_HwpKit&metric=sqale_rating)](https://sonarcloud.io/dashboard?id=sboh1214_HwpKit)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=sboh1214_HwpKit&metric=reliability_rating)](https://sonarcloud.io/dashboard?id=sboh1214_HwpKit)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=sboh1214_HwpKit&metric=security_rating)](https://sonarcloud.io/dashboard?id=sboh1214_HwpKit)

### Test on Linux

Currently, this project does not support Linux due to dependency [DataCompression](https://github.com/mw99/DataCompression).
You should install [Sourcery](https://github.com/krzysztofzablocki/Sourcery) to create LinuxMain.swift and test.

```bash
$ sourcery --sources Tests --templates Tests/LinuxMain.stencil
$ swift test
```

## License

![GitHub](https://img.shields.io/github/license/sboh1214/HwpKit)
