import 'package:flutter/material.dart';

class PerfilTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.person, size: 50, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Nome",
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                  },
                ),
              ),
              readOnly: false,
              controller: TextEditingController(text: "Regis dos Anjos"),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "E-mail",
              ),
              readOnly: true,
              controller: TextEditingController(text: "gremioeminhapaxao@gmail.com"),
            ),
            SizedBox(height: 10),
            Text("Membro desde: 24/10/2024"),
            Text("Despesas Cadastradas: 22"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RedefinirSenhaScreen()),
                );
              },
              child: Text("Redefinir Senha"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/intro', (route) => false);
              },
              child: Text("Sair", style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Deletar Conta"),
                    content: Text("Tem certeza que deseja excluir a conta?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, '/intro', (route) => false);
                        },
                        child: Text("Deletar", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Deletar Conta", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}

class RedefinirSenhaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String senha = '';
    String confirmarSenha = '';

    return Scaffold(
      appBar: AppBar(
        title: Text("Redefinir Senha"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => senha = value,
              decoration: InputDecoration(
                labelText: "Nova Senha",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) => confirmarSenha = value,
              decoration: InputDecoration(
                labelText: "Confirmar Nova Senha",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (senha == confirmarSenha) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Senha redefinida com sucesso!")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("As senhas não coincidem")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: Text("Salvar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
