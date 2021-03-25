import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:incidents_app/res/app_consts.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  Account account;

  AuthState() {
    init();
  }

  void init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);

    account = Account(client);
  }

  void login(String email, String password) async {
    try {
      print(email + " " + password);
      var result = await account.createSession(
          email: "test@test.com", password: "enigma");
      print(result);
    } catch (e) {
      print(e);
    }
  }
}
