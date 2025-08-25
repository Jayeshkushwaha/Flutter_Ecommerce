import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback? onSignUpSuccess;

  const SignUpScreen({super.key, this.onSignUpSuccess});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  void _handleSignUp() {
    // In a real app, you would validate credentials here
    // For now, we'll just simulate a successful sign-up
    widget.onSignUpSuccess?.call();
  }

  void _handleSignIn() {
    // Navigate to sign in screen
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 63.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Text
              Text(
                'Create\nAccount!',
                style: GoogleFonts.montserrat(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF000000),
                  height: 1.194,
                ),
              ),
              const SizedBox(height: 50),
              
              // Name Input Field
              _buildInputField(
                controller: _nameController,
                hintText: 'Full Name',
                prefixIcon: _buildUserIcon(),
              ),
              const SizedBox(height: 20),
              
              // Email Input Field
              _buildInputField(
                controller: _emailController,
                hintText: 'Email',
                prefixIcon: _buildEmailIcon(),
              ),
              const SizedBox(height: 20),
              
              // Password Input Field
              _buildInputField(
                controller: _passwordController,
                hintText: 'Password',
                isPassword: true,
                isPasswordVisible: _isPasswordVisible,
                onTogglePassword: _togglePasswordVisibility,
                prefixIcon: _buildLockIcon(),
              ),
              const SizedBox(height: 20),
              
              // Confirm Password Input Field
              _buildInputField(
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
                isPassword: true,
                isPasswordVisible: _isConfirmPasswordVisible,
                onTogglePassword: _toggleConfirmPasswordVisibility,
                prefixIcon: _buildLockIcon(),
              ),
              const SizedBox(height: 30),
              
              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF83758),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 21),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF),
                      height: 1.219,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              
              // OR Continue with
              Row(
                children: [
                  const Expanded(child: Divider(color: Color(0xFFA8A8A9))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '- OR Continue with -',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF575757),
                        height: 1.219,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(color: Color(0xFFA8A8A9))),
                ],
              ),
              const SizedBox(height: 20),
              
              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Google Button
                  _buildSocialButton(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Google Sign Up feature coming soon!')),
                      );
                    },
                    icon: _buildGoogleIcon(),
                  ),
                  const SizedBox(width: 10),
                  
                  // Facebook Button
                  _buildSocialButton(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Facebook Sign Up feature coming soon!')),
                      );
                    },
                    icon: _buildFacebookIcon(),
                  ),
                  const SizedBox(width: 10),
                  
                  // Apple Button
                  _buildSocialButton(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Apple Sign Up feature coming soon!')),
                      );
                    },
                    icon: _buildAppleIcon(),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              
              // Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF575757),
                      height: 1.219,
                    ),
                  ),
                  TextButton(
                    onPressed: _handleSignIn,
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFF83758),
                        height: 1.219,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    Widget? prefixIcon,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onTogglePassword,
  }) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFA8A8A9),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !isPasswordVisible,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF676767),
            height: 1.219,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFF626262),
                  ),
                  onPressed: onTogglePassword,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF000000),
        ),
      ),
    );
  }

  Widget _buildUserIcon() {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: SvgPicture.asset(
        'assets/images/user_icon.svg',
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          Color(0xFF626262),
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _buildEmailIcon() {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Icon(
        Icons.email_outlined,
        size: 24,
        color: const Color(0xFF626262),
      ),
    );
  }

  Widget _buildLockIcon() {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: SvgPicture.asset(
        'assets/images/lock_icon.svg',
        width: 16,
        height: 20,
        colorFilter: const ColorFilter.mode(
          Color(0xFF626262),
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onTap,
    required Widget icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFFCF3F6),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color(0xFFF83758),
            width: 1,
          ),
        ),
        child: Center(child: icon),
      ),
    );
  }

  Widget _buildGoogleIcon() {
    return SvgPicture.asset(
      'assets/images/google_icon.svg',
      width: 24,
      height: 24,
    );
  }

  Widget _buildFacebookIcon() {
    return SvgPicture.asset(
      'assets/images/facebook_icon.svg',
      width: 26,
      height: 26,
    );
  }

  Widget _buildAppleIcon() {
    return SvgPicture.asset(
      'assets/images/apple_icon.svg',
      width: 25,
      height: 25,
    );
  }
}