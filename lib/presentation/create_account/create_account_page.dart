import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/presentation/custom_widget/text_field.dart';
import 'package:instagram_clone/service/auth_service.dart';
import 'package:instagram_clone/utils/constants/colors.dart';
import 'package:instagram_clone/utils/helper/helper.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  final Helper _helper = Helper();

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
  }

  signUp() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthService().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _userNameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });

    if (res != 'sucess') {
      _helper.showSnackBar(context, res);
    }
  }

  selectImage() async {
    Uint8List im = await _helper.pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Create a account",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              _profilePic(context),
              const SizedBox(height: 30),
              CTextField(
                controller: _userNameController,
                text: "Username",
              ),
              const SizedBox(
                height: 10,
              ),
              CTextField(
                controller: _emailController,
                text: "Enter your email",
              ),
              const SizedBox(height: 10),
              CTextField(
                controller: _passwordController,
                text: "Create a password",
                ispass: true,
              ),
              const SizedBox(height: 10),
              CTextField(
                controller: _bioController,
                text: "Bio",
              ),
              const SizedBox(height: 20),
              _createAccountButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return InkWell(
      onTap: signUp,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CColors.blueColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  "Login",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
        ),
      ),
    );
  }

  Widget _profilePic(BuildContext context) {
    return Stack(
      children: [
        _image != null
            ? CircleAvatar(
                backgroundImage: MemoryImage(_image!),
                radius: 60,
              )
            : const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg",
                ),
                radius: 60,
              ),
        Positioned(
          bottom: -10,
          right: -10,
          child: IconButton(
            onPressed: selectImage,
            icon: const Icon(
              Icons.add_photo_alternate,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
