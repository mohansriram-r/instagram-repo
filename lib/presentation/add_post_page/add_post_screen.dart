import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/app.dart';
import 'package:instagram_clone/utils/constants/colors.dart';
import 'package:instagram_clone/utils/helper/helper.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final Helper _helper = Helper();
  final TextEditingController _captionController = TextEditingController();

  void _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            "Choose a option",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          children: [
            SimpleDialogOption(
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await _helper.pickImage(ImageSource.camera);
                setState(() {
                  _file = file;
                });
              },
              padding: const EdgeInsets.all(20),
              child: Text(
                "Take a photo",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            SimpleDialogOption(
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await _helper.pickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
              padding: const EdgeInsets.all(20),
              child: Text(
                "Gallery",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Post",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Post",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: CColors.blueColor),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(64, 255, 255, 255),
                ),
                child: GestureDetector(
                  onTap: () {
                    _selectImage(context);
                  },
                  child: _file == null
                      ? const Icon(
                          Icons.upload,
                          size: 30,
                        )
                      : Image(
                          image: MemoryImage(_file!),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Write a caption',
                  counterText: '',
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  border: InputBorder.none,
                ),
                maxLines: 3,
                maxLength: 150,
                enableSuggestions: false,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
