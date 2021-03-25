import 'package:flutter/material.dart';
import 'package:incidents_app/auth_state.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('S\'authentifier'),
        ),
        body: Center(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                Text(
                  "S\'authentifier",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: ctrlEmail,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: ctrlPassword,
                  decoration: InputDecoration(hintText: "Mot de passe"),
                ),
                const SizedBox(height: 10.0),
                Center(
                    child: RaisedButton(
                  textColor: Colors.white,
                  child: Text("S'authentifier"),
                  onPressed: () {
                    print(ctrlEmail.text + " " + ctrlPassword.text);
                    AuthState state =
                        Provider.of<AuthState>(context, listen: false);
                    state.login(ctrlEmail.text, ctrlPassword.text);
                  },
                ))
              ]),
        ));
  }
}
