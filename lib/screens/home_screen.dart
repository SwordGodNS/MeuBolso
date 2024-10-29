import 'package:flutter/material.dart';
import 'minhas_despesas_tab.dart';
import 'perfil_tab.dart';
import 'graficos_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bem-Vindo, Regis"),
        backgroundColor: Colors.orange,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Gráficos"),
            Tab(text: "Minhas Despesas"),
            Tab(text: "Perfil"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GraficosTab(),
          MinhasDespesasTab(),
          PerfilTab(),
        ],
      ),
    );
  }
}
