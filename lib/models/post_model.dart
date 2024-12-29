import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String username;
  final String caption;
  final String uid;
  final DateTime publishedDate;
  final String postId;
  final String postUrl;
  final String profUrl;
  final List likes;

  PostModel({
    required this.username,
    required this.caption ,
    required this.uid,
    required this.publishedDate,
    required this.postId,
    required this.postUrl,
    required this.profUrl,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'caption': caption,
        'publisheddate': publishedDate,
        'username': username,
        'postId' : postId,
        'profUrl' : profUrl,
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
      profUrl: snapShot['profUrl'],
      username: snapShot["username"],
      likes: snapShot["likes"],
    );
  }
}
