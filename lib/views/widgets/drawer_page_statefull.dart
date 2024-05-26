import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DrawerPageStateFull extends StatefulWidget {
  const DrawerPageStateFull({Key? key}) : super(key: key);

  @override
  _DrawerPageStateFullState createState() => _DrawerPageStateFullState();
}

class _DrawerPageStateFullState extends State<DrawerPageStateFull> {
  static const String _appTitle = 'Inicio';
  static const String _drawerHeaderTitle = 'BIENVENIDOS';
  static const String _drawerHeaderSubtitle = 'Tostadora digital';
  static const String _tostionTypeTitle = 'Tipo de Tostión';
  static const String _tostionTypeHigh = 'Alto';
  static const String _tostionTypeMedium = 'Medio';
  static const String _tostionTypeLow = 'Bajo';
  static const String _graphTitle = 'Gráfica';
  static const String _forgotPasswordTitle = '¿Olvidó su contraseña?';

  final List<String> _imageUrls = [
    'https://img.freepik.com/premium-vector/digital-coffee-logo-template-design_316488-1278.jpg',
    'https://perfectdailygrind.com/wp-content/uploads/2020/11/Genio-Roasters-4.jpg',
    
  ];

  final List<String> _descriptions = [
    'Banner',
    'Tostadora de café',
   
  ];

  String _selectedTostionType = _tostionTypeHigh;
  bool _showTostionButtons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          _appTitle,
          style: TextStyle(
            fontFamily: 'Pacifico',
            color: Colors.blue,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerHeader(),
            ListTile(
              leading: const Icon(Icons.wifi),
              title: const Text(_tostionTypeTitle),
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
              title: const Text(_graphTitle),
              onTap: () {
                // Acción al hacer clic en "Gráfica"
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text(_forgotPasswordTitle),
              onTap: () {
                // Acción al hacer clic en "¿Olvidó su contraseña?"
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Acción al hacer clic en "Logout"
                context.go('/');
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: _imageUrls.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          _descriptions[_imageUrls.indexOf(imageUrl)],
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Color(0xFF0066CC),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.0),
          Text(
            _drawerHeaderTitle,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            _drawerHeaderSubtitle,
            style: TextStyle(
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
