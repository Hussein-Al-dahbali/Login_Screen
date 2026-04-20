import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool obscurePassword = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  //  Email Validator
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email";
    }

    return null;
  }

  // Password Validator
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 8) {
      return "At least 8 characters";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Must contain uppercase letter";
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Must contain number";
    }

    return null;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:Scaffold(
        appBar:  AppBar(backgroundColor: Colors.green,centerTitle: true,title: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),),
          body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'your@email.com',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),
                  SizedBox(height: 16),


              TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                  obscureText: obscurePassword,
                  validator: passwordValidator,
              ),
                      SizedBox(height: 24),

                                  Builder(
                                    builder: (context) {
                                      return MaterialButton(onPressed: (){

                                          if (formKey.currentState!.validate()) {

                                            String email = emailController.text;
                                            String password = passwordController.text;
                                            print('Login with: $email, $password');

                                            Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(),));



                                        };



                                      },child: Text("Login",style: TextStyle(color: Colors.white),),color: Colors.green,minWidth: 150,height: 50,shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12),),


                                      );
                                    }
                                  ),

                      SizedBox(height: 16),


                      TextButton(
                        onPressed: () {

                        },
                        child: Text('Forget Password'),
                      ),
                    ],
                  ),
              ),
          ),

      ));
    }}




