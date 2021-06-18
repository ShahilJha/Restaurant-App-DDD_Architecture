import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/injection.dart';
import 'package:restaurant_app/presentation/core/app_widget.dart';

//TODO: undo main() async, handle the Firebase.initializeApp()
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
