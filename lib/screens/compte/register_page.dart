import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        title: Text('Créer un compte'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Créer un nouveau compte',
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
                          hintText: "Prénom",
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 35.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              bottom: 20.0, left: 20.0, right: 20.0),
                          width: 365,
                          child: TextField(
                            // controller: _textFieldController,
                            decoration: InputDecoration(
                              hintText: "Nom",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(),
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 20.0, left: 20.0, right: 20.0),
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
                      padding: EdgeInsets.only(
                          bottom: 20.0, left: 20.0, right: 20.0),
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
                      padding: EdgeInsets.only(
                          bottom: 20.0, left: 20.0, right: 20.0),
                      width: 400,
                      child: IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                        ),
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.orangeAccent,
                        onPressed: () {},
                        child: Text(
                          "Créer",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
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
