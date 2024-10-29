import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/introscreen.dart'; // Import da tela de introdução
import 'screens/login_screen.dart'; // Import da tela de login
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicializa o Firebase antes de executar o aplicativo
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeuBolso',
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/intro': (context) => const IntroScreen(), // Tela de introdução
        '/login': (context) => const LoginScreen(), // Tela de login
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(), // Navegação principal
      },
    );
  }
}
