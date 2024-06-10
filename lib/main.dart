import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fb_auth/firebase_options.dart';
import 'package:flutter_fb_auth/models/app_user.dart';
import 'package:flutter_fb_auth/providers/auth_provider.dart';
import 'package:flutter_fb_auth/screens/profile/profile.dart';
import 'package:flutter_fb_auth/screens/welcome/welcome.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Cantuario2 Firebase Auth',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: const WelcomeScreen(),
        home: Consumer(
          builder: (context, ref, child) {
            final AsyncValue<AppUser?> user = ref.watch(authProvider);
            return user.when(
              data: (value) {
                if (value == null) {
                  return const WelcomeScreen();
                }
                return ProfileScreen(
                  user: value,
                );
              },
              error: (error, _) => const Text('Error loading auth state'),
              loading: () => const Text('Loading...'),
            );
          },
        ),
      ),
    ),
  );
}

// 1 - Create a stream provider using riverpod

// 2 - Set up subscription to firebase auth changes (user or null)

// 3 - Yeld the valurs from the provider as we get them from firebase
