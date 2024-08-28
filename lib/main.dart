import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:suplis_app/pages/login_page.dart';
import 'package:suplis_app/pages/profile_petugas.dart';
import 'package:suplis_app/pages/list_data_pelanggan.dart';
import 'package:suplis_app/pages/list_notifikasi.dart';
import 'package:suplis_app/pages/register_page.dart';
import 'package:suplis_app/navigasi/theme_provider.dart';
import 'package:suplis_app/navigasi/app_navigation.dart';
import 'package:suplis_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suplis App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthWrapper(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => AppNavigation(),
        '/profile': (context) => ProfilePetugas(),
        '/listData': (context) => ListDataPelanggan(),
        '/listNotifikasi': (context) => ListNotifikasi(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<User?>(context);

    if (user == null) {
      return const LoginPage();
    } else {
      return AppNavigation(); // Or whichever is the home page
    }
  }
}
