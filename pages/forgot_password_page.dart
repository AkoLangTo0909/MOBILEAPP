import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_text_field.dart';
import '../widgets/primary_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void sendCode() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset instructions have been sent.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const SizedBox(height: 45),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF19101A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.key_outlined,
                  color: primaryRed,
                  size: 35,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Reset password',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Enter your registered email and we will send you '
                'instructions to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textMuted,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 25),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Email Address'),
              ),

              const SizedBox(height: 7),

              AppTextField(
                controller: emailController,
                hint: 'name@company.com',
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 20),

              PrimaryButton(
                text: 'Send Code',
                onPressed: sendCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MAIN PAGE WITH BOTTOM NAVIGATION
// ============================================================

