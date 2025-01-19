import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/presentation/comments_page/custom_widgets/comments_card.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/service/firestore_service.dart';
import 'package:instagram_clone/service_loactor.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key, this.snap});
  final snap;

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    final UserModel user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("post")
                    .doc(widget.snap['postId'])
                    .collection("comments")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return CommentsCard(
                        snap: snapshot.data!.docs[index].data(),
                      );
                    },
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(user.photoUrl),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 270,
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                        hintText: "Commet as ${user.userName}",
                        hintStyle: const TextStyle(fontSize: 18),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    sl<FirestoreService>().addComments(
                      widget.snap['postId'],
                      user.uid,
                      user.userName,
                      commentController.text,
                      user.photoUrl,
                    );
                    setState(() {
                      commentController.text = "";
                    });
                  },
                  child: const Text(
                    "Post",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
