import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for form fields
  final TextEditingController _nameController = TextEditingController(text: 'Abhiraj Sisodiya');
  final TextEditingController _emailController = TextEditingController(text: 'aashifa@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: '***********');
  final TextEditingController _bankAccountController = TextEditingController(text: '204356XXXXXXX');
  final TextEditingController _ifscCodeController = TextEditingController(text: 'SBIN00428');
  final TextEditingController _accountHolderController = TextEditingController(text: 'Abhiraj Sisodiya');
  final TextEditingController _addressController = TextEditingController(text: "216 St Paul's Rd");
  final TextEditingController _cityController = TextEditingController(text: 'London');
  final TextEditingController _stateController = TextEditingController(text: 'N1 2LL');
  final TextEditingController _countryController = TextEditingController(text: 'United Kingdom');
  final TextEditingController _pincodeController = TextEditingController(text: '450116');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bankAccountController.dispose();
    _ifscCodeController.dispose();
    _accountHolderController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile picture section
                _buildProfilePictureSection(),
                const SizedBox(height: 30),
                
                // Personal Details Section
                _buildSectionTitle('Personal Details'),
                const SizedBox(height: 16),
                _buildTextField('Name', _nameController),
                const SizedBox(height: 16),
                _buildTextField('Email Address', _emailController),
                const SizedBox(height: 16),
                _buildPasswordField('Password', _passwordController),
                const SizedBox(height: 16),
                _buildTextField('Pincode', _pincodeController),
                
                const SizedBox(height: 30),
                
                // Business Address Details Section
                _buildSectionTitle('Business Address Details'),
                const SizedBox(height: 16),
                _buildTextField('Address', _addressController),
                const SizedBox(height: 16),
                _buildTextField('City', _cityController),
                const SizedBox(height: 16),
                _buildTextField('State', _stateController),
                const SizedBox(height: 16),
                _buildTextField('Country', _countryController),
                
                const SizedBox(height: 30),
                
                // Bank Account Details Section
                _buildSectionTitle('Bank Account Details'),
                const SizedBox(height: 16),
                _buildTextField('Bank Account Number', _bankAccountController),
                const SizedBox(height: 16),
                _buildTextField('IFSC Code', _ifscCodeController),
                const SizedBox(height: 16),
                _buildTextField('Account Holder’s Name', _accountHolderController),
                
                const SizedBox(height: 30),
                
                // Save Button
                _buildSaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'My Profile',
        style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildProfilePictureSection() {
    return Center(
      child: Stack(
        children: [
          // Profile picture
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage('assets/images/fashion_shop_illustration.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
          ),
          // Edit button
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFF4392F9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, 0),
                    blurRadius: 0,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            color: const Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFC8C8C8),
            ),
          ),
          child: TextFormField(
            controller: controller,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $label';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: const Color(0xFF000000),
              ),
            ),
            Text(
              'Change Password',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFF83758),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFC8C8C8),
            ),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: true,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $label';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Save profile logic
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile saved successfully!')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF83758),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: Text(
          'Save',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}