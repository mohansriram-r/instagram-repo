import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/service/storage_service.dart';
import 'package:uuid/uuid.dart';

abstract class FirestoreService {
  Future<String> uploadPost(
    Uint8List file,
    String username,
    String profileUrl,
    String caption,
    String uid,
  );

  Future<void> likePost(String postId, String uid, List likes);
}

class FireStoreImplementation extends FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final StorageService _storageService = StorageService();

  @override
  Future<String> uploadPost(
    Uint8List file,
    String username,
    String profileUrl,
    String caption,
    String uid,
  ) async {
    String res = "";

    try {
      String photoUrl =
          await _storageService.uploadImageToStorage('post', file, true);

      String postId = const Uuid().v1();

      PostModel post = PostModel(
        username: username,
        caption: caption,
        uid: uid,
        publishedDate: DateTime.now(),
        postId: postId,
        postUrl: photoUrl,
        profUrl: profileUrl,
        likes: [],
      );

      await _firebaseFirestore
          .collection('post')
          .doc(postId)
          .set(post.toJson());

      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  @override
  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firebaseFirestore.collection("post").doc(postId).update(
          {
            "likes": FieldValue.arrayRemove([uid])
          },
        );
      } else {
        await _firebaseFirestore.collection("post").doc(postId).update(
          {
            "likes": FieldValue.arrayUnion([uid])
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
