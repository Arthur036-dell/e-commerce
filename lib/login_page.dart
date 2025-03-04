import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'articles_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _message = '';

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      setState(() {
        _message = 'Connexion réussie';
      });

      // Redirection vers la page des articles après la connexion réussie
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ArticlesPage()),
      );
    } catch (e) {
      setState(() {
        _message = 'Erreur : ${e.toString()}';
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          // Bulles colorées en arrière-plan
          Positioned(
            top: 50,
            left: 30,
            child: _buildBubble(50, Colors.blue.withOpacity(0.3)),
          ),
          Positioned(
            top: 150,
            right: 20,
            child: _buildBubble(80, Colors.green.withOpacity(0.4)),
          ),
          Positioned(
            bottom: 100,
            left: 100,
            child: _buildBubble(60, Colors.red.withOpacity(0.3)),
          ),
          Positioned(
            top: 150,
            left: 120,
            child: _buildBubble(70, Colors.orange.withOpacity(0.4)),
          ),
          Positioned(
            bottom: 50,
            right: 50,
            child: _buildBubble(90, Colors.purple.withOpacity(0.3)),
          ),

          // Formulaire
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Texte "TechShop" en grand au-dessus du formulaire
                  const Text(
                    'TechShop',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Champ Email avec icône et bordure
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.mail, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un e-mail valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Champ Mot de passe avec icône et bordure
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      prefixIcon: const Icon(Icons.lock, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Le mot de passe doit contenir au moins 6 caractères';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  // Bouton "Se connecter"
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Se connecter',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Message d'erreur ou succès
                  Text(
                    _message,
                    style: TextStyle(
                      color: _message == 'Connexion réussie' ? Colors.green : Colors.red,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fonction pour créer les bulles colorées
  Widget _buildBubble(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}


