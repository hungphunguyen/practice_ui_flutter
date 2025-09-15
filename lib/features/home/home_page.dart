import 'package:flutter/material.dart';
import 'tabs/home_tab.dart';
import 'tabs/profile_tab.dart';
import 'tabs/settings_tab.dart';
import 'tabs/about_tab.dart';

// Vì cần lưu tab index nên phải dùng StatefulWidget.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // lưu tab hiện tại đang chọn (index trong _pages)
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeTab(),
    const ProfileTab(),
    const SettingsTab(),
    const AboutTab(),
  ];

  // ham chuyen tab
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // cập nhật tab đang chọn → rebuild UI
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lấy email từ arguments
    // giao diện chính
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
      // Body sẽ hiển thị màn hình tương ứng với tab đang chọn
      body: Center(child: _pages[_currentIndex]),
      // Thanh điều hướng dưới cùng
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // fixed: các tab có label hiện đủ (dùng cho 3–5 tab)
        // shifting: khi chọn tab thì label/icon đổi màu to hơn
        currentIndex: _currentIndex, // tab nào đang active

        onTap: _onTabTapped, // callback khi user bấm tab
        // Danh sách item trong thanh navigation
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
      ),
    );
  }
}
