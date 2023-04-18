import 'package:flutter/material.dart';
import 'package:internal_class3/core/constants/basecolors.dart';

class CreatePokemonPage extends StatefulWidget {
  final Function(String name, String type, int weight, int height)
      onCreate;

  const CreatePokemonPage({Key? key, required this.onCreate}) : super(key: key);

  @override
  State<CreatePokemonPage> createState() => _CreatePokemonPageState();
}

class _CreatePokemonPageState extends State<CreatePokemonPage> {
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    typeController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: BaseColors.primaryBlack,
      appBar: AppBar(
        title: const Text('Create Pokemon'),
        centerTitle: true,
        backgroundColor: BaseColors.darkGrey,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: BaseColors.darkGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              style: const TextStyle(color: BaseColors.white),
              controller: nameController,
              cursorColor: BaseColors.white,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Name',
                hintStyle: TextStyle(color: BaseColors.white)
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: BaseColors.darkGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              style: const TextStyle(color: BaseColors.white),
              controller: typeController,
              decoration: const InputDecoration(
                hintText: 'Type',
                  hintStyle: TextStyle(color: BaseColors.white)
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: BaseColors.darkGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              style: const TextStyle(color: BaseColors.white),
              controller: weightController,
              decoration: const InputDecoration(
                hintText: 'Weight',
                  hintStyle: TextStyle(color: BaseColors.white)
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: BaseColors.darkGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              style: const TextStyle(color: BaseColors.white),
              controller: heightController,
              decoration: const InputDecoration(
                hintText: 'Height',
                  hintStyle: TextStyle(color: BaseColors.white)
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: BaseColors.darkGrey,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              widget.onCreate(
                nameController.text,
                typeController.text,
                int.parse(weightController.text),
                int.parse(heightController.text),
              );
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
