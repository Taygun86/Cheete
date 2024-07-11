import 'package:chatmobile/theme/color.dart';
import 'package:chatmobile/variables/home.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/widgets.dart';

Future<void> sendMessage(BuildContext context) async {
  String tag = CosmosRandom.randomTag();
  String uid = await CosmosFirebase.getUID();
  await CosmosFirebase.add(
    reference: "chat",
    tag: tag,
    value: [
      uid,
      tag,
      chatMessageController.text,
      CosmosTime.getNowTimeString(),
    ],
    onError: (e) {
      CosmosAlert.showMessage(
        context,
        "opps...",
        e.toString(),
        backgroundColor: navcolor,
        color: textcolor,
      );
    },
    onSuccess: () {
      sendMessageBtnVisible.value = false;
      chatMessageController.clear();
    },
  );
}
