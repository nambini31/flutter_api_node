import 'package:flutter/material.dart';
import 'package:flutter_api_node/connect/screens/home_screen.dart';
import 'package:flutter_api_node/connect/screens/login_screen.dart';
import 'package:flutter_api_node/connect/screens/register_screen.dart';
import 'package:flutter_api_node/connect/screens/splash_screen.dart';
import 'package:flutter_api_node/connect/utils/utils.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Win Edge',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Utils.primary),
                useMaterial3: false,
            ),
            home: const SplashScreen(),
            routes: {
                '/splashscreen': (context) => const SplashScreen(),
                '/login': (context) => const Login(),
                '/register': (context) => const Register(),
                '/home' : (context) => const HomeScreen(),
            }
        );
    }
}


