import 'package:flutter/material.dart';

class DrawerPageStateFull extends StatefulWidget {
  const DrawerPageStateFull({Key? key}) : super(key: key);

  @override
  _DrawerPageStateFullState createState() => _DrawerPageStateFullState();
}

class _DrawerPageStateFullState extends State<DrawerPageStateFull> {
  static const String _appTitle = 'INICIO';
  static const String _drawerHeaderTitle = 'BIENVENIDOS';
  static const String _drawerHeaderSubtitle = 'Tostadora digital';
  static const String _tostionTypeTitle = 'Tipo de Tostión';
  static const String _tostionTypeHigh = 'Alto';
  static const String _tostionTypeMedium = 'Medio';
  static const String _tostionTypeLow = 'Bajo';
  static const String _graphTitle = 'Gráfica';

  String _selectedTostionType = _tostionTypeHigh;
  bool _showTostionButtons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerHeader(),
            ListTile(
              leading: const Icon(Icons.wifi),
              title: Text(_tostionTypeTitle),
              onTap: () {
                setState(() {
                  _showTostionButtons = !_showTostionButtons;
                });
              },
            ),
            if (_showTostionButtons)
              Column(
                children: [
                  _buildTostionButton(_tostionTypeHigh),
                  _buildTostionButton(_tostionTypeMedium),
                  _buildTostionButton(_tostionTypeLow),
                ],
              ),
            ListTile(
              leading: const Icon(Icons.show_chart),
              title: Text(_graphTitle),
              onTap: () {
                // Acción al hacer clic en "Gráfica"
              },
            ),
            const Divider(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Logout'),
                  onTap: () {
                    // Acción al hacer clic en "Logout"
                    Navigator.pop(context); // Cerrar el Drawer
                    // Realizar la acción de logout y navegar a la ruta '/'
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Tipo de Tostión - $_selectedTostionType'),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Color(0xFF0066CC),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40.0),
          Text(
            _drawerHeaderTitle,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            _drawerHeaderSubtitle,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTostionButton(String tostionType) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedTostionType = tostionType;
          _showTostionButtons = false;
        });
      },
      child: Text(tostionType),
    );
  }
}
