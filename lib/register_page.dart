import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model//user_register_model.dart';

import 'main.dart';

// class User {
//   String error;
//   String errormsg;

//   User(this.error, this.errormsg);

//   factory User.fromJson(dynamic json) {
//     return User(json['error'] as String, json['errormsg'] as String);
//   }

//   @override
//   String toString() {
//     return '{ ${this.error}, ${this.errormsg} }';
//   }
// }
UserRegister _user;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Boolean variable for CircularProgressIndicator.
  bool visible = false;
  String registrmsg = '';
  final _registrformkey = GlobalKey<FormState>();

  // Getting value from TextField widget.
  final usernameController = TextEditingController();
  final usermobnoController = TextEditingController();
  final deviceidController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  Future<UserRegister> userRegistration(String username, String usermobno,
      String deviceid, String password) async {
    final String apiUrl =
        "https://agriautomation.000webhostapp.com/register.php";

    final response = await http.post(apiUrl, body: {
      "user_name": username,
      "user_mob_no": usermobno,
      "device_id": deviceid,
      "password": password
    });

    // Showing CircularProgressIndicator.
    setState(() {
      isLoading = false;
      visible = true;
    });

    // Getting Server response into variable.
    //var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    // ignore: dead_code
    // setState(() {
    //   visible = false;
    // });
    var data = json.decode(response.body);
    var errmsg = UserRegister.fromJson(data);
    // if (data == "true") {
    //   print("Device already existed with");
    // }
    if (data['error'] == false) {
      setState(() {
        //message = data['user_user_name'];
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      print(data['error_msg']);
      setState(() {
        registrmsg = 'Register failed...';
      });
    }

    if (response.statusCode == 200) {
      final String responseString = response.body;
      //print(response.statusCode);
      print('${errmsg.errorMsg}');
      //print();

      return userRegisterFromJson(responseString);
    } else {
      print("status code is not 200");
      return null;
    }

    // Showing Alert Dialog with Response JSON Message.
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: new Text(message),
    //       actions: <Widget>[
    //         FlatButton(
    //           child: new Text("OK"),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  @override
  void dispose() {
    usernameController.dispose();
    usermobnoController.dispose();
    deviceidController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: _screenSize.height * 0.25,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 135.0, 0.0, 0.0),
                      child: Text('Register',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 55.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                child: Form(
                    key: _registrformkey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Full name',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                            controller: usernameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Full name can not be empty.';
                              }
                              return null;
                            }),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Mobile',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          controller: usermobnoController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Mobile number can not be empty.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Device ID',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          controller: deviceidController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Device ID can not be empty.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          obscureText: true,
                          controller: passwordController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password can not be empty.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 35.0),
                        Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.blueAccent,
                              color: Colors.blue,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {
                                  if(_registrformkey.currentState.validate()){
                                    userRegistration(
                                        usernameController.text,
                                        usermobnoController.text,
                                        deviceidController.text,
                                        passwordController.text);

                                    setState(() {
                                      isLoading = true;
                                      registrmsg = 'Please wait...';
                                    });
                                  }

                                },
                                child: isLoading ? CircularProgressIndicator(backgroundColor: Colors.white,) : Center(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      //fontFamily: 'Montserrat'
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        Text(registrmsg),
                        Container(
                          height: 40.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                // border: Border.all(
                                //     color: Colors.black,
                                //     style: BorderStyle.solid,
                                //     width: 1.0),
                                // color: Colors.transparent,
                                // borderRadius: BorderRadius.circular(20.0)
                                ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Center(
                                child: Text('Already have an account.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.0,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                // SizedBox(height: 15.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text(
                //       'New to Spotify?',
                //       style: TextStyle(
                //         fontFamily: 'Montserrat',
                //       ),
                //     ),
                //     SizedBox(width: 5.0),
                //     InkWell(
                //       child: Text('Register',
                //           style: TextStyle(
                //               color: Colors.green,
                //               fontFamily: 'Montserrat',
                //               fontWeight: FontWeight.bold,
                //               decoration: TextDecoration.underline)),
                //     )
                //   ],
                // )
              )
            ]));
  }
}
