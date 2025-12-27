import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/services/auth_service.dart';
import 'package:hhah/navigation/screen_types.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.switchScreen,
    required this.isEnglish,
  });
  final Function(ScreenType) switchScreen;
  final bool isEnglish;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscure = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);
    // quick visible feedback
    debugPrint('Login: attempting with ${_usernameController.text}');
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Attempting sign in...')));

    try {
      final role = await AuthService.login(
        _usernameController.text,
        _passwordController.text,
      );

      debugPrint('Login: got role: $role');

      if (!mounted) return;

      if (role == 'ROLE_ADMIN') {
        Navigator.pushReplacementNamed(context, '/admin');
      } else if (role == 'ROLE_CAREGIVER') {
        // call the provided switchScreen callback to show the main menu
        widget.switchScreen(ScreenType.mainMenu);
      } else {
        // Unknown role — show message
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Unknown role: $role')));
      }
    } catch (e, st) {
      debugPrint('Login error: $e');
      debugPrint('$st');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (v) {
              if (v == null || v.isEmpty) return 'Please enter your email';
              if (!RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$").hasMatch(v)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscure,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (v) {
              if (v == null || v.isEmpty) return 'Please enter your password';
              if (v.length < 6) return 'Password must be at least 6 characters';
              return null;
            },
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryBGColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: GoogleFonts.oswald(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: _submit,
              child: Text(
                'Sign In',
                style: GoogleFonts.oswald(color: AppColors.primaryBGColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
