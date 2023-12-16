import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialLoginScreen extends StatelessWidget {
   SocialLoginScreen({super.key});
  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {

          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: const Text('Login Screen ',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
              body: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    color: Colors.black87,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          // to do
                          ClipOval(
                              child: Image.asset('assets/images/logo.jpeg',
                                width: 400,height: 250,
                              )
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            controller: emailAddressController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label: const Text('Enter Your Email Address'),
                              labelStyle: const TextStyle(
                                  color:Colors.white
                              ),
                              prefixIcon:  const Icon(Icons.email),
                              enabled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Colors.orange,
                                    width: 3
                                ),
                              ),
                              enabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Colors.orange,
                                    width: 3
                                ),
                              ) ,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Colors.orange,
                                    width: 3
                                ),
                              ),
                              prefixIconColor: Colors.orange,
                              focusColor: Colors.orange,
                            ),
                            style: const TextStyle(
                                color:Colors.white
                            ),
                            cursorColor: Colors.white,
                          ),
                          const  SizedBox(height: 10,),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              label: const Text('Enter Your Password'),
                              labelStyle: const TextStyle(
                                  color:Colors.white
                              ),
                              suffixIcon: GestureDetector(
                                  onTap: (){

                                  },
                                  child: const Icon(Icons.remove_red_eye)),
                              prefixIcon:  const Icon(Icons.lock),
                              enabled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Colors.orange,
                                    width: 3
                                ),
                              ),
                              enabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Colors.orange,
                                    width: 3
                                ),
                              ) ,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Colors.orange,
                                    width: 3
                                ),
                              ),
                              suffixIconColor: Colors.orange,
                              prefixIconColor: Colors.orange,
                              focusColor: Colors.orange,
                            ),
                            style: const TextStyle(
                                color:Colors.white
                            ),
                            cursorColor: Colors.white,
                          ),
                          const  SizedBox(height: 15,),
                          ElevatedButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor:Colors.orangeAccent,
                              iconColor: Colors.white,

                            ),
                            icon: const Icon(Icons.login,
                              size: 22,
                            ),
                            label:const Text('Sign In ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color:  Colors.white
                              ),
                            ),
                            onPressed: (){


                            },
                          ),
                          const  SizedBox(height: 10,),
                          TextButton(
                              onPressed: (){


                              },
                              child: const Text('Create Account')
                          ),


                        ],
                      ),
                    ),
                  )));

  }}

