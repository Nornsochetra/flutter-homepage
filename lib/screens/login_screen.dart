import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isOpen = true;

  void _togglePassword() {
    _isOpen = !_isOpen;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Image.asset('assets/logo/carrot.png'),
          Text(
            "Sign In",
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Enter your email and password",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          // email field
          TextFormField(
            controller: _emailController,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
                if(value == null || value.replaceAll('', '').isEmpty){
                    return 'email is required';
                }
                RegExp exp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if(!exp.hasMatch(value)){
                    return 'Please eneter valid email format!';
                }
                return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'john@example.com',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusColor: Colors.black,
              floatingLabelStyle: TextStyle(color: Colors.black, fontSize: 16),
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
              ),
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
              contentPadding: EdgeInsets.all(16),
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          // password field
          TextFormField(
            controller: _passwordController,
            obscureText: _isOpen,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
                if(value == null || value.isEmpty){
                    return 'password is required';
                }
                RegExp exp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@!%&#])[A-Za-z\d$@!%&#]{8,}$');
                if(!exp.hasMatch(value)){
                    return 'Please put strong password!';
                }
                return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: '********',
              suffixIcon: IconButton(onPressed: () {
                _togglePassword();
              }, icon: Icon(_isOpen ? Icons.visibility_off : Icons.visibility)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusColor: Colors.black,
              floatingLabelStyle: TextStyle(color: Colors.black, fontSize: 16),
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
              ),
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
              contentPadding: EdgeInsets.all(16),
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
