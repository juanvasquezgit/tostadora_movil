import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = '';

  Future<void> _register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      
      // Registro exitoso
      setState(() {
        _message = 'Registro exitoso!';
      });

      await Future.delayed(const Duration(seconds: 2));
      context.go('/');

      // Navegar a la página principal después del registro exitoso
      
    } catch (error) {
      // Error durante el registro
      setState(() {
        _message = 'Error en el registro. Por favor, inténtalo de nuevo.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF2196F3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.go('/'),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Registro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Crear una cuenta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email o número de teléfono',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 40.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: _register,
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                            backgroundColor: const Color(0xFF333333),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      if (_message.isNotEmpty)
                        Center(
                          child: Text(
                            _message,
                            style: TextStyle(
                              color: _message == 'Registro exitoso!' ? Colors.green : Colors.red,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20.0),
                      const Center(
                        child: Text(
                          'Bienvenido a nuestra aplicación',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '¿Ya tienes una cuenta? ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context.go('/'),
                              child: const Text(
                                'Inicia sesión',
                                style: TextStyle(
                                  color: Color(0xFF2196F3),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
