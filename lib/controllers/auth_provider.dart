import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends InheritedWidget {
  final AuthService auth;

  AuthProvider({Key key, this.auth})
      : super(
          key: key,
        );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static AuthProvider of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType() as AuthProvider);
}
