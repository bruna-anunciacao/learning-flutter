import 'package:flutter/material.dart';
import 'package:trying_geolocator_with_api/field_form.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FieldForm(
              label: 'Nome', isPassword: false, controller: controllerName),
          FieldForm(
              label: 'Email', isPassword: false, controller: controllerEmail),
          FieldForm(
              label: 'Senha', isPassword: true, controller: controllerPassword),
          ElevatedButton(onPressed: () {}, child: Text('Criar Conta')),
        ],
      ),
    );
  }
}
