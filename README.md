<h1 align="center"> LOL Champions </h1>

<p align="center">
  <a href="https://opensource.org/licenses/Apache-2.0"><img alt="License" src="https://img.shields.io/badge/License-Apache2.0-blue.svg"/></a>
  <a href="https://developer.apple.com/ios/"><img alt="SDK" src="https://img.shields.io/badge/platform-iOS-orange"/></a>
  <img alt="MVVM" src="https://img.shields.io/badge/MVVM-Architecture-orange"/>
</p>
_              |  _
:-------------------------:|:-------------------------:
![UI](https://github.com/AhmedNasserSh/LOL-Champions/blob/main/Screenshots/1.png) | ![UI](https://github.com/AhmedNasserSh/LOL-Champions/blob/main/Screenshots/2.png)

<p align="center">
LOL Champions app is a small Multi-Module demo application to demonstrate modern iOS application tech-stacks with a Multi-module and MVVM architecture

## Tech stack & Open-source libraries
- iOS SDK 15
- [Swift](https://developer.apple.com/swift/)
- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [async/await](https://github.com/apple/swift-evolution/blob/main/proposals/0296-async-await.md)
- [Swinject](https://github.com/Swinject/Swinject)
- [Swift Lint](https://github.com/realm/SwiftLint)
- [Combine](https://developer.apple.com/documentation/combine)
- Architecture
  - Multi-module design for the app.
  - MVVM Architecture (View - Combine Binding - ViewModel - Model)
  - Clean Architecture approach.
  
- [CI/CD with github Actions](https://docs.github.com/en/actions) - Automate, customize, and execute your software development workflows.

## Architecture
LOL Champions is Multi-modular application.

Modules Design:
- App
- Common:
    - Base
    - UiComponents
- NetworkManger:
    - Remote
- AppCoordinator: 
    - Navigation
- Features:
    - Home
    - ChampionDetails

![architecture](https://github.com/AhmedNasserSh/LOL-Champions/blob/main/Screenshots/architucure.png)  ![modules](https://github.com/AhmedNasserSh/LOL-Champions/blob/main/Screenshots/modules.png)

## Open API
LOL Champions uses the [LOL Champions](https://developer.riotgames.com/docs/lol#data-dragon_data-assets/) for required data.

## Tasks
- [x] Creating the project structure

- [x] Implementing all features

- [x] Writing test cases

# License
```xml
Designed and developed by 2021 AhmedNasserSh

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
