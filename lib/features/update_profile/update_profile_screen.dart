import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/features/update_profile/widgets/avatars_grid.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool isPickingAvatar = false;

  String selectedAvatar = AppImages.avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 12),

                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.yellow,
                      ),
                    ),

                    const Expanded(
                      child: Center(
                        child: Text(
                          'Pick Avatar',
                          style: TextStyle(
                            color: AppColors.yellow,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 48),
                  ],
                ),

                const SizedBox(height: 16),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPickingAvatar = !isPickingAvatar;
                      });
                    },

                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.transparent,

                      backgroundImage: AssetImage(selectedAvatar),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                const SizedBox(height: 24),

                Container(
                  height: 56,

                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: TextField(
                    style: const TextStyle(color: AppColors.white),

                    decoration: InputDecoration(
                      hintText: 'John Safwat',

                      hintStyle: TextStyle(
                        color: AppColors.white.withValues(alpha: 0.7),
                      ),

                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppColors.white,
                      ),

                      border: InputBorder.none,

                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Container(
                  height: 56,

                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: TextField(
                    style: const TextStyle(color: AppColors.white),

                    decoration: InputDecoration(
                      hintText: '01200000000',

                      hintStyle: TextStyle(
                        color: AppColors.white.withValues(alpha: 0.7),
                      ),

                      prefixIcon: const Icon(
                        Icons.phone,
                        color: AppColors.white,
                      ),

                      border: InputBorder.none,

                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {},

                  child: const Text(
                    'Reset Password',
                    style: TextStyle(color: AppColors.white, fontSize: 14),
                  ),
                ),

                if (isPickingAvatar) ...[
                  const SizedBox(height: 24),

                  AvatarsGrid(
                    selectedAvatar: selectedAvatar,

                    onAvatarSelected: (avatar) {
                      setState(() {
                        selectedAvatar = avatar;

                        isPickingAvatar = false;
                      });
                    },
                  ),
                ],

                SizedBox(height: isPickingAvatar ?150: 250),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    onPressed: () {},

                    child: const Text(
                      'Delete Account',
                      style: TextStyle(color: AppColors.white, fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    onPressed: () {},

                    child: const Text(
                      'Update Data',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
