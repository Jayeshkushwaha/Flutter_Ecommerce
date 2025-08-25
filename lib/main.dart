import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'single_onboarding_screen.dart';
import 'screens/ecommerce_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylish eCommerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Auto-navigate to onboarding after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SingleOnboardingScreen(
              onComplete: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const EcommerceHomeScreen(),
                  ),
                );
              },
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // #FFFFFF
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo Section - perfectly centered
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Group - exactly 124.99 x 100
                SizedBox(
                  width: 124.99,
                  height: 100.0,
                  child: Stack(
                    children: [
                      // Vector 1 - Top gradient (blue) - x:25, y:0, 100x50
                      Positioned(
                        left: 25.0,
                        top: 0.0,
                        child: SvgPicture.asset(
                          'assets/images/logo_vector_1_new.svg',
                          width: 100.0,
                          height: 50.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      // Vector 4 - Top left red - x:0, y:0, 62.52x50
                      Positioned(
                        left: 0.0,
                        top: 0.0,
                        child: SvgPicture.asset(
                          'assets/images/logo_vector_4_new.svg',
                          width: 62.52,
                          height: 50.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      // Vector 3 - Bottom gradient (pink) - x:0, y:50, 100x50
                      Positioned(
                        left: 0.0,
                        top: 50.0,
                        child: SvgPicture.asset(
                          'assets/images/logo_vector_3_new.svg',
                          width: 100.0,
                          height: 50.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      // Vector 2 - Bottom right blue - x:62.47, y:50, 62.52x50
                      Positioned(
                        left: 62.47,
                        top: 50.0,
                        child: SvgPicture.asset(
                          'assets/images/logo_vector_2_new.svg',
                          width: 62.52,
                          height: 50.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 9), // 9px gap from Figma
                // "Stylish" Text with precise alignment
                Text(
                  'Stylish',
                  style: GoogleFonts.libreCaslonText(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFF83758), // #F83758
                    height: 0.55, // 0.55em line height from Figma
                    letterSpacing: -0.5, // Slight negative letter spacing for better fit
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
