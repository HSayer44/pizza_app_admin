import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_repository/pizza_repository.dart';

import '../../../components/my_text_field.dart';
import '../components/macro.dart';

class CreatePizzaScreen extends StatefulWidget {
  const CreatePizzaScreen({super.key});

  @override
  State<CreatePizzaScreen> createState() => _CreatePizzaScreenState();
}

class _CreatePizzaScreenState extends State<CreatePizzaScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final calorieController = TextEditingController();
  final proteinController = TextEditingController();
  final fatController = TextEditingController();
  final carbsController = TextEditingController();

  bool creationRequired = false;

  final _formKey = GlobalKey<FormState>();
  String? _errorMsg;

  late Pizza pizza;

  @override
  void initState() {
    pizza = Pizza.empty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create a New Pizza!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    
                  },
                  hoverColor: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  child: Ink(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.photo,size: 100, color: Colors.grey.shade400),
                        const SizedBox(height: 10),
                        const Text('Add a Picture here...', style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 400,
                        child: MyTextField(
                          controller: nameController,
                          hintText: 'Name',
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          // prefixIcon: Icon(CupertinoIcons.mail_solid, color: Theme.of(context).colorScheme.primary),
                          errorMsg: _errorMsg,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return '*Please fill in this field';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: MyTextField(
                          controller: descriptionController,
                          hintText: 'Description',
                          obscureText: false,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 3,
                          // prefixIcon: Icon(CupertinoIcons.mail_solid, color: Theme.of(context).colorScheme.primary),
                          errorMsg: _errorMsg,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return '*Please fill in this field';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: Row(
                          children: [
                            Expanded(
                              child: MyTextField(
                                controller: priceController,
                                hintText: 'Price',
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))],
                                // prefixIcon: Icon(CupertinoIcons.mail_solid, color: Theme.of(context).colorScheme.primary),
                                errorMsg: _errorMsg,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return '*Please fill in this field';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: MyTextField(
                                controller: discountController,
                                hintText: 'Discount',
                                suffixIcon: const Icon(CupertinoIcons.percent, color: Colors.grey),
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))],
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                // prefixIcon: Icon(CupertinoIcons.mail_solid, color: Theme.of(context).colorScheme.primary),
                                errorMsg: _errorMsg,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return '*Please fill in this field';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text('Is Vege:'),
                          const SizedBox(width: 10),
                          Checkbox(
                            value: pizza.isVeg,
                            onChanged: (value) {
                              setState(() {
                                pizza.isVeg = value!;
                              });
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text('Is Spicy:'),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () {
                                  setState(() {
                                    pizza.spicy = 1;
                                  });
                                },
                                child: Ink(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: pizza.spicy == 1 ? Border.all(width: 2) : null,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () {
                                  setState(() {
                                    pizza.spicy = 2;
                                  });
                                },
                                child: Ink(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: pizza.spicy == 2 ? Border.all(width: 2) : null,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () {
                                  setState(() {
                                    pizza.spicy = 3;
                                  });
                                },
                                child: Ink(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: pizza.spicy == 3 ? Border.all(width: 2) : null,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text('Macros:'),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: Row(
                          children: [
                            MacroWidget(
                              title: 'Calories',
                              value: 12,
                              icon: FontAwesomeIcons.fire,
                              controller: calorieController,
                            ),
                            const SizedBox(width: 10),
                            MacroWidget(
                              title: 'Protein',
                              value: 12,
                              icon: FontAwesomeIcons.dumbbell,
                              controller: proteinController,
                            ),
                            const SizedBox(width: 10),
                            MacroWidget(
                              title: 'Fat',
                              value: 12,
                              icon: FontAwesomeIcons.oilCan,
                              controller: fatController,
                            ),
                            const SizedBox(width: 10),
                            MacroWidget(
                              title: 'Carbs',
                              value: 12,
                              icon: FontAwesomeIcons.breadSlice,
                              controller: carbsController,
                            ),
                          ],
                        ),
                      ),
            
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                !creationRequired
                    ? SizedBox(
                  width: 400,
                  height: 40,
                  child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            pizza.name = nameController.text;
                            pizza.description = descriptionController.text;
                            pizza.price = int.parse(priceController.text);
                            pizza.discount = int.parse(discountController.text);
                            pizza.macros.calories = int.parse(calorieController.text);
                            pizza.macros.proteins = int.parse(proteinController.text);
                            pizza.macros.fat = int.parse(fatController.text);
                            pizza.macros.carbs = int.parse(carbsController.text);
                          });
                          print(pizza.toString());
                        }
                      },
                      style: TextButton.styleFrom(
                          elevation: 3.0,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Text(
                          'Create Pizza',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      )),
                )
                    : const CircularProgressIndicator(),
              ],
            ),
          ),
        ));
  }
}
