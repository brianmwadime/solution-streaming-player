// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:audio_service/audio_service.dart';
// import 'package:audio_session/audio_session.dart';

// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:solution_ke/presentation/player_screen/player_screen.dart';

// class AudioPlayerHandlerImpl extends BaseAudioHandler
//     with QueueHandler, SeekHandler
//     implements AudioPlayerHandler {
//   int? count;
//   Timer? _sleepTimer;
//   bool recommend = true;
//   bool loadStart = true;
//   bool useDown = true;
//   AndroidEqualizerParameters? _equalizerParams;

//   late AudioPlayer? _player;
//   late String preferredQuality;
//   late bool resetOnSkip;

//   Box downloadsBox = Hive.box('downloads');

//   // final BehaviorSubject<List<MediaItem>> _recentSubject =
//   //     BehaviorSubject.seeded(<MediaItem>[]);
//   // final _playlist = ConcatenatingAudioSource(children: []);
//   // @override
//   // final BehaviorSubject<double> volume = BehaviorSubject.seeded(1.0);
//   // @override
//   // final BehaviorSubject<double> speed = BehaviorSubject.seeded(1.0);
//   // final _mediaItemExpando = Expando<MediaItem>();

//   @override
//   Future<void> moveQueueItem(int currentIndex, int newIndex) {
//     // TODO: implement moveQueueItem
//     throw UnimplementedError();
//   }

//   @override
//   // TODO: implement queueState
//   Stream<QueueState> get queueState => throw UnimplementedError();

//   @override
//   Future<void> setVolume(double volume) {
//     // TODO: implement setVolume
//     throw UnimplementedError();
//   }
// }
