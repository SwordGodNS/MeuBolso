import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),

            // Imagem de introdução principal
            Center(
              child: Image.asset(
                'assets/images/intro_image.png', // Caminho da imagem de introdução
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 32),

            // Logo do porquinho e nome do app
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    'assets/images/piggy_bank2_icon.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 4),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Meu',
                        style: TextStyle(
                          fontFamily: '',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Bolso',
                        style: TextStyle(
                          fontFamily: 'Alexandria',
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEF6B00),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 0),

            // Texto de introdução
            const Text(
              'Controle seu dinheiro de forma fácil e inteligente',
              style: TextStyle(
                fontFamily: 'Alexandria',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Nosso app te ajuda a acompanhar seus gastos, organizar seu orçamento e planejar suas finanças de forma prática e intuitiva.',
              style: TextStyle(
                fontFamily: 'Alexandria',
                fontSize: 13,
                color: Colors.black54,
              ),
            ),

            const Spacer(),

            // Botão de Login
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF6B00),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Alexandria',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Botão de Registro
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(color: Colors.black54),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  'Registrar',
                  style: TextStyle(
                    fontFamily: 'Alexandria',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
