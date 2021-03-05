import 'package:flutter/material.dart';
import 'package:merenderia2/Login/google_sign_in.dart';

class LoginProvider extends InheritedWidget {
  final Authservice bloc;

  LoginProvider({Key key, Widget child})
      : bloc = Authservice(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Authservice of(BuildContext context) {
    // ignore: deprecated_member_use
    return (context.inheritFromWidgetOfExactType(LoginProvider) as LoginProvider).bloc;
  }
}