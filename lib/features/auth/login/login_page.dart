import 'package:flutter/material.dart';

// LoginPage cần state (loading, ẩn hiện mật khẩu) => StatefulWidget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState(); // tạo state riêng
}

class _LoginPageState extends State<LoginPage> {
  // key để quản lý form (dùng cho validate)
  final _formKey = GlobalKey<FormState>();

  // controller để lấy giá trị từ TextField
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _correctEmail = "admin@gmail.com";
  final _correctPassword = "admin123";

  // Hàm submit form
  void _submit() async {
    // nếu form hợp lệ
    if (!(_formKey.currentState?.validate() ?? false)) return;
    // giải thích đoạn đoán tử nếu formKey.currentState là null thì với ? sẽ chấp nhận giá trị null
    // Nếu không null thì sẽ gọi hàm validate() tiếp đến gắn ! vào để phủ định kết quả => false hàm sẽ được chạy tiếp tục mà không return
    // nếu null thì với ?? sẽ trả về false => phủ định ! thành true => return luôn

    // so sánh input login để đăng nhập
    if (_emailController.text.trim() == _correctEmail &&
        _passwordController.text.trim() == _correctPassword) {
      // .text → lấy giá trị hiện tại trong ô nhập email/mật khẩu

      Navigator.pushReplacementNamed(
        context,

        //Navigator quản lý stack màn hình trong Flutter.
        //pushReplacementNamed có nghĩa là:
        //Thay màn hình hiện tại bằng một màn hình mới.
        //Tức là màn hình login sẽ bị gỡ khỏi stack và thay bằng "/home".
        //Người dùng không thể ấn nút back để quay lại login nữa → chuẩn flow login thực tế.
        "/home",

        arguments: _emailController.text.trim(),
        // Truyền dữ liệu (ở đây là email người dùng nhập) sang màn hình "/home".
      );
    } else {
      //ScaffoldMessenger là class quản lý SnackBar (cái thông báo nhỏ trượt từ dưới màn hình lên).
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Sai email hoặc mật khẩu!")));
      // hiện thông báo lỗi nếu sai email hoặc mật khẩu
      //SnackBar(...): widget hiển thị thông báo nhỏ trượt từ dưới màn hình lên
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Đăng nhập",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ), // tiêu đề AppBar
        centerTitle: true, // căn giữa tiêu đề
        elevation: 7.0, // độ nổi của AppBar (bóng đổ)
        shadowColor: Colors.black54, // màu bóng
        shape: Border(
          // viền dưới AppBar
          bottom: BorderSide(
            color: const Color.fromARGB(226, 189, 188, 188), // màu viền
            width: 2.0, // độ dày viền
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // padding quanh body

        child: Form(
          key: _formKey, // gán key cho form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // canh giữa cột
            children: [
              // tạo icon lớn ở trên cùng
              const Icon(
                Icons.account_circle,
                size: 150,
                color: Color.fromARGB(255, 124, 33, 243),
              ),

              const SizedBox(height: 110), // khoảng cách giữa icon và TextField
              // field email
              TextFormField(
                controller: _emailController, // gán controller
                decoration: const InputDecoration(
                  labelText: "Email", // label
                  prefixIcon: Icon(Icons.email), // icon bên trái
                ),
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Vui lòng nhập email"
                      : null;
                },
                // nếu trống thì báo lỗi
              ),
              const SizedBox(height: 16), // khoảng cách giữa 2 TextField
              // field mật khẩu
              TextFormField(
                controller: _passwordController, // gán controller
                obscureText: true, //  ẩn ký tự nhập vào
                decoration: const InputDecoration(
                  labelText: "Mật khẩu", // label
                  prefixIcon: Icon(Icons.lock), // icon bên trái
                ),
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Vui lòng nhập mật khẩu"
                      : null;
                  // nếu trống thì báo lỗi
                },
              ),
              const SizedBox(height: 16), // khoảng cách giữa 2 TextField
              // nút đăng nhập
              ElevatedButton(
                onPressed: _submit,
                // onPressed yêu cầu một callback có kiểu void Function()?, tức là một hàm không nhận tham số và trả về void
                // onPressed: _submit, = truyền callback → chạy khi nhấn nút.
                // Nếu cần truyền tham số → dùng () => ....(dùng lambda)
                child: const Text("Đăng nhập"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
