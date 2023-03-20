# 기여

## 코딩 스타일

이 프로젝트는 코드 포맷과 스타일을 강제하기 위해 [SwiftLint](https://github.com/realm/SwiftLint),
[SwiftFormat](https://github.com/nicklockwood/SwiftFormat),
[markdownlint](https://github.com/markdownlint/markdownlint),
and [pre-commit](https://pre-commit.com/)
를 사용합니다.

```
brew install swiftlint
brew install swiftformat
gem install mdl
brew install pre-commit
pre-commit install
```

SwiftLint는 또한 모든 PR에서 CI로 확인됩니다.

## 명명법

파일 및 폴더명은 파스칼표기법을 따릅니다.
스위프트 코드는 일반적인 명명법을 따릅니다.

## 코드 퀄리티

[![Maintainability](https://api.codeclimate.com/v1/badges/b920b09bdee71fdc8208/maintainability)](https://codeclimate.com/github/sboh1214/Hwp-Swift/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/b920b09bdee71fdc8208/test_coverage)](https://codeclimate.com/github/sboh1214/Hwp-Swift/test_coverage)

## 배포

### Swift 버전이 새로 출시된 경우

아래와 같은 파일의 Swift 버전을 업데이트합니다.

- .github/workflows/Test-Linux.yml
- .github/workflows/Test-macOS.yml

### Minimum Swift 버전이 변경된 경우

아래와 같은 파일의 Swift 버전을 업데이트합니다.

- .github/workflows/Test-Linux.yml
- .github/workflows/Test-macOS.yml
- .swift-version
- .swiftformat
- Package.swift
