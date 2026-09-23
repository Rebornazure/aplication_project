// import 'package:aplication_project/Components/Custom_MyTextField.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController txtUsername = TextEditingController();
//   TextEditingController txtPassword = TextEditingController();
//   String statusLogin = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("My Login Page")),
//       body: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.all(10),
//             child: MyTextField(
//               txtController: txtUsername,
//               myHint: "input username",
//               Radius: 10,
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(10),
//             child: MyTextField(
//               txtController: txtPassword,
//               myHint: "input password",
//               Radius: 10,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     String username = txtUsername.text.toString();
//                     String password = txtPassword.text.toString();
//                     if (username == "admin" && password == "admin") {
//                       print("sukses login");
//                       statusLogin = "sukses login admin";
//                     } else {
//                       print("gagal login");
//                       statusLogin = "gagal login admin";
//                     }
//                   });
//                 },
//                 child: const Text(
//                   "Login",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Color.fromARGB(255, 5, 165, 66),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               ElevatedButton(onPressed: () {}, child: const Text("Register")),
//             ],
//           ),
//           Text("status login : " + statusLogin, style: const TextStyle(fontSize: 30)),
//         ],
//       ),
//     );
//   }
// }