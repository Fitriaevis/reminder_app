import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suplis_app/auth/auth_service.dart'; // Import AuthService
import 'package:suplis_app/pages/login_page.dart';
import 'package:suplis_app/pages/profile_petugas.dart';
import 'package:suplis_app/pages/list_data_petugas.dart';
import 'package:suplis_app/pages/list_notifikasi.dart';
import 'package:suplis_app/pages/register_page.dart';
import 'package:suplis_app/navigasi/theme_provider.dart';
import 'package:suplis_app/navigasi/app_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeProvider()), // Provide ThemeProvider
        Provider(create: (_) => AuthService()), // Provide AuthService
      ],
      child: MaterialApp(
        title: 'Suplis App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/login', // Set initial route to LoginPage
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => AppNavigation(),
          '/profile': (context) => ProfilePetugas(),
          '/listData': (context) => ListDataPetugas(),
          '/listNotifikasi': (context) => ListNotifikasi(),
        },
      ),
    );
  }
}
