import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/update_profile/widgets/avatars_grid.dart';
import 'package:movies_app/features/auth/cubit/auth_cubit.dart';
import 'package:movies_app/models/user_model.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;

  bool isPickingAvatar = false;
  int selectedAvatar = 0;

  @override
  void initState() {
    super.initState();

    final user = context.read<AuthCubit>().user!;

    nameController = TextEditingController(text: user.name);
    phoneController = TextEditingController(text: user.phone);
    selectedAvatar = user.avatar;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Avatar
              GestureDetector(
                onTap: () {
                  setState(() => isPickingAvatar = !isPickingAvatar);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(
                    AvatarsGrid.avatars[selectedAvatar],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Name
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: _dec("Name", Icons.person),
              ),

              const SizedBox(height: 16),

              // Phone
              TextField(
                controller: phoneController,
                style: const TextStyle(color: Colors.white),
                decoration: _dec("Phone", Icons.phone),
              ),

              const SizedBox(height: 20),

              if (isPickingAvatar)
                AvatarsGrid(
                  selectedIndex: selectedAvatar,
                  onAvatarSelected: (index) {
                    setState(() {
                      selectedAvatar = index;
                      isPickingAvatar = false;
                    });
                  },
                ),

              const SizedBox(height: 30),

              // UPDATE BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellow,
                  ),
                  onPressed: () async {
                    final user = context.read<AuthCubit>().user!;

                    final updatedUser = UserModel(
                      uid: user.uid,
                      email: user.email,
                      name: nameController.text.trim(),
                      phone: phoneController.text.trim(),
                      avatar: selectedAvatar,
                    );

                    await context
                        .read<AuthCubit>()
                        .updateProfile(updatedUser);

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Update Data"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _dec(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.white),
      filled: true,
      fillColor: AppColors.grey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }
}
