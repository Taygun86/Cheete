import 'package:chatmobile/page/login.dart';
import 'package:chatmobile/services/register.dart';
import 'package:chatmobile/theme/color.dart';
import 'package:chatmobile/variables/register.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class registers extends StatelessWidget {
  const registers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Spacer(),
          Icon(
            Icons.chat_outlined,
            color: defaulColor,
            size: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
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
                      Icon(
                        Icons.person_2,
                        color: defaulColor,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextField(
                          controller: registerNameController,
                          cursorColor: defaulColor,
                          style: TextStyle(color: textcolor, fontSize: 12),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: "Kullanıcı Adı",
                            hintStyle: TextStyle(
                                color: textcolor.withOpacity(0.7),
                                fontSize: 12),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
                      Icon(
                        Icons.email,
                        color: defaulColor,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: registerEmailController,
                          cursorColor: defaulColor,
                          style: TextStyle(color: textcolor, fontSize: 12),
                          decoration: InputDecoration(
                            hintText: "E-Posta",
                            hintStyle: TextStyle(
                                color: textcolor.withOpacity(0.7),
                                fontSize: 12),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
                      Icon(
                        Icons.password,
                        color: defaulColor,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable: passwordVisibleIcon,
                          builder: (context, value, child) {
                            return TextField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText:
                                  passwordVisibleIcon.value == Icons.visibility
                                      ? false
                                      : true,
                              controller: registerPasswordController,
                              cursorColor: defaulColor,
                              style: TextStyle(color: textcolor, fontSize: 12),
                              decoration: InputDecoration(
                                hintText: "Şifre",
                                hintStyle: TextStyle(
                                    color: textcolor.withOpacity(0.7),
                                    fontSize: 12),
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      ValueListenableBuilder(
                        valueListenable: passwordVisibleIcon,
                        builder: (context, value, child) {
                          return GestureDetector(
                            onTap: () {
                              if (passwordVisibleIcon.value ==
                                  Icons.visibility) {
                                passwordVisibleIcon.value =
                                    Icons.visibility_off;
                              } else {
                                passwordVisibleIcon.value = Icons.visibility;
                              }
                            },
                            child: Icon(
                              value,
                              color: defaulColor,
                              size: 25,
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
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              await registerServices(
                context,
                registerNameController.text,
                registerEmailController.text,
                registerPasswordController.text,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: width(context),
              decoration: BoxDecoration(
                color: navcolor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "Kayıt Ol",
                  style: GoogleFonts.poppins(
                      color: textcolor.withOpacity(0.7),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              CosmosNavigator.pushFromRightToLeft(context, const logins());
            },
            child: Text(
              "Hesabınız Var İse Giriş Yapın",
              style: GoogleFonts.poppins(
                  color: defaulColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Text(
            "Cheete Proje Ödevi",
            style: GoogleFonts.poppins(
                color: Colors.orange,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
