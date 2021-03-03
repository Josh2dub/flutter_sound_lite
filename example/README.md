# Examples/Demo

Flutter Sound comes with several Demo/Examples. All the examples are called from a [driver App](lib/main.dart)

- [Demo](#demo) is a demonstration of what we can do with Flutter Sound. This Demo App is a kind of exerciser which try to implement the major Flutter Sound features. This Demo does not use the Flutter Sound UI Widgets
- [WidgetUIDemo](#widgetuidemo) is an example of what can be done using the Flutter Sound UI Widgets
- [RecordToStream](#recordtostream) is an example showing how to record to a live Dart Stream
- [livePlaybackWithBackPressure](#liveplaybackwithbackpressure) is an example showing how to play live data synchronously
- [livePlaybackWithoutBackPressure](#liveplaybackwithoutbackpressure) is an example showing how to play live data asynchronously
- [soundEffect](#soundeffect) is an example showing to play sound effects synchronously

if Someone update this README.md, please update also the code inside Examples/lib/demo/main.dart and the comment in the header of the demo or example dart file.

--------------------------------------------------------------------------------------------------------------------------------------------------

## [Demo](lib/demo/demo.dart)

<img src="lib/demo/demo.png" width="70%" height="70%" />

This is a Demo of what it is possible to do with Flutter Sound.
The code of this Demo app is not so simple and unfortunately not very clean :-( .

The biggest interest of this Demo is that it shows most of the features of Flutter Sound :

- Plays from various media with various codecs
- Records to various media with various codecs
- Pause and Resume control from recording or playback
- Shows how to use a Stream for getting the playback (or recoding) events
- Shows how to specify a callback function when a playback is terminated,
- Shows how to record to a Stream or playback from a stream
- Can show controls on the iOS or Android lock-screen
- ...

It would be really great if someone rewrite this demo soon

--------------------------------------------------------------------------------------------------------------------------------------------------

## [WidgetUIDemo](lib/widgetUI/widgetUI.dart)

<img src="lib/widgetUI/widgetUI.png" width="70%" height="70%" />

This is a Demo of an App which uses the Flutter Sound UI Widgets.

My own feeling is that this Demo is really too much complicated for doing something very simple.
There is too many dependencies and too many sources.

I really hope that someone will write soon another simpler Demo App.

--------------------------------------------------------------------------------------------------------------------------------------------------

## [RecordToStream](lib/recordToStream/recordToStreamExample.dart)

<img src="lib/recordToStream/recordToStreamExample.png" width="70%" height="70%"/>

This is an example showing how to record to a Dart Stream.
It writes all the recorded data from a Stream to a File, which is completely stupid:
if an App wants to record something to a File, it must not use Streams.

The real interest of recording to a Stream is for example to feed a
Speech-to-Text engine, or for processing the Live data in Dart in real time.

--------------------------------------------------------------------------------------------------------------------------------------------------

## [livePlaybackWithoutBackPressure](lib/livePlaybackWithoutBackPressure/livePlaybackWithoutBackPressure.dart)

<img src="lib/livePlaybackWithoutBackPressure/livePlaybackWithoutBackPressure.png" width="70%" height="70%"/>

A very simple example showing how to play Live Data without back pressure.
It feeds a live stream, without waiting that the Futures are completed for each block.
This is simpler than playing buffers synchronously because the App does not need to await that the playback for each block is completed playing another one.

This example get the data from an asset file, which is completely stupid :
if an App wants to play a long asset file he must use [startPlayer()](#startplayer).

Feeding Flutter Sound without back pressure is very simple but you can have two problems :
- If your App is too fast feeding the audio channel, it can have problems with the Stream memory used.
- The App does not have any knowledge of when the provided block is really played.
For example, if it does a "stopPlayer()" it will loose all the buffered data.

This example uses the [FoodEvent](#food) object to resynchronize the output stream before doing a [stopPlayer()](#stopplayer)

-----------------------------------------------------------------------------------------------------------------------------------------------------

## [livePlaybackWithBackPressure](lib/livePlaybackWithBackPressure/livePlaybackWithBackPressure.dart)

<img src="lib/livePlaybackWithBackPressure/livePlaybackWithBackPressure.png" width="70%" height="70%"/>

A very simple example showing how to play Live Data with back pressure.
It feeds a live stream, waiting that the Futures are completed for each block.

This example get the data from an asset file, which is completely stupid :
if an App wants to play an asset file he must use "StartPlayerFromBuffer().

If you do not need any back pressure, you can see another simple example : [LivePlaybackWithoutBackPressure.dart](#liveplaybackwithoutbackpressure).
This other example is a little bit simpler because the App does not need to await the playback for each block before
playing another one.

---------------------------------------------------------------------------------------------------------------------------------------------------

## [soundEffect](lib/soundEffect/soundEffect.dart)

<img src="lib/soundEffect/soundEffect.png" width="70%" height="70%"/>

[startPlayerFromStream](#startplayerfromstream) can be very efficient to play sound effects in real time. For example in a game App.
In this example, the App open the Audio Session and call ```startPlayerFromStream()``` during initialization.
When it want to play a noise, it has just to call the synchronous verb ```feed```. Very fast.

