import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String username;
  final String caption;
  final String uid;
  final DateTime publishedDate;
  final String postId;
  final String postUrl;
  final List likes;

  PostModel({
    required this.username,
    required this.caption ,
    required this.uid,
    required this.publishedDate,
    required this.postId,
    required this.postUrl,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'caption': caption,
        'publisheddate': publishedDate,
        'username': username,
        'postId' : postId,
        'posturl' : postUrl,
        'likes': likes,
      };

  static PostModel fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;

    return PostModel(
      uid: snapShot['uid'],
      caption: snapShot['caption'],
      postUrl: snapShot['posturl'],
      publishedDate: snapShot['pusblisheddate'],
      postId: snapShot['postId'],
      username: snapShot["username"],
      likes: snapShot["likes"],
    );
  }
}
