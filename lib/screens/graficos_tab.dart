import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraficosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total de Gastos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                barGroups: [
                  BarChartGroupData(x: 0, barRods: [BarChartRodData(y: 3000, width: 15)]),
                  BarChartGroupData(x: 1, barRods: [BarChartRodData(y: 900, width: 15)]),
                  BarChartGroupData(x: 2, barRods: [BarChartRodData(y: 500, width: 15)]),
                ],
                titlesData: FlTitlesData(show: true),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text("Gastos por Categoria", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ListTile(
            title: Text('Educação'),
            trailing: Text('R\$ 769,00'),
          ),
          ListTile(
            title: Text('Saúde'),
            trailing: Text('R\$ 99,90'),
          ),
          ListTile(
            title: Text('Lazer'),
            trailing: Text('R\$ 21,90'),
          ),
        ],
      ),
    );
  }
}
