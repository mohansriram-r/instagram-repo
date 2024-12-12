import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/presentation/custom_widget/text_field.dart';
import 'package:instagram_clone/service/auth_service.dart';
import 'package:instagram_clone/utils/constants/colors.dart';
import 'package:instagram_clone/utils/constants/icon_strings.dart';
import 'package:instagram_clone/utils/helper/helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Helper _helper = Helper();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthService().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == 'sucess') {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      _helper.showSnackBar(context, res);
    }
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
              Flexible(flex: 1, child: Container()),
              _logo(context),
              const SizedBox(height: 30),
              CTextField(
                controller: _emailController,
                text: "Email",
              ),
              const SizedBox(height: 10),
              CTextField(
                controller: _passwordController,
                text: "Password",
                ispass: true,
              ),
              const SizedBox(height: 20),
              _loginButton(context),
              Flexible(flex: 1, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have a account?",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(width: 10),
                  _signUpTextButton(context),
                ],
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo(BuildContext context) {
    return SvgPicture.asset(
      CIconStrings.instagarmLogo,
      width: 200,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return InkWell(
      onTap: loginUser,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CColors.blueColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  "Login",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
        ),
      ),
    );
  }

  Widget _signUpTextButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        "SignUp",
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
