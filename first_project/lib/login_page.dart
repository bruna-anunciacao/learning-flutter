import 'package:first_project/custom_switch.dart';
import 'package:first_project/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';
  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/login.png'),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(children: [
                  TextField(
                    onChanged: (text) {
                      email = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Container(height: 20),
                  TextField(
                    onChanged: (text) {
                      senha = text;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Container(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan.shade100,
                        foregroundColor: Colors.black),
                    onPressed: () {
                      if (email == 'admin@admin.com' && senha == 'admin') {
                        Navigator.of(context).pushReplacementNamed('/home');
                      } else {
                        print('Login invalido');
                      }
                    },
                    child: Container(
                        width: double.infinity,
                        child: Text(
                          'Entrar',
                          textAlign: TextAlign.center,
                        )),
                  )
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), actions: [CustomSwitch()]),
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              )),
          Container(color: Colors.black.withOpacity(0.7)),
          _body(),
        ],
      ),
    );
  }
}
