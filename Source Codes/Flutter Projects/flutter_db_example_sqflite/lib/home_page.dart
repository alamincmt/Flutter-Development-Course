import 'package:class_25/welcome_page.dart';
import 'package:flutter/material.dart';

import 'components/re_useble_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();
  final TextEditingController regController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registration Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Student Information Form',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                ReUsebleContainer(
                  title: 'Enter your name',
                  labelText: 'Name',
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                ),
                ReUsebleContainer(
                  title: 'Enter your roll',
                  labelText: 'Roll',
                  controller: rollController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your roll';
                    }
                    return null;
                  },
                ),
                ReUsebleContainer(
                  title: 'Enter your regestration',
                  labelText: 'Regestration',
                  controller: regController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your regestration';
                    }
                    return null;
                  },
                ),
                ReUsebleContainer(
                  title: 'Enter your email',
                  labelText: 'Email',
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                ReUsebleContainer(
                  title: 'Enter your phone',
                  labelText: 'Phone',
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your phone';
                    }
                    return null;
                  },
                ),
                ReUsebleButton(
                  text: 'Submit',
                  materialPageRoute: MaterialPageRoute(
                      builder: (context) =>
                          WelcomePage(name: nameController.text)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
