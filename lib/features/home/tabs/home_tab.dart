import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // chào mừng người dùng
        Column(
          children: [
            const Icon(
              Icons.account_circle,
              size: 58,
              color: Color.fromARGB(255, 236, 165, 219),
            ),
            const SizedBox(width: 8),
            Column(
              children: [
                Text(
                  "Chào mừng bạn đến với ứng dụng!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  "Chúc bạn một ngày tốt lành!",
                  style: TextStyle(fontSize: 16, color: Colors.pink[600]),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
