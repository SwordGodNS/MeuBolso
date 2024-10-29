import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  String nome = '';
  String email = '';
  String senha = '';
  String confirmarSenha = '';

  bool isLoading = false;
  bool isSuccess = false;

  Future<void> registrar() async {
    setState(() {
      isLoading = true;
      isSuccess = false;
    });

    if (senha == confirmarSenha) {
      try {
        print("Tentando registrar o usuário...");
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: senha,
        );

        if (userCredential.user != null) {
          setState(() {
            isLoading = false;
            isSuccess = true;
          });

          Navigator.of(context).pushNamedAndRemoveUntil('/intro', (Route<dynamic> route) => false);
        } else {
          throw Exception("Registro falhou, nenhum usuário retornado.");
        }
      } on FirebaseAuthException catch (e) {
        print('Erro específico de FirebaseAuth: ${e.message}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao registrar: ${e.message}')),
        );
      } catch (e) {
        print('Erro específico: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao registrar: ${e.toString()}')),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('As senhas não coincidem')),
      );
      setState(() {
        isLoading = false;
      });
    }
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
        toolbarHeight: 40,
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
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Digite suas informações pessoais',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _buildTextField('Nome', 'Digite seu nome', (value) => nome = value),
            const SizedBox(height: 20),
            _buildTextField('E-mail', 'Digite seu e-mail', (value) => email = value),
            const SizedBox(height: 20),
            _buildTextField('Senha', 'Digite sua senha', (value) => senha = value, isPassword: true),
            const SizedBox(height: 20),
            _buildTextField('Confirmar Senha', 'Digite sua senha novamente', (value) => confirmarSenha = value, isPassword: true),
            const SizedBox(height: 30),
            Center(
              child: isLoading
                  ? isSuccess
                      ? const Icon(Icons.check_circle, color: Colors.green, size: 50)
                      : const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: registrar,
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
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade600),
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
