import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.snap});
  final snap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(snap['profUrl']),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(snap['username']),
                Flexible(
                  child: Container(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            height: 325,
            width: double.infinity,
            child: Image(
              image: NetworkImage(
                snap["posturl"],
              ),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                  iconSize: 35,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment_outlined),
                  iconSize: 35,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  iconSize: 35,
                ),
                Flexible(child: Container()),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.turned_in_not_rounded),
                  iconSize: 35,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${(snap["likes"] as List).length} Likes",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    text: snap['username'],
                    style: Theme.of(context).textTheme.labelLarge,
                    children: <TextSpan>[
                      const TextSpan(
                        text: ' ',
                      ),
                      TextSpan(
                        text: snap['caption'],
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "View all 200 comments",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  DateFormat.yMMMd().format(snap['publisheddate'].toDate()),
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
