import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'flutter_sound_platform_interface.dart';
import 'flutter_sound_recorder_platform_interface.dart';

const MethodChannel _channel = MethodChannel('com.dooboolab.flutter_sound_recorder');

/// An implementation of [UrlLauncherPlatform] that uses method channels.
class MethodChannelFlutterSoundRecorder extends FlutterSoundRecorderPlatform {
  List<FlutterSoundRecorderCallback?> _slots = [];

  /*ctor */
  MethodChannelFlutterSoundRecorder() {
    _setCallback();
  }

  void _setCallback() {
    //channel = const MethodChannel('com.dooboolab.flutter_sound_recorder');
    _channel.setMethodCallHandler((MethodCall call) {
      return channelMethodCallHandler(call);
    });
  }

  Future<dynamic> channelMethodCallHandler(MethodCall call) async {
    FlutterSoundRecorderCallback? aRecorder = _slots[call.arguments['slotNo'] as int];

    switch (call.method) {
      case "updateRecorderProgress":
        {
          aRecorder?.updateRecorderProgress(
              duration: Duration(milliseconds: call.arguments['duration'] as int),
              dbPeakLevel: call.arguments['dbPeakLevel'] as double);
        }
        break;

      case "recordingData":
        {
          aRecorder?.recordingData(data: call.arguments['recordingData'] as Uint8List);
        }
        break;

      default:
        throw ArgumentError('Unknown method ${call.method}');
    }

    return '';
  }

  int findSession(FlutterSoundRecorderCallback aSession) {
    for (var i = 0; i < _slots.length; ++i) {
      if (_slots[i] == aSession) {
        return i;
      }
    }
    return -1;
  }

  @override
  void openSession(FlutterSoundRecorderCallback aSession) {
    assert(findSession(aSession) == -1);

    for (var i = 0; i < _slots.length; ++i) {
      if (_slots[i] == null) {
        _slots[i] = aSession;
        return;
      }
    }
    _slots.add(aSession);
  }

  @override
  void closeSession(FlutterSoundRecorderCallback aSession) {
    _slots[findSession(aSession)] = null;
  }

  Future<void> invokeMethodVoid(FlutterSoundRecorderCallback callback, String methodName, Map<String, dynamic> call) {
    call['slotNo'] = findSession(callback);
    return _channel.invokeMethod(methodName, call);
  }

  Future invokeMethodInt(FlutterSoundRecorderCallback callback, String methodName, Map<String, dynamic> call) {
    call['slotNo'] = findSession(callback);
    return _channel.invokeMethod<int>(methodName, call);
  }

  Future invokeMethodBool(FlutterSoundRecorderCallback callback, String methodName, Map<String, dynamic> call) {
    call['slotNo'] = findSession(callback);
    return _channel.invokeMethod<bool>(methodName, call);
  }

  Future invokeMethodString(FlutterSoundRecorderCallback callback, String methodName, Map<String, dynamic> call) {
    call['slotNo'] = findSession(callback);
    return _channel.invokeMethod<String>(methodName, call);
  }

  @override
  Future<void> initializeFlautoRecorder(FlutterSoundRecorderCallback callback,
      {AudioFocus? focus, SessionCategory? category, SessionMode? mode, int? audioFlags, AudioDevice? device}) {
    return invokeMethodVoid(
      callback,
      'initializeFlautoRecorder',
      ({
        'focus': focus?.index,
        'category': category?.index,
        'mode': mode?.index,
        'audioFlags': audioFlags,
        'device': device?.index,
      } as Map<String, dynamic>),
    );
  }

  @override
  Future<void> releaseFlautoRecorder(
    FlutterSoundRecorderCallback callback,
  ) {
    return invokeMethodVoid(
      callback,
      'releaseFlautoRecorder',
      Map<String, dynamic>(),
    );
  }

  @override
  Future<void> setAudioFocus(
    FlutterSoundRecorderCallback callback, {
    AudioFocus? focus,
    SessionCategory? category,
    SessionMode? mode,
    int? audioFlags,
    AudioDevice? device,
  }) {
    return invokeMethodVoid(
      callback,
      'setAudioFocus',
      ({
        'focus': focus?.index,
        'category': category?.index,
        'mode': mode?.index,
        'audioFlags': audioFlags,
        'device': device?.index,
      } as Map<String, dynamic>),
    );
  }

  @override
  Future<bool> isEncoderSupported(
    FlutterSoundRecorderCallback callback, {
    Codec? codec,
  }) {
    return invokeMethodBool(
      callback,
      'isEncoderSupported',
      {
        'codec': codec?.index,
      } as Map<String, dynamic>,
    ) as Future<bool>;
  }

  @override
  Future<void> setSubscriptionDuration(
    FlutterSoundRecorderCallback callback, {
    Duration? duration,
  }) {
    return invokeMethodVoid(
      callback,
      'setSubscriptionDuration',
      {'duration': duration?.inMilliseconds} as Map<String, dynamic>,
    );
  }

  @override
  Future<void> startRecorder(
    FlutterSoundRecorderCallback callback, {
    String? path,
    int? sampleRate,
    int? numChannels,
    int? bitRate,
    Codec? codec,
    bool? toStream,
    AudioSource? audioSource,
  }) {
    return invokeMethodVoid(
      callback,
      'startRecorder',
      {
        'path': path,
        'sampleRate': sampleRate,
        'numChannels': numChannels,
        'bitRate': bitRate,
        'codec': codec?.index,
        'toStream': toStream ?? false ? 1 : 0,
        'audioSource': audioSource?.index,
      } as Map<String, dynamic>,
    );
  }

  @override
  Future<void> stopRecorder(
    FlutterSoundRecorderCallback callback,
  ) {
    return invokeMethodVoid(
      callback,
      'stopRecorder',
      Map<String, dynamic>(),
    );
  }

  @override
  Future<void> pauseRecorder(
    FlutterSoundRecorderCallback callback,
  ) {
    return invokeMethodVoid(
      callback,
      'pauseRecorder',
      Map<String, dynamic>(),
    );
  }

  @override
  Future<void> resumeRecorder(
    FlutterSoundRecorderCallback callback,
  ) {
    return invokeMethodVoid(
      callback,
      'resumeRecorder',
      Map<String, dynamic>(),
    );
  }
}
