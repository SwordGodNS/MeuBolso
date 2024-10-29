import 'package:flutter/material.dart';

class PerfilTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            decoration: InputDecoration(labelText: "Nome", suffixIcon: Icon(Icons.edit)),
            readOnly: true,
            controller: TextEditingController(text: "Regis dos Anjos"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "E-mail", suffixIcon: Icon(Icons.edit)),
            readOnly: true,
            controller: TextEditingController(text: "gremioeminhapaxao@gmail.com"),
          ),
          SizedBox(height: 10),
          Text("Membro desde: 24/10/2024"),
          Text("Despesas Cadastradas: 22"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text("Redefinir Senha"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text("Sair", style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Deletar Conta", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
