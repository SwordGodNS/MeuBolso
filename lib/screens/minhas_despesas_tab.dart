import 'package:flutter/material.dart';

class MinhasDespesasTab extends StatefulWidget {
  @override
  _MinhasDespesasTabState createState() => _MinhasDespesasTabState();
}

class _MinhasDespesasTabState extends State<MinhasDespesasTab> {
  String selectedMonth = 'OUT';
  Map<String, List<Map<String, String>>> expensesByMonth = {
    'AGO': [
      {'title': 'Academia', 'category': 'Saúde', 'amount': '89,90'},
      {'title': 'Café', 'category': 'Alimentação', 'amount': '15,50'},
    ],
    'SET': [
      {'title': 'Curso Online', 'category': 'Educação', 'amount': '150,00'},
      {'title': 'Restaurante', 'category': 'Alimentação', 'amount': '45,90'},
    ],
    'OUT': [
      {'title': 'Spotify', 'category': 'Lazer', 'amount': '21,90'},
      {'title': 'Faculdade', 'category': 'Educação', 'amount': '789,00'},
    ],
    'NOV': [
      {'title': 'Academia', 'category': 'Saúde', 'amount': '89,90'},
      {'title': 'Supermercado', 'category': 'Alimentação', 'amount': '300,00'},
    ],
    'DEZ': [
      {'title': 'Cinema', 'category': 'Lazer', 'amount': '45,00'},
      {'title': 'Livros', 'category': 'Educação', 'amount': '120,00'},
    ],
  };

  void _addExpense(String title, String amount, String category) {
    setState(() {
      expensesByMonth[selectedMonth] ??= [];
      expensesByMonth[selectedMonth]!.add({
        'title': title,
        'amount': amount,
        'category': category,
      });
    });
  }

  void _showAddExpenseDialog() {
    String title = '';
    String amount = '';
    String category = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Nova Despesa"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Título da Despesa"),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Valor"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  amount = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Categoria"),
                onChanged: (value) {
                  category = value;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty && amount.isNotEmpty && category.isNotEmpty) {
                  _addExpense(title, amount, category);
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Preencha todos os campos")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

  void _selectMonth(String month) {
    setState(() {
      selectedMonth = month;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['AGO', 'SET', 'OUT', 'NOV', 'DEZ'].map((month) {
                return GestureDetector(
                  onTap: () => _selectMonth(month),
                  child: Text(
                    month,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: month == selectedMonth ? Colors.orange : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: expensesByMonth[selectedMonth]?.length ?? 0,
              itemBuilder: (context, index) {
                final expense = expensesByMonth[selectedMonth]![index];
                return ListTile(
                  title: Text(expense['title']!),
                  subtitle: Text(expense['category']!),
                  trailing: Text('R\$ ${expense['amount']}'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddExpenseDialog,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
