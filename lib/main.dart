import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled6/prefe/shared_pref_controller.dart';
import 'package:untitled6/screens/image/images_screen.dart';
import 'package:untitled6/screens/image/upload_image_screen.dart';
import 'package:untitled6/screens/launch_screen.dart';
import 'package:untitled6/screens/login_screen.dart';
import 'package:untitled6/screens/register_screen.dart';
import 'package:untitled6/screens/users_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/users_screen': (context) => const UsersScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/register_screen': (context) => const RegisterScreen(),
        '/images_screen': (context) => const ImagesScreen(),
        '/upload_image_screen': (context) => const UploadImageScreen(),
      },
    );
  }
}
