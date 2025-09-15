import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy email từ arguments
    final email = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black54,
        shape: Border(
          bottom: BorderSide(
            color: const Color.fromARGB(226, 189, 188, 188), // màu viền
            width: 2.0,
          ),
        ),
        elevation: 4.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/login",
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Xin chào, ${email}!"),
            // phân này để tạo khoảng cách giữa text và nút
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/profile");
              },
              child: const Text("Go to Profile"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/settings");
              },
              child: const Text("Go to Settings"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/about");
              },
              child: const Text("Go to About"),
            ),
          ],
        ),
      ),
    );
  }
}
