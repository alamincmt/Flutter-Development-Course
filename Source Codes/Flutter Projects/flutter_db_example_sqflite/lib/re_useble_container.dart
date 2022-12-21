import 'package:class_25/welcome_page.dart';
import 'package:flutter/material.dart';

class ReUsebleContainer extends StatelessWidget {
  final String title;
  final String labelText;
  final TextEditingController controller;
  final FormFieldValidator validator;
  const ReUsebleContainer(
      {super.key,
      required this.title,
      required this.labelText,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: title,
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}

class ReUsebleButton extends StatelessWidget {
  final String text;
  final MaterialPageRoute materialPageRoute;
  const ReUsebleButton(
      {super.key, required this.text, required this.materialPageRoute});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(context, materialPageRoute);
        },
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
