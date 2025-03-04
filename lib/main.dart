import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signup_page.dart';
import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise Firebase avec la configuration spécifique à notre projet Web.
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAYUzXGnWZZWKifgBG2H13mAnTJ0kXqshY",
      authDomain: "ecommerce-7ef00.firebaseapp.com",
      projectId: "ecommerce-7ef00",
      storageBucket: "ecommerce-7ef00.firebasestorage.app",
      messagingSenderId: "32676576212",
      appId: "1:32676576212:web:f341aa6b76e70e9fd93441",
      measurementId: "G-7B9FDCENSR",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Inscription',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/signup', // Page d'inscription comme point d'entrée
      routes: {
        '/signup': (context) => const SignUpPage(), // Route vers la page d'inscription
        '/login': (context) => const LoginPage(), // Route vers la page de connexion
      },
    );
  }
}

