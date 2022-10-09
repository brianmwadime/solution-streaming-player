// import 'package:solution_ke/data/models/album/album_response.dart';
// import 'package:solution_ke/data/models/song/song_response.dart';

// class Data {
//   int? id;
//   String? type;
//   int? addedBy;
//   int? song;
//   int? album;
//   String? updatedAt;
//   String? createdAt;
//   bool? isActive;
//   bool? isDeleted;
//   Album? Album;
//   Song? Song;

//   Data(
//       {this.id,
//       this.album,
//       this.song,
//       this.Album,
//       this.Song,
//       this.type,
//       this.addedBy,
//       this.updatedAt,
//       this.createdAt,
//       this.isActive,
//       this.isDeleted});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];

//     type = json['type'];
//     addedBy = json['addedBy'];
//     song = json['song'];
//     updatedAt = json['updatedAt'];
//     createdAt = json['createdAt'];
//     isActive = json['isActive'];
//     isDeleted = json['isDeleted'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;

//     data['type'] = this.type;
//     data['addedBy'] = this.addedBy;
//     data['song'] = this.song;
//     data['updatedAt'] = this.updatedAt;
//     data['createdAt'] = this.createdAt;
//     data['isActive'] = this.isActive;
//     data['isDeleted'] = this.isDeleted;
//     return data;
//   }
// }
