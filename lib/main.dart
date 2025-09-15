import 'package:flutter/material.dart';
import 'features/auth/login/login_page.dart';
import 'features/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // constructor, super.key để Flutter quản lý key

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // tắt banner debug
      // App kiểu Material Design
      title: 'UI Practice', // title hiển thị khi app switch task
      // Theme định nghĩa style chung cho toàn app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ), // set màu chủ đạo
        useMaterial3: true, // sử dụng Material 3
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(), // set border cho TextField
        ),
      ),

      // Route mặc định khi mở app
      initialRoute: "/login",

      // Khai báo danh sách routes
      routes: {
        '/login': (_) => const LoginPage(), // màn login
        '/home': (_) => const HomePage(), // màn home
      },
    );
  }
}
