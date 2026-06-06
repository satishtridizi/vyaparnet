import 'package:flutter/material.dart';
import 'package:vyaparnet/core/lib_widgets/app_text_field.dart';
import 'package:vyaparnet/features/auth/presentation/models/form_field_model.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final fields = const [
    FormFieldModel(label: 'Your full name', hint: 'E.g. John Smith'),
    FormFieldModel(label: 'Phone number', hint: 'Your phone number here'),
    FormFieldModel(label: 'Password', hint: '********', isPassword: true),
    FormFieldModel(
      label: 'Retype your password',
      hint: 'Password',
      isPassword: true,
    ),
  ];

  late final List<TextEditingController> controllers;

  @override
  void initState() {
    controllers = List.generate(fields.length, (_) => TextEditingController());
    super.initState();
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          fields.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: AppTextField(
              controller: controllers[index],
              label: fields[index].label,
              hint: fields[index].hint,
              isPassword: fields[index].isPassword,
            ),
          ),
        ),
      ],
    );
  }
}
