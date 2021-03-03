# Flutter Sound

<img src="Logotype primary.png" width="70%" height="70%" />

<p align="left">
  <a href="https://pub.dartlang.org/packages/flutter_sound"><img alt="pub version" src="https://img.shields.io/pub/v/flutter_sound.svg?style=flat-square"></a>
</p>
This plugin provides simple recorder and player functionalities for both Android and iOS platforms.

-----------------------------------------------------------------------------------------------------------------------------------

# <center>Flauto (Flutter Sound) V 6.0 is OUT </center>

We (I) think that this version will be a major release. Please refer to the [CHANGELOG.md file](CHANGELOG.md) to get learn all the great new features. It has especially the following :

## Record to Dart Stream

This feature has been requested from many months from many, many, many Flutter Sound users. This open doors to things like feeding a Speech-to-Text engine.

You can refer to the [Getting Started with Record-to-Stream](doc/codec.md#recording-pcm-16-to-a-dart-stream) notice.

## Playback from a live Dart Stream

This feature has also been requested from many months from many Flutter Sound users.

You can refer to the [Getting Started with Playback-from-Stream](doc/codec.md#playing-pcm-16-from-a-dart-stream) notice.

------------------------------------------------------------------------------------------------------------------------------------

<br/><br/>

![Demo](https://user-images.githubusercontent.com/27461460/77531555-77c9ec00-6ed6-11ea-9813-320f943b08cc.gif)

## Features

- Play and Record sounds or music with various codecs. (See [the supported codecs here](doc/codec.md#actually-the-following-codecs-are-supported-by-flutter_sound))
- Play local or remote files specified by their URL.
- Record to a Dart Stream
- Playback from a Dart Stream
- The App playback can be controled from the device lock screen or from an Apple watch

## Flutter Sound branches

We actually maintain two branches for Flutter Sound :

- The V5 branch (the version ^5.0.0)
- The master branch (actually the version ^6.0.0)

## Migration Guides

See [the migration guide](doc/migration.md) to migrate from an anterious version (V5, V4 or V3)

## SDK requirements

- Flutter Sound requires an iOS 9.3 SDK (or later)
- Flutter Sound requires an Android 21 (or later)

## Installation

[Here is a guide](doc/install.md#install) for Flutter Sound installation

## Flutter Sound API

Flutter Sound is composed with 4 modules :

- [FlutterSoundPlayer](doc/player.md#flutter-sound-player-api), wich deal with everything about playbacks
- [FlutterSoundRecorder](doc/recorder.md#flutter-sound-recorder-api), which deal with everything about recording
- [FlutterSoundHelper](doc/helper.md), which offers some convenients tools
- [FlutterSoundUI](doc/ui_widget.md), which offer some Widget ready to be used out of the box

To use Flutter Sound you just do :
```
import 'package:flutter_sound/flutter_sound.dart';
```

This will import all the necessaries dart interfaces.

## Examples (Demo Apps)

Flutter Sound comes with several Demo/Examples :

Please refer to [the README.md](example/README.md) to have a preview of those examples.
[The `examples App`](example/lib/main.dart) is a driver which can call all the various examples.

## License

Flutter Sound is copyrighted by Dooboolab (2018, 2019, 2020)
Flutter Sound is released under a license with a *copyleft* clause: the LGPL-V3 license. This means that if you modify some of Flutter Sound code you must be publish your modifications under the LGPL license too.

## Contributions

Flutter Sound is a free and Open Source project. Several contributors have already contributed to Flutter Sound. Specially :
- @hyochan who is the Flutter Sound father
- @salvatore373 who wrote the Track Player
- @bsutton who wrote the UI Widgets
- @larpoux who add several codec supports

**We really need your contributions.**
Pull Requests are welcome and will be considered very carefully.


## Bugs, Features Requests, documentation inaccurate, help needed, ...

We use [Github](https://github.com/dooboolab/flutter_sound/issues) actively.

When you fill an issue, we try to answer something in less than 48h. Of course, this will not mean that your issue will be fixed in 48h. But you will know that we confirm (or not) your issue and what answer you can expect. Maintenance is our priority. We try to make it perfect.


## TODO

- [X] Record raw PCM both on Android and iOS
- [ ] Record OPUS on Android
- [ ] Record MP3 both on Android and iOS
- [X] Record raw PCM to a Dart Stream instead of a file
- [ ] Playback raw PCM from a Dart Stream instead of a file
- [ ] Streaming records to Speech to Text
- [ ] More support for the Apple Watch
- [ ] Tests unit to avoid any regression
- [ ] Flutter Web App support
- [ ] Flutter Sound port to React Native
- [ ] Better UI Widget
- [ ] Lock screen control between two sounds (Done on iOS).


## Help Maintenance

My friend Hyo has been maintaining quite many repos these days and he is burning out slowly. If you could help him cheer up, buy him a cup of coffee will make his life really happy and get much energy out of it. As a side effect, we will know that Flutter Sound is important for you, that you appreciate our job and that you can show it with a little money.
<br/>
<a href="https://www.buymeacoffee.com/dooboolab" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/purple_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a>
[![Paypal](https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png)](https://paypal.me/dooboolab)
