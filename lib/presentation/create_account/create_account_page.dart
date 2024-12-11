import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/custom_widget/text_field.dart';
import 'package:instagram_clone/service/auth_service.dart';
import 'package:instagram_clone/utils/constants/colors.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _bio = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userName.dispose();
    _email.dispose();
    _password.dispose();
    _bio.dispose();
  }

  void signUp() async {}

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
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg"),
                    radius: 60,
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CTextField(
                controller: _userName,
                text: "Username",
              ),
              const SizedBox(
                height: 10,
              ),
              CTextField(
                controller: _email,
                text: "Enter your email",
              ),
              const SizedBox(
                height: 10,
              ),
              CTextField(
                controller: _password,
                text: "Create a password",
                ispass: true,
              ),
              const SizedBox(
                height: 10,
              ),
              CTextField(
                controller: _bio,
                text: "Bio",
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: signUp,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CColors.blueColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
