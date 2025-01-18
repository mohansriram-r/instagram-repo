import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/comments_page/comments_screen.dart';
import 'package:instagram_clone/presentation/common_widgets/like_animation.dart';
import 'package:instagram_clone/service/firestore_service.dart';
import 'package:instagram_clone/service_loactor.dart';
import 'package:instagram_clone/utils/helper/helper.dart';
import 'package:intl/intl.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.snap});
  final snap;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                backgroundImage: NetworkImage(widget.snap['profUrl']),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(widget.snap['username']),
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
        GestureDetector(
          onDoubleTap: () async {
            await sl<FirestoreService>().likePost(
              widget.snap['postId'],
              _auth.currentUser!.uid,
              widget.snap['likes'],
            );
            setState(() {
              isLikeAnimating = true;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.white,
                height: 325,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(
                    widget.snap["posturl"],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isLikeAnimating ? 1 : 0,
                child: LikeAnimation(
                  isAnimating: isLikeAnimating,
                  duration: const Duration(milliseconds: 400),
                  onEnd: () {
                    setState(() {
                      isLikeAnimating = false;
                    });
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 150,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              LikeAnimation(
                isAnimating:
                    widget.snap['likes'].contains(_auth.currentUser!.uid),
                smallLike: true,
                child: IconButton(
                  onPressed: () async {
                    await sl<FirestoreService>().likePost(
                      widget.snap['postId'],
                      widget.snap['uid'],
                      widget.snap['likes'],
                    );
                  },
                  icon: widget.snap['likes'].contains(_auth.currentUser!.uid)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                        ),
                  iconSize: 35,
                ),
              ),
              IconButton(
                onPressed: () {
                  sl<Helper>().navigatorPush(context, const CommentsScreen());
                },
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
              Text("${(widget.snap["likes"] as List).length} Likes",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: widget.snap['username'],
                  style: Theme.of(context).textTheme.labelLarge,
                  children: <TextSpan>[
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: widget.snap['caption'],
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
                DateFormat.yMMMd()
                    .format(widget.snap['publisheddate'].toDate()),
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.grey),
              )
            ],
          ),
        )
      ],
    );
  }
}
