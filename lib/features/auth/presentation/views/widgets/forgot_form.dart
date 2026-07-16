
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class forgotForm extends StatelessWidget {
  const forgotForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: CustomTextField(
        hintText: "Enter your email address",
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}
