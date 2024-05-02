import 'dart:developer';

import 'package:fintrack/common/widgets/custom_button.dart';
import 'package:fintrack/common/widgets/custome_textfield.dart';
import 'package:fintrack/constants/global_varialbles.dart';
import 'package:fintrack/controller/provider/onboarding.dart';
import 'package:fintrack/controller/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Auth { signIn, signUp }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final UserProvider uPro = Get.put(UserProvider());

  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
    _passwordController.clear();
    _userNameController.clear();
  }

  void signUpUser() {
    authService.signUpUser(
        name: _userNameController.text,
        password: _passwordController.text,
        email: _emailController.text,
        context: context);
  }

  void signInUser() {
    authService.signInUser(
        password: _passwordController.text,
        email: _emailController.text,
        context: context);
  }

  Auth _auth = Auth.signUp;

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVarialble.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ListTile(
              tileColor: _auth == Auth.signUp
                  ? GlobalVarialble.backgroundColor
                  : GlobalVarialble.greyBackgroundCOlor,
              title: const Text("Create Account"),
              leading: Radio(
                  activeColor: GlobalVarialble.secondaryColor,
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            Visibility(
                visible: _auth == Auth.signUp,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _userNameController,
                            hintText: "Name",
                          ),
                          kHeight10,
                          CustomTextField(
                            controller: _emailController,
                            hintText: "Email",
                          ),
                          kHeight10,
                          CustomTextField(
                            controller: _passwordController,
                            hintText: "Password",
                          ),
                          kHeight10,
                          CustomButton(
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                            },
                            childText: "Sign Up",
                          )
                        ],
                      )),
                )),
            ListTile(
              tileColor: _auth == Auth.signIn
                  ? GlobalVarialble.backgroundColor
                  : GlobalVarialble.greyBackgroundCOlor,
              title: const Text("Sign-In"),
              leading: Radio(
                  activeColor: GlobalVarialble.secondaryColor,
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            Visibility(
                visible: _auth == Auth.signIn,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            hintText: "Email",
                          ),
                          kHeight10,
                          CustomTextField(
                            controller: _passwordController,
                            hintText: "Password",
                          ),
                          kHeight10,
                          CustomButton(
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
                              }
                            },
                            childText: "Sign In",
                          )
                        ],
                      )),
                )),
            ElevatedButton(
                onPressed: () {
                  AuthService authService = AuthService();
                  authService.getUserData(context: context);
                  log(uPro.user.map((data) => data?.token).toString());
                },
                child: Text("asdlkj")),
         
          ]),
        ),
      ),
    );
  }
}
