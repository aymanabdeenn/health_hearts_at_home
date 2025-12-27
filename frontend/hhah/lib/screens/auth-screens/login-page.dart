import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/widgets/login-widgets/login-form.dart';
import 'package:hhah/screens/auth-screens/signup-page.dart';
import 'package:hhah/navigation/screen_types.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.switchScreen,
    required this.isEnglish,
  });
  final Function(ScreenType) switchScreen;
  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryBGColor, AppColors.secondaryBGColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                children: [
                  Text(
                    'Health Hearts at Home',
                    style: GoogleFonts.dancingScript(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.tertiaryBGColor,
                    ),
                  ),
                  SizedBox(height: 64),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Welcome',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.oswald(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: AppColors.tertiaryBGColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Sign in to continue',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.oswald(
                              fontSize: 14,
                              color: AppColors.secondaryBGColor,
                            ),
                          ),
                          const SizedBox(height: 18),
                          LoginForm(
                            switchScreen: switchScreen,
                            isEnglish: isEnglish,
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignupPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Dont\'t have an account, SIGNUP here?',
                              style: GoogleFonts.oswald(
                                color: AppColors.secondaryBGColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
