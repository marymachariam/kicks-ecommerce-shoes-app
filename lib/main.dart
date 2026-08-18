import 'package:flutter/material.dart';
import 'package:kicks/model/cart.dart';
import 'package:kicks/screens/login_screen.dart';
import 'package:kicks/services/auth_api.dart';
import 'package:kicks/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => AuthViewmodel(AuthApi())), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kicks App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
