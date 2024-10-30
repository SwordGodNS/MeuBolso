import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool isLoading = false;

  Future<void> register() async {
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('As senhas não coincidem')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    Navigator.pushNamedAndRemoveUntil(context, '/intro', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey.shade200,
                    child: Image.asset(
                      'assets/images/piggy_bank2_icon.png',
                      width: 90,
                      height: 90,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Cadastro',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Digite suas informações pessoais',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _buildTextField('Nome', 'Digite seu nome', (value) => name = value),
            const SizedBox(height: 20),
            _buildTextField('E-mail', 'Digite seu e-mail', (value) => email = value),
            const SizedBox(height: 20),
            _buildTextField('Senha', 'Digite sua senha', (value) => password = value, isPassword: true),
            const SizedBox(height: 20),
            _buildTextField('Confirmar Senha', 'Digite sua senha novamente', (value) => confirmPassword = value, isPassword: true),
            const SizedBox(height: 30),
            Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEF6B00),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Registrar',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, Function(String) onChanged, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        const SizedBox(height: 10),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: isPassword,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
