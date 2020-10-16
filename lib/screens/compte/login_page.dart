import 'package:ecomerce/screens/compte/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey();
  bool isEnabled = true;
  final Color divider = Colors.black;
  enableButton() {
    setState(() {
      isEnabled = true;
    });
  }

  disableButton() {
    setState(() {
      isEnabled = false;
    });
  }

  sampleFunction() {
    print('Clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
        title: Text('Connectez-vous'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Identifiez-vous',
                style: TextStyle(
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                    height: 1.5,
                    color: Colors.grey),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      width: 400,
                      child: TextField(
                        // controller: _textFieldController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          //add icon outside input field
                          icon: Icon(Icons.mail_outline),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      width: 400,
                      child: TextField(
                        // controller: _textFieldController,
                        decoration: InputDecoration(
                          hintText: "Mot de passe",
                          //add icon outside input field
                          icon: Icon(Icons.lock_open_sharp),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'MOT DE PASSE OUBLIE ?',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.orangeAccent,
                        onPressed: () {},
                        child: Text(
                          "Connectez-vous",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Nouveau Compte ?',
                            style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context, MaterialPageRoute(builder: (_) => RegisterPage())),
                            child: Text(
                              'CREER UN COMPTE ?',
                              style: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            width: 160,
                            child: Divider(),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: Text('OU'),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            width: 160,
                            child: Divider(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                        textColor: Colors.white,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Text('f',
                                  style: TextStyle(
                                      color: Colors.blueAccent.shade700,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              alignment: Alignment.center,
                              color: Colors.lightBlue,
                              iconSize: 40.0,
                            ),
                            Text(
                              "Continuer avec facebook",
                              style: TextStyle(
                                  color: Colors.blueGrey.shade700,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                        textColor: Colors.white,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: CircleAvatar(
                                  radius: (10),
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: Image.asset('assets/gmail.png'),
                                  )),
                              alignment: Alignment.center,
                              color: Colors.lightBlue,
                              iconSize: 40.0,
                            ),
                            Text(
                              "Continuer avec gmail",
                              style: TextStyle(
                                  color: Colors.blueGrey.shade700,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }
}
