import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExpensesScreen extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Despesas'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('despesas').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          
          final despesas = snapshot.data!.docs; // O uso de '!' indica que estamos garantindo que `docs` não é nulo.
          List<Widget> expenseWidgets = [];
          
          for (var despesa in despesas) {
            final titulo = despesa['titulo'];
            final valor = despesa['valor'];
            expenseWidgets.add(ListTile(
              title: Text(titulo),
              subtitle: Text('R\$ $valor'),
            ));
          }
          
          return ListView(children: expenseWidgets);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add_expense');
        },
      ),
    );
  }
}
