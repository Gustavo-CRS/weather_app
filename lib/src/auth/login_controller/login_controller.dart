import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  bool obscureText = true;

  @computed
  bool get isValid {
    if (username.trim().isEmpty || password.trim().isEmpty) {
      return false;
    }
    if (password.length < 6) {
      return false;
    }
    return true;
  }

  @action
  void toggleObscureText() {
    obscureText = !obscureText;
  }

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  Future<void> login(BuildContext context) async {
    Navigator.pushNamed(context, '/homePage');
  }
}
