import 'package:flutter/material.dart';

class MinhasDespesasTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['AGO', 'SET', 'OUT', 'NOV', 'DEZ']
                .map((month) => Text(month, style: TextStyle(fontWeight: FontWeight.bold)))
                .toList(),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Academia'),
            subtitle: Text('Saúde'),
            trailing: Text('R\$ 89,90'),
          ),
          ListTile(
            title: Text('Spotify'),
            subtitle: Text('Lazer'),
            trailing: Text('R\$ 21,90'),
          ),
          ListTile(
            title: Text('Faculdade'),
            subtitle: Text('Educação'),
            trailing: Text('R\$ 789,00'),
          ),
          SizedBox(height: 20),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => NovaDespesaDialog(),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}

class NovaDespesaDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Nova Despesa"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(decoration: InputDecoration(labelText: "Título da Despesa")),
          TextField(decoration: InputDecoration(labelText: "Valor")),
          TextField(decoration: InputDecoration(labelText: "Categoria")),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Salvar"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        ),
      ],
    );
  }
}
