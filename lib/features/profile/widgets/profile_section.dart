import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';
import 'package:movies_app/features/profile/widgets/profile_info_item.dart';
import '../../auth/cubit/auth_cubit.dart';
import '../../auth/cubit/auth_state.dart';
import '../../update_profile/update_profile_screen.dart';

class ProfileSection extends StatelessWidget {
  final dynamic user;

  const ProfileSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    final avatars = [
      'assets/images/avatar.png',
      'assets/images/avatar.png',
      'assets/images/avatar.png',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          children: [

            Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage(
                    avatars[user.avatar],
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ProfileInfoItem(number: '12', title: 'Wish List'),
                      ProfileInfoItem(number: '10', title: 'History'),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                user.name,
                style: AppText.regular.copyWith(
                  color: AppColors.white,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const UpdateProfileScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,
                      minimumSize: const Size.fromHeight(46),
                    ),
                    child: const Text("Edit Profile"),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await context.read<AuthCubit>().signOut();

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/login',
                            (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      minimumSize: const Size.fromHeight(46),
                    ),
                    child: const Text("Exit"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
