import 'package:chatmobile/services/get_chat.dart';
import 'package:chatmobile/services/send_message.dart';
import 'package:chatmobile/theme/color.dart';
import 'package:chatmobile/variables/home.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void initState() {
    super.initState();
    getChatFun(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cheete",
                  style: GoogleFonts.poppins(
                      color: textcolor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.menu,
                  color: textcolor,
                  size: 20,
                )
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: messageList,
              builder: (context, value, child) {
                return CosmosBody(
                  scrollable: true,
                  scrollDirection: Axis.vertical,
                  children: value,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: width(context),
            decoration: BoxDecoration(
              color: cColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    controller: chatMessageController,
                    cursorColor: defaulColor,
                    style: TextStyle(color: textcolor, fontSize: 12),
                    decoration: InputDecoration(
                      hintText: "mesaj yaz...",
                      hintStyle: TextStyle(
                          color: textcolor.withOpacity(0.7), fontSize: 12),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (chatMessageController.text.length > 0) {
                        sendMessageBtnVisible.value = true;
                      } else {
                        sendMessageBtnVisible.value = false;
                      }
                    },
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: sendMessageBtnVisible,
                  builder: (context, value, child) {
                    return GestureDetector(
                      onTap: () async {
                        if (value == true) {
                          await sendMessage(context);
                        }
                      },
                      child: Opacity(
                        opacity: value == true ? 1 : 0.5,
                        child: const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
