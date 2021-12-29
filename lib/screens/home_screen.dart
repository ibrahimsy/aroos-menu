import 'package:aroos_menu/screens/tabs_screen.dart';
import 'package:flutter/cupertino.dart';

import '../provider/language.dart';
import 'package:provider/provider.dart';

import './categories_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSwitched = false;

  void _switchLanguage(Language lan) {
    if (_isSwitched) {
      lan.setLanguage('AR');
    } else {
      lan.setLanguage('EN');
    }
  }

  @override
  Widget build(BuildContext context) {
    var _language = Provider.of<Language>(context, listen: true);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black54,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            _language.tLanguage(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: CupertinoSwitch(
                              activeColor: Colors.amber,
                              trackColor: Colors.grey,
                              value: _isSwitched,
                              onChanged: (value) {
                                // print(value);
                                setState(() {
                                  _isSwitched = value;
                                  if (_isSwitched) {
                                    _language.setLanguage('AR');
                                  } else {
                                    _language.setLanguage('EN');
                                  }
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  // Center(
                  //   child: CircleAvatar(
                  //     backgroundColor: Colors.white30,
                  //     radius: MediaQuery.of(context).size.width * 0.3,
                  //     child: Container(
                  //         padding: EdgeInsets.all(20),
                  //         child: Image.asset('assets/images/logo.png')),
                  //   ),
                  // ),
                  const SizedBox(height: 100),
                  Text(
                    _language.tWelcome(),
                    style: TextStyle(
                        shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: _language.tFont()),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 5,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return TabsScreen();
          }));
        },
        label: Text(
          _language.tMenu(),
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontFamily: _language.tFont()),
        ),
      ),
    );
  }
}
