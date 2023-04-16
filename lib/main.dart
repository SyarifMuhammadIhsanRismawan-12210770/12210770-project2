import 'package:flutter/material.dart';
import 'package:pendataanwarga/providers/dashboard_provider.dart';
import 'package:pendataanwarga/views/login_view.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (bc) => DashboardProvider()),
      ChangeNotifierProvider(create: (bc) => BeritaPanelProvider()),
      ChangeNotifierProvider(create: (bc) => BeritaLoadDataProvider()),
    ],
    builder: (context, widget) {
      return MaterialApp(
        theme:
            ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.orange)),
        home: LoginView(),
      );
    },
  ));
}
