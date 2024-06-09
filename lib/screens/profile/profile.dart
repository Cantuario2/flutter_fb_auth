import 'package:flutter/material.dart';
import 'package:flutter_fb_auth/services/auth_service.dart';
import 'package:flutter_fb_auth/shared/styled_button.dart';
import 'package:flutter_fb_auth/shared/styled_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledAppBarText('Your Profile'),
        backgroundColor: Colors.blue[500],
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const StyledHeading('Profile'),
            const SizedBox(
              height: 16.0,
            ),
            //output user
            StyledButton(
                onPressed: () {
                  AuthService.signOut();
                },
                child: const StyledButtonText('Log out')),
          ],
        ),
      ),
    );
  }
}
