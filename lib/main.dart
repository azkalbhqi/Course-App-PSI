
import 'package:courses_app/components/featurescreen/welcome_screen.dart';
import 'package:courses_app/components/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:courses_app/components/authscreen/signup_screen.dart';
import 'package:courses_app/components/authscreen/signin_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const MyApp());
}

Future<void> initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase initialized successfully");
  } catch (e) {
    print("Firebase initialization error: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Courses App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/welcome',
      routes: {
        '/signup': (context) => SignupScreen(),
        '/welcome':(context) => const WelcomeScreen(),
        '/signin': (context) => SignInScreen(),
        '/home': (context) => const MainScreen(),
        '/error': (context) => const ErrorScreen(),
      },
    );
  }
}

class FirebaseInitializationWrapper extends StatelessWidget {
  const FirebaseInitializationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SignupScreen();
        }
        if (snapshot.hasError) {
          return const ErrorScreen();
        }
        return const LoadingScreen();
      },
    );
  }
}

// A simple error screen to handle initialization errors
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Error initializing Firebase. Please try again later.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/signup');
              },
              child: const Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}

// A loading screen with a spinner while waiting for Firebase to initialize
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
