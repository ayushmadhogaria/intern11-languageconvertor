import 'package:flutter/material.dart';
import 'package:intern11/data/provider.dart';
import 'package:provider/provider.dart';
import 'screen/app_widgets.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => LanguageProvider(),
    child: const MyApp(),
  ));
}
