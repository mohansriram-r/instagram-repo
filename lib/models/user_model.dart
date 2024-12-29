import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String bio;
  final String userName;
  final List followers;
  final List following;

  UserModel({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.bio,
    required this.userName,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'bio': bio,
        'username': userName,
        'following': [],
        'followers': [],
        'photoUrl': photoUrl,
      };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;

    return UserModel(
        email: snapShot['username'],
        uid: snapShot['uid'],
        photoUrl: snapShot["photoUrl"],
        bio: snapShot["bio"],
        userName: snapShot["username"],
        followers: snapShot["followers"],
        following: snapShot["following"]);
  }
}
