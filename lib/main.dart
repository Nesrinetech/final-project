
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'onboarding_page.dart';
import 'home_page.dart';
import 'sign_in_page.dart';
import 'sign_up_page.dart';
import 'vendors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializing Supabase 
  await Supabase.initialize(
    url: 'https://tcehmwhmsezjrpnhlflb.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRjZWhtd2htc2V6anJwbmhsZmxiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgzMTc4NTYsImV4cCI6MjA3Mzg5Mzg1Nn0.DrSoU8ihXgUxhD5S-mkTVOXE32-fcjQ0DWShVEuvtLY',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
    

    home: const SplashWrapper(),

      routes: {
        '/onboarding': (_) => const OnboardingPage(),
        '/home': (_) => const HomePage(),
        '/homepage': (_) => const HomePage(),
        '/signin': (_) => const SignInPage(),
        '/signup': (_) => const SignUpPage(),
        '/vendors': (_) => const Vendors(),
      },
    );
  }
}

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});
  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  final _supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
     
    Timer(const Duration(seconds: 3), _checkSessionAndNavigate);
  }

  Future<void> _checkSessionAndNavigate() async {
    
    final session = _supabase.auth.currentSession;

    if (session != null) {
       
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/homepage');
      return;
    }

    
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed('/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF54408C), // #54408C
      body: Center(
        child: SvgPicture.asset(
          'assets/Logo.svg',
          width: 180,
          height: 180,
        ),
      ),
    );
  }
}


