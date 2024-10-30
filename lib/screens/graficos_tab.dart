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
          Text(
            "Total de Gastos",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 3500,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.blueGrey,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        'R\$ ${rod.y.toStringAsFixed(2)}',
                        TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return "Janeiro";
                        case 1:
                          return "Fevereiro";
                        case 2:
                          return "Março";
                        default:
                          return "";
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitles: (double value) {
                      if (value % 500 == 0) {
                        return 'R\$ ${value.toInt()}';
                      }
                      return '';
                    },
                  ),
                ),
                gridData: FlGridData(show: true, drawVerticalLine: false),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide(color: Colors.black, width: 1),
                    bottom: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                barGroups: [
                  BarChartGroupData(x: 0, barRods: [
                    BarChartRodData(
                      y: 3000,
                      width: 15,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ]),
                  BarChartGroupData(x: 1, barRods: [
                    BarChartRodData(
                      y: 900,
                      width: 15,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ]),
                  BarChartGroupData(x: 2, barRods: [
                    BarChartRodData(
                      y: 500,
                      width: 15,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Gastos por Categoria",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
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
