import 'dart:async';

import 'package:chatmobile/variables/home.dart';
import 'package:chatmobile/widget/message.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

Future<void> getChatFun(BuildContext context) async {
  await CosmosFirebase.getUID().then(
    (uid) async {
      await CosmosFirebase.getOnce("users").then(
        (users) {
          CosmosFirebase.dataChanged(
            reference: "chat",
            onDataChanged: (element) {
              List<String> gotvalue = element as List<String>;
              String gotUID = gotvalue[0].replaceAll('"', "");
              String gottag = gotvalue[1];
              String gotname = "";
              String gotMessage = gotvalue[2];
              String gotTimeStamp = gotvalue[3];
              gotTimeStamp = gotTimeStamp.substring(10, 16);
              for (List<String> singleusers in users) {
                if ('"$gotUID"' == singleusers[singleusers.length - 1]) {
                  gotname = singleusers[0];
                }
              }
              if (gotUID == uid) {
                messageList.value.add(message(
                  context,
                  true,
                  gotname,
                  gotMessage,
                  gotTimeStamp,
                  gottag,
                ));
                // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                messageList.notifyListeners();
              } else {
                messageList.value.add(message(
                  context,
                  false,
                  gotname,
                  gotMessage,
                  gotTimeStamp,
                  gottag,
                ));
                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                messageList.notifyListeners();
              }
            },
          );
        },
      );
    },
  );
}
