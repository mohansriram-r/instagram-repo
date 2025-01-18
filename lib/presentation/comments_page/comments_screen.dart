import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/comments_page/custom_widgets/comments_card.dart';
import 'package:instagram_clone/presentation/common_widgets/text_field.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const CommentsCard();
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 270,
                  child: CTextField(
                    controller: controller,
                    text: "Commet",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Post"),
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
