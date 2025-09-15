import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Đây là trang thông tin về ứng dụng",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
