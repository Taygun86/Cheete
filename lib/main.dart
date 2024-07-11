import 'dart:async';

import 'package:chatmobile/firebase_options.dart';
import 'package:chatmobile/page/home.dart';
import 'package:chatmobile/page/login.dart';
import 'package:cosmos/cosmos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const chatapp());
}

// ignore: camel_case_types
class chatapp extends StatelessWidget {
  const chatapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CosmosFirebase.isSignedIn() ? const Login() : const logins(),
    );
  }
}
