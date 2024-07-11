import 'package:chatmobile/services/delete_message.dart';
import 'package:chatmobile/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

Widget message(
  BuildContext context,
  bool sender,
  String name,
  String message,
  String timestamp,
  String id,
) {
  return Row(
    mainAxisAlignment:
        sender == true ? MainAxisAlignment.end : MainAxisAlignment.start,
    children: [
      CosmosMenu.builder(
        context,
        backgroundColor: defaulColor,
        items: [
          CosmosMenu.iconItem(
            Icons.delete,
            "Mesajı Sil",
            onTap: () async {
              await deleteMessage(context, id);
            },
            textColor: textcolor,
          )
        ],
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          width: width(context) * 0.60,
          decoration: BoxDecoration(
            color: navcolor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: textcolor.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                  color: textcolor,
                  fontSize: 14,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    timestamp,
                    style: TextStyle(
                      color: textcolor.withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ],
  );
}
