import 'package:flutter/material.dart';
import 'package:movies_app/features/update_profile/widgets/profile_text_field.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const ProfileTextField(
          hint: 'Name',
        ),

        const SizedBox(height: 16),

        const ProfileTextField(
          hint: 'Email',
        ),

        const SizedBox(height: 16),

        const ProfileTextField(
          hint: 'Phone Number',
        ),

        const SizedBox(height: 24),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize:
            const Size.fromHeight(48),
          ),

          onPressed: () {},

          child: const Text('Update'),
        ),
      ],
    );
  }
}