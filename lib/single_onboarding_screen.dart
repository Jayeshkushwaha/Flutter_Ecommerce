import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleOnboardingScreen extends StatefulWidget {
  final VoidCallback? onComplete;

  const SingleOnboardingScreen({
    super.key,
    this.onComplete,
  });

  @override
  State<SingleOnboardingScreen> createState() => _SingleOnboardingScreenState();
}

class _SingleOnboardingScreenState extends State<SingleOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Complete onboarding on last screen
      widget.onComplete?.call();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    widget.onComplete?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // #FFFFFF
      body: SafeArea(
        child: Column(
          children: [
            // Header with page indicator and skip
            _buildHeader(),
            
            // Main content area with PageView
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _buildPage1(), // Choose Products
                  _buildPage2(), // Make Payment
                  _buildPage3(), // Get Your Order
                ],
              ),
            ),
            
            // Bottom navigation
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }



  Widget _buildHeader() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Page indicator with individual highlighting
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '1',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: _currentPage == 0 ? const Color(0xFF000000) : const Color(0xFFA0A0A1),
                    height: 1.22,
                  ),
                ),
                TextSpan(
                  text: '/',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFA0A0A1),
                    height: 1.22,
                  ),
                ),
                TextSpan(
                  text: '2',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: _currentPage == 1 ? const Color(0xFF000000) : const Color(0xFFA0A0A1),
                    height: 1.22,
                  ),
                ),
                TextSpan(
                  text: '/',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFA0A0A1),
                    height: 1.22,
                  ),
                ),
                TextSpan(
                  text: '3',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: _currentPage == 2 ? const Color(0xFF000000) : const Color(0xFFA0A0A1),
                    height: 1.22,
                  ),
                ),
              ],
            ),
          ),
          // Skip button
          GestureDetector(
            onTap: _skip,
            child: Text(
              'Skip',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
                height: 1.22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Page 1: Choose Products - Exact Figma design
  Widget _buildPage1() {
    return Column(
      children: [
        // Illustration
        Expanded(
          child: Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/images/fashion_shop_illustration.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        
        // Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            children: [
              Text(
                'Choose Products',
                style: GoogleFonts.montserrat(
                  fontSize: 24, fontWeight: FontWeight.w800,
                  color: const Color(0xFF000000), height: 1.22,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w600,
                  color: const Color(0xFFA8A8A9), height: 1.71, letterSpacing: 0.02,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }

  // Page 2: Make Payment - Exact Figma design
  Widget _buildPage2() {
    return Column(
      children: [
        // Illustration
        Expanded(
          child: Center(
            child: SizedBox(
              width: 350,
              height: 233.33,
              child: Image.asset(
                'assets/images/sales_consulting_illustration.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        
        // Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            children: [
              Text(
                'Make Payment',
                style: GoogleFonts.montserrat(
                  fontSize: 24, fontWeight: FontWeight.w800,
                  color: const Color(0xFF000000), height: 1.22,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w600,
                  color: const Color(0xFFA8A8A9), height: 1.71, letterSpacing: 0.02,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }

  // Page 3: Get Your Order - Exact Figma design
  Widget _buildPage3() {
    return Column(
      children: [
        // Illustration
        Expanded(
          child: Center(
            child: SizedBox(
              width: 350,
              height: 350,
              child: Image.asset(
                'assets/images/shopping_bag_illustration.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        
        // Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            children: [
              Text(
                'Get Your Order',
                style: GoogleFonts.montserrat(
                  fontSize: 24, fontWeight: FontWeight.w800,
                  color: const Color(0xFF000000), height: 1.22,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w600,
                  color: const Color(0xFFA8A8A9), height: 1.71, letterSpacing: 0.02,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Page indicators - left aligned
          Row(
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.only(right: index < 2 ? 10.0 : 0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _currentPage == index ? 40 : 10,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index 
                        ? const Color(0xFF17223B)
                        : const Color(0xFF17223B).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              );
            }),
          ),
          
          // Next/Get Started button - right aligned
          GestureDetector(
            onTap: _nextPage,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: _currentPage == 2 ? 20 : 18,
                vertical: 8,
              ),
              child: Text(
                _currentPage == 2 ? 'Get Started' : 'Next',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFF83758),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}