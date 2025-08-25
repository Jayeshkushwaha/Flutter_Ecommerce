import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_in_screen.dart';
import 'ecommerce_home_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            // Background image
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/get_started_background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            
            // Gradient overlay
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 362,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromRGBO(0, 0, 0, 0.63),
                    ],
                  ),
                ),
              ),
            ),
            
            // Content
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: SafeArea(
                child: Column(
                  children: [
                    // Status bar placeholder (hidden in UI)
                    const SizedBox(height: 44),
                    
                    const Spacer(),
                    
                    // Text content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 37),
                      child: Column(
                        children: [
                          Text(
                            'You want Authentic, here you go!',
                            style: GoogleFonts.montserrat(
                              fontSize: 34,
                              fontWeight: FontWeight.w600,
                              height: 1.218,
                              letterSpacing: 1,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'Find it here, buy it now!',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              height: 1.54,
                              letterSpacing: 1,
                              color: Color(0xFFF2F2F2),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 66),
                    
                    // Get Started Button
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(
                              onSignInSuccess: () {
                                // After successful sign-in, go to eCommerce home screen
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const EcommerceHomeScreen()
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 279,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF83758),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: GoogleFonts.montserrat(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              height: 1.218,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 49),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}