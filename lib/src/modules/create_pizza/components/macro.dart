import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class MacroWidget extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon;
  final TextEditingController controller;

  const MacroWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 5,
              color: Colors.grey.shade400,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FaIcon(icon, color: Colors.redAccent),
              const SizedBox(height: 4),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  suffixText: title == 'Calories' ? '' : 'g',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
