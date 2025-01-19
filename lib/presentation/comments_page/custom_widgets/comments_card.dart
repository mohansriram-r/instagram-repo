import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentsCard extends StatelessWidget {
  const CommentsCard({
    super.key,
    this.snap,
  });

  final snap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(snap["profilepic"]),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${snap["username"]} : ",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        snap["comment"],
                        style: const TextStyle(fontSize: 15),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
                Text(
                  DateFormat.yMMMd().format(snap["date"].toDate()).toString(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
