import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/screen/Dashboard/dashboard.dart';
import 'package:shop/screen/register/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showSpinner = false;
  final _formkey = GlobalKey<FormState>();
  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    bool isDesktopOrIpad = MediaQuery.of(context).size.width > 768.0;
    double buttonWidth = isDesktopOrIpad ? 500.0 : double.infinity;
    double buttonHeight = isDesktopOrIpad ? 60.0 : double.infinity;

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.network(
                  "https://images.unsplash.com/photo-1599305445671-ac291c95aaa9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D",
                  width: isDesktopOrIpad ? 150 : 120,
                  height: isDesktopOrIpad ? 150 : 120,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: isDesktopOrIpad ? 500 : double.infinity,
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          onChanged: (String value) {
                            email = value;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              prefixIcon: Icon(Icons.mail),
                              labelText: 'Enter your Email Address'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          onChanged: (String value) {
                            password = value;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Enter your Password',
                              focusColor: Colors.red),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              fixedSize: Size(buttonWidth, buttonHeight),
                            ),
                            onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          setState(
                            () {
                              showSpinner = true;
                            },
                          );

                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email.toString().trim(),
                                password: password.toString().trim());

                            if (user != null) {
                              print("Success");
                              toastMessage("User Successfully Login");
                              setState(
                                () {
                                  showSpinner = false;
                                },
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                            }
                          } catch (e) {
                            print(e.toString());
                            toastMessage(e.toString());
                            setState(
                              () {
                                showSpinner = false;
                              },
                            );
                          }
                        }
                      },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Does not have an Account?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RegisterScreen()));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 10, 10),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
