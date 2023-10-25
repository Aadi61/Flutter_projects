import 'package:bytelife/auth/auth_controller.dart';
import 'package:bytelife/widgets/credentials_widget.dart';
import 'package:bytelife/widgets/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => LoginWidget());
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  AuthController controller= AuthController();
  // var email = controller.emailController;
  // final password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Login',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    )),
                Icon(
                  Icons.person_outline_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                )
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome Back!',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w800),
                )),
        
            CredentialsWidget(
              controller: controller.emailController,
              credential_type: "Email",
              obscureText: false,
            ),
            CredentialsWidget(
              controller: controller.passwordController,
              credential_type: "Password",
              obscureText: true,
            ),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w800),
                    ))),
            const SizedBox(
              height: 20,
            ),
            Container(
              //height: 127.0/MediaQuery.of(context).devicePixelRatio,
              //width: 454.0/MediaQuery.of(context).devicePixelRatio,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
              child: InkWell(
                onTap: ()async{

                  controller.loginMethod(context: context).then((value) {
                    if(value!=null){
                      final snackBar = SnackBar(
            content: const Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
                child: Text(
                  "Login >",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Theme.of(context).primaryColor,
                  border: Border.all(color: Colors.redAccent, width: 2)),
            ),
            const SizedBox(
              height: 15,
            ),
            // Text("OR",style: GoogleFonts.poppins(fontSize:20, fontWeight: FontWeight.w700 ),),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text("Sign in with:", style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700),),
            // ),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Image(image: AssetImage('assets/Facebook.png'),height: 36,width: 36,),
            //     SizedBox(width: 20,),
            //     Image(image: AssetImage('assets/Google.png'),height: 36,width: 36,)
            //   ],
            // ),
        
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  Text(
                    'Not a member?',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w900),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,SignupWidget.route());
                      },
                      child: Text(
                        'Register for free',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
            ),
          ],
        ),
    );
  }
}
