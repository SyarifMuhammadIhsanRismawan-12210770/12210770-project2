import 'package:flutter/material.dart';
import 'package:pendataanwarga/providers/dashboard_provider.dart';
import 'package:pendataanwarga/providers/peta_provider.dart';
import 'package:pendataanwarga/views/login_view.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (bc) => DashboardProvider()),
      ChangeNotifierProvider(create: (bc) => BeritaPanelProvider()),
      ChangeNotifierProvider(create: (bc) => BeritaLoadDataProvider()),
      ChangeNotifierProvider(create: (bc) => PetaProvider()),
    ],
    builder: (context, widget) {
      context.read<PetaProvider>().mulai_bacalokasi();
      return MaterialApp(
        theme:
            ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.orange)),
        home: LoginView(),
      );
    },
  ));
}
