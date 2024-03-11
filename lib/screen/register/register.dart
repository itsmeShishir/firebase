import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/screen/login/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String username = "", email = "", password = "";
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.network(
                  "https://images.unsplash.com/photo-1599305445671-ac291c95aaa9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D",
                  height: 150,
                  width: 150,
                ),
                const Text(
                  "Welcome to HamroBlog",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Username';
                            }
                            return null;
                          },
                          onChanged: (String value){
                            username = value;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              prefixIcon: Icon(Icons.people),
                              labelText: 'Enter your User Name'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          onChanged: (String value){
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
                          controller: passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          onChanged: (String value){
                            password = value;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Enter your Password'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                fixedSize: const Size(200, 75)),
                            onPressed: () async{
                              // Pre Written code given by Firebase_auth
                              if(_formKey.currentState!.validate()){
                                
                              setState(
                                () {
                                  showSpinner = true;
                                },
                              );
            
                              try {
                                final user =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email.toString().trim(),
                                        password: password.toString().trim());
            
                                if (user != null) {
                                  print("Success");
                                  toastMessage("User Successfully Created");
                                  setState(
                                    () {
                                      showSpinner = false;
                                    },
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               LoginScreen()));
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
                              "Register",
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
                const Center(
                  child: Text(
                    "OR",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Allready have an Account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 10, 10),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
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
