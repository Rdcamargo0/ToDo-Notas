import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoflutter/autenticacao.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget{ 
  
    const LoginPage({Key? key,}): super(key: key);

    @override
    State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? errorMessage = '';
  bool isLogin = true;

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try{
      await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
        );
    } on FirebaseAuthException catch (e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async{
    try{
      await Auth().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
        );} on FirebaseAuthException catch(e) {
          setState(() {
        errorMessage = e.message;
      });
     }
  }

@override
  void dispose() {
    _emailController.dispose();
     _passwordController.dispose();
    super.dispose();
  }


@override
Widget build(BuildContext context){
     return Scaffold(
        backgroundColor: Colors.yellow,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Hello again!
                  Text(
                    'Bem Vindo!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ), // TextStyle
            
                  ), // Text
            
                  SizedBox (height: 10),
            
                  Text(
                    'Tem algo para anotar?',
            
                    style: TextStyle(
                      fontSize: 20,
            
                    ), // TextStyle 
                  ), // Text
                  SizedBox (height: 50),
            
                 // email textfield
                 Padding(
                    padding: const EdgeInsets.symmetric (horizontal: 25.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide (color:Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ), 
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide (color:Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'E-mail',
                        fillColor:Colors.grey [200],
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),



               // password textfield

                  Padding (
                    padding: const EdgeInsets.symmetric (horizontal: 25.0),
                    child: TextField(
                      controller: _passwordController, 
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide (color:Colors.white),
                          borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide (color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Password',
                            fillColor:Colors.grey [200],
                            filled: true,
                            ),
                          ),
                        ),
                        SizedBox (height: 10),
            
                   // sign in button
                  Padding (
                    padding: const EdgeInsets.symmetric (horizontal: 25.0),
                    child: GestureDetector(
                      onTap: signInWithEmailAndPassword,
                      child: Container(
                        padding: EdgeInsets.all(20),
                         decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                ), 
                              ), 
                            ), 
                          ),
                    ), 
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
            ), 
              ),
            ),
          );
}
}
