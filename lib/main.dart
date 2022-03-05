import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseconnectionsetup/FirebaseSetUp/pages/firestore.page.dart';
import 'package:firebaseconnectionsetup/app/app_widget/app_widget.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
