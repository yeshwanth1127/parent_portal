import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../parent/profile_page.dart';

/// Login / Sign Up page — where the app starts. Parent, Teacher, Admin roles.
class LoginSignUpPage extends StatefulWidget {
  const LoginSignUpPage({super.key});

  @override
  State<LoginSignUpPage> createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final _emailController = TextEditingController();
  UserRole _selectedRole = UserRole.parent;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onContinue() {
    // Navigate to role-specific home (e.g. Profile for parent)
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (context) => ProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 700;
    return Scaffold(
      body: Column(
        children: [
          // On narrow screens: thin rainbow strip (color reference)
          if (!isWide) _buildRainbowStrip(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: AppColors.surfaceLight,
                    padding: EdgeInsets.symmetric(
                      horizontal: isWide ? 48 : 24,
                      vertical: 32,
                    ),
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: _buildForm(context),
                      ),
                    ),
                  ),
                ),
                if (isWide) Expanded(child: _buildRainbowPanel()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRainbowStrip() {
    return Container(
      height: 6,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.deepBlue,
            AppColors.violet,
            AppColors.pink,
            AppColors.orange,
            AppColors.amber,
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        Text(
          'Sunkidz Parent Portal App',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.purple,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Login / Sign Up Page',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 24),
        _buildRoleSelector(),
        const SizedBox(height: 32),
        Center(
          child: Icon(
            Icons.school_rounded,
            size: 56,
            color: AppColors.purple,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Welcome to Sunkidz.',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sign in or create an account to access your information.',
          style: TextStyle(
            fontSize: 15,
            color: AppColors.textMuted,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 28),
        _outlinedButton(
          label: 'Continue with Google',
          icon: Icons.g_mobiledata_rounded,
          onPressed: () {}, // TODO: Google sign-in
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.textMuted.withOpacity(0.5))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'or',
                style: TextStyle(color: AppColors.textMuted, fontSize: 14),
              ),
            ),
            Expanded(child: Divider(color: AppColors.textMuted.withOpacity(0.5))),
          ],
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'Enter email address',
            hintStyle: TextStyle(color: AppColors.textMuted),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.purple, width: 2),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.violet,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text('Continue'),
          ),
        ),
        const SizedBox(height: 24),
        Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 13, color: AppColors.textMuted, height: 1.4),
            children: [
              const TextSpan(text: 'By continuing, you agree to our '),
              TextSpan(
                text: 'Terms',
                style: TextStyle(
                  color: AppColors.purple,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                  color: AppColors.purple,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 14, color: AppColors.textMuted),
              children: [
                const TextSpan(text: 'Already have an account? '),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {}, // TODO: switch to login mode
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: AppColors.purple,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoleSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I am a',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: UserRole.values.map((role) {
            final isSelected = _selectedRole == role;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text(role.label),
                selected: isSelected,
                onSelected: (v) => setState(() => _selectedRole = role),
                selectedColor: AppColors.purpleLight.withOpacity(0.4),
                checkmarkColor: AppColors.purple,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _outlinedButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          foregroundColor: AppColors.textDark,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: AppColors.textMuted),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  /// Right-side panel using the rainbow color reference (blues, purples, pinks, oranges).
  Widget _buildRainbowPanel() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.deepBlue,
            AppColors.darkIndigo,
            AppColors.violet,
            AppColors.purple,
            AppColors.fuchsia,
            AppColors.pink,
            AppColors.orange,
            AppColors.amber,
          ],
          stops: [0.0, 0.25, 0.4, 0.55, 0.7, 0.8, 0.9, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Soft glowing orbs to mimic illustration
          Positioned(top: 80, left: 40, child: _glowCircle(120, AppColors.purpleLight.withOpacity(0.4))),
          Positioned(bottom: 120, right: 60, child: _glowCircle(80, AppColors.pink.withOpacity(0.4))),
          Positioned(bottom: 200, left: 80, child: _glowCircle(60, AppColors.amber.withOpacity(0.3))),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.school_rounded, size: 80, color: Colors.white.withOpacity(0.9)),
                const SizedBox(height: 16),
                Text(
                  'Sunkidz',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.95),
                  ),
                ),
                Text(
                  'Parent Portal',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _glowCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.6),
            blurRadius: size,
            spreadRadius: size * 0.2,
          ),
        ],
      ),
    );
  }
}

enum UserRole {
  parent("Parent"),
  teacher("Teacher"),
  admin("Admin");

  const UserRole(this.label);
  final String label;
}
