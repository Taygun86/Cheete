import 'package:chatmobile/page/home.dart';
import 'package:chatmobile/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

Future<void> loginServices(
    BuildContext context, String email, String password) async {
  CosmosAlert.loadingIOS(context);
  await CosmosFirebase.signIn(
    email: email,
    password: password,
    trError: true,
    onError: (error) {
      Navigator.pop(context);
      CosmosAlert.showMessage(
        context,
        "opps...",
        error,
        backgroundColor: navcolor,
        color: textcolor,
      );
    },
    onSuccess: () {
      Navigator.pop(context);
      CosmosNavigator.pushDownFromTop(context, const Login());
    },
  );
}
