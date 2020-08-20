import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:iotappagriculture/model/user_login_model.dart';

import '../DashboardPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  String message = '';

  // Getting value from TextField widget.
  final deviceiddController = TextEditingController();
  final passworddController = TextEditingController();
  final deviceidController = TextEditingController();

  bool isLoading = false;
  // final passwordController = TextEditingController();
  Future<UserLogin> userLoginprocess(String deviceidd, String passwordd) async {
    final String apiUrl = "https://agriautomation.000webhostapp.com/login.php";

    final response = await http
        .post(apiUrl, body: {"device_id": deviceidd, "password": passwordd});

    // Getting Server response into variable.
    //var message = jsonDecode(response.body);

    var data = json.decode(response.body);
    var errmsg = UserLogin.fromJson(data);
    // if (data == "true") {
    //   print("Device already existed with");
    // }

    // if(res.containsKey('error')){

    // }
    //print(data);
    if (data['error'] == false) {
      setState(() {
        isLoading = false;
        //message = data['user_user_name'];
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      setState(() {
        isLoading = false;
        message = 'Login failed...';
      });
    }
    //print('i am in function');
    // if (response.statusCode == 200) {
    final String responseString = response.body;
    //   // print(response.statusCode);
    //   // print(response.toString());
    //   print('${errmsg.userUserName.toString()}');

    //   //print();

    return userLoginFromJson(responseString);
    // } else {
    //   print("status code is not 200");
    //   return null;
    // }
  }

  @override
  void dispose() {
    deviceiddController.dispose();
    passworddController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Namaste',
                        style: TextStyle(
                            fontSize: 70.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('MyDrip',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(295.0, 103.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'DEVICE ID',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black))),
                            controller: deviceiddController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Device ID can not be empty.';
                              }
                              return null;
                            }),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          obscureText: true,
                          controller: passworddController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password can not be empty.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                //fontFamily: 'Montserrat',
                                //decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.blueAccent,
                            color: Colors.blue,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () async {
                                if(_formkey.currentState.validate()) {
                                  userLoginprocess(deviceiddController.text,
                                      passworddController.text);

                                  setState(() {
                                    isLoading = true;
                                    message = 'Please wait...';
                                  });
                                }


                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => DashboardPage()),
                                // );
                                //print(data);
                              },
                              child: isLoading ? CircularProgressIndicator(backgroundColor: Colors.white,) : Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    //fontFamily: 'Montserrat'
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(message),
                        // Container(
                        //   height: 40.0,
                        //   color: Colors.transparent,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         border: Border.all(
                        //             color: Colors.black,
                        //             style: BorderStyle.solid,
                        //             width: 1.0),
                        //         color: Colors.transparent,
                        //         borderRadius: BorderRadius.circular(20.0)),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: <Widget>[
                        //         Center(
                        //           child:
                        //               ImageIcon(AssetImage('assets/facebook.png')),
                        //         ),
                        //         SizedBox(width: 10.0),
                        //         Center(
                        //           child: Text('Log in with facebook',
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   fontFamily: 'Montserrat')),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    ))),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Get your drip automation | ',
                  style: TextStyle(
                    //fontFamily: 'Montserrat',
                      fontSize: 16.0),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.blue,
                      //fontFamily: 'Montserrat',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      //decoration: TextDecoration.underline
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
