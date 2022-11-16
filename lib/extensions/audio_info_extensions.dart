import 'package:audio_manager/audio_manager.dart';

extension AudioInfoExtensions on AudioInfo {
  static final _id = Expando<int>();

  int? get id => _id[this];

  set setId(int? x) => _id[this] = x;
}
