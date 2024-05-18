import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:green_hub/login_screen.dart';
import 'package:green_hub/signup_screen.dart';

import 'constant.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phnController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFE7F9DA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight/4,
              width: screenwidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset('assets/icon.png',height: 100,width: 100,),
                  const Text('Sign Up',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Name'),
                  logingTextField(icon: Icons.account_circle_outlined, hintText: 'Enter your name', controller: _usernameController, iconColor: kLightgreencolor,),
                  const Text('Mobile Number'),
                  logingTextField(icon: Icons.call, hintText: 'Enter your mobile number', controller: _phnController, iconColor: kLightgreencolor,),
                  const Text('Password'),
                  logingTextField(icon: Icons.lock_outline, hintText: 'Enter yourPassword', controller: _passwordController, iconColor: kLightgreencolor,),
                  const Text('Email'),
                  logingTextField(icon: Icons.email_outlined, hintText: 'Enter your Email id', controller: _emailController, iconColor: kLightgreencolor,),
                  SizedBox(height: 10,),
                  Center(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                            const MaterialStatePropertyAll(kLightgreencolor),
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 120, vertical: 15)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ))),
                        // style: ElevatedButton.styleFrom(padding: EdgeInsets.only(left: screenwidth/8,right: screenwidth/8,top: 13,bottom: 13,),backgroundColor: Colors.indigo,),
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white,fontSize: 17),
                        )),
                  ),
                  SizedBox(height: 10,),
                  RichText(
                      text: TextSpan(
                          text: 'Create New Account? ',
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Login()
                                      //const SignUpPage(),
                                    ),
                                  ),
                                text: 'Login',
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFF1400FF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500))
                          ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class logingTextField extends StatelessWidget {
  IconData? icon;
  String hintText;
  TextEditingController controller;
  Color iconColor;

  logingTextField({
    required this.icon,
    required this.hintText,
    required this.controller,
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFE7F9DA),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: iconColor),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
        ),
      ),
    );
  }
}

//RichText(
//       text: TextSpan(
//           text: 'Don\'t have an Account? ',
//           style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//           children: [
//         TextSpan(
//             recognizer: TapGestureRecognizer()
//               ..onTap = () => Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => CollegeHomeScreen()
//                       //const SignUpPage(),
//                     ),
//                   ),
//             text: 'Sign Up',
//             style: const TextStyle(
//                 decoration: TextDecoration.underline,
//                 color: Colors.blue,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500))
//       ])),