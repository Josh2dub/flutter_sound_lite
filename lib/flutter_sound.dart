/*
 * Copyright 2018, 2019, 2020 Dooboolab.
 *
 * This file is part of Flutter-Sound.
 *
 * Flutter-Sound is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License version 3 (LGPL-V3), as published by
 * the Free Software Foundation.
 *
 * Flutter-Sound is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Flutter-Sound.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';

export 'src/flutter_sound_recorder.dart';
export 'src/platformInterface/flutter_sound_helper_platform_interface.dart';
export 'src/platformInterface/flutter_sound_platform_interface.dart';
export 'src/platformInterface/flutter_sound_recorder_platform_interface.dart';
export 'src/platformInterface/method_channel_flutter_sound_helper.dart';
export 'src/platformInterface/method_channel_flutter_sound_recorder.dart';


import 'src/platformInterface/flutter_sound_platform_interface.dart';

const List<String> ext = [
  '.aac', // defaultCodec
  '.aac', // aacADTS
  '.opus', // opusOGG
  '_opus.caf', // opusCAF
  '.mp3', // mp3
  '.ogg', // vorbisOGG
  '.pcm', // pcm16
  '.wav', // pcm16WAV
  '.aiff', // pcm16AIFF
  '_pcm.caf', // pcm16CAF
  '.flac', // flac
  '.mp4', // aacMP4
  '.amr', // AMR-NB
  '.amr', // amr-WB
];


enum Initialized {
  notInitialized,
  initializationInProgress,
  fullyInitialized,
}
