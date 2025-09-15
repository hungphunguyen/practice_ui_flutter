import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Đây là trang hồ sơ cá nhân",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
