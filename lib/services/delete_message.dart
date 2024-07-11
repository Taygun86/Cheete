import 'package:chatmobile/page/home.dart';
import 'package:chatmobile/theme/color.dart';
import 'package:chatmobile/variables/home.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

Future<void> deleteMessage(BuildContext context, String id) async {
  String getID = id.replaceAll('"', "");
  CosmosFirebase.delete(
    'chat/"$getID"',
    () {
      messageList.value.clear();
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      messageList.notifyListeners();
      CosmosNavigator.pushNonAnimatedReplacement(context, const Login());
    },
    (e) {
      Navigator.pop(context);
      CosmosAlert.showMessage(
        context,
        "opps...",
        e.toString(),
        backgroundColor: navcolor,
        color: textcolor,
      );
    },
  );
}
