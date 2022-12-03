import 'package:flutter/material.dart';
import 'package:widgets_states_route/models/language.dart';

class LanguagesFormWidget extends StatelessWidget {
  LanguagesFormWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nova linguagem")),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira o nome da linguagem';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Nome', hintText: 'Nome da linguagem')),
                  TextFormField(
                      controller: _descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira a descrição da linguagem';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Descrição',
                          hintText: 'Descrição da linguagem')),
                  TextFormField(
                      controller: _imageController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira o caminho da imagem da linguagem';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Imagem',
                          hintText: 'Caminho da imagem da linguagem')),
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final language = Language(
                                  _nameController.text,
                                  _descriptionController.text,
                                  _imageController.text);
                              Navigator.pop(context, language);
                            }
                          },
                          child: const Text("Salvar")))
                ],
              ))),
    );
  }
}
