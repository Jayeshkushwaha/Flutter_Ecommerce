import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'order_confirmation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for form fields
  final TextEditingController _nameController = TextEditingController(text: 'John Doe');
  final TextEditingController _emailController = TextEditingController(text: 'john.doe@example.com');
  final TextEditingController _phoneController = TextEditingController(text: '+1 234 567 8900');
  final TextEditingController _addressController = TextEditingController(text: '123 Main Street');
  final TextEditingController _cityController = TextEditingController(text: 'New York');
  final TextEditingController _stateController = TextEditingController(text: 'NY');
  final TextEditingController _zipCodeController = TextEditingController(text: '10001');
  final TextEditingController _cardNumberController = TextEditingController(text: '1234 5678 9012 3456');
  final TextEditingController _expiryDateController = TextEditingController(text: '12/25');
  final TextEditingController _cvvController = TextEditingController(text: '123');
  final TextEditingController _cardNameController = TextEditingController(text: 'John Doe');
  
  // Sample cart items data (in a real app, this would come from the cart)
  final List<Map<String, dynamic>> _cartItems = [
    {
      'id': '1',
      'name': 'Black Winter Jacket',
      'price': 499.0,
      'quantity': 1,
      'imagePath': 'assets/images/fashion_shop_illustration.png',
    },
    {
      'id': '2',
      'name': 'Flare Dress',
      'price': 1990.0,
      'quantity': 2,
      'imagePath': 'assets/images/sales_consulting_illustration.png',
    },
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardNameController.dispose();
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
                // Delivery Information Section
                _buildSectionTitle('Delivery Information'),
                const SizedBox(height: 16),
                _buildTextField('Full Name', _nameController, TextInputType.text),
                const SizedBox(height: 16),
                _buildTextField('Email Address', _emailController, TextInputType.emailAddress, validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email Address';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }),
                const SizedBox(height: 16),
                _buildTextField('Phone Number', _phoneController, TextInputType.phone),
                const SizedBox(height: 16),
                _buildTextField('Address', _addressController, TextInputType.streetAddress),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField('City', _cityController, TextInputType.text),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField('State', _stateController, TextInputType.text),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTextField('ZIP Code', _zipCodeController, TextInputType.number),
                
                const SizedBox(height: 30),
                
                // Payment Method Section
                _buildSectionTitle('Payment Method'),
                const SizedBox(height: 16),
                _buildPaymentMethods(),
                const SizedBox(height: 16),
                _buildCardForm(),
                
                const SizedBox(height: 30),
                
                // Order Summary Section
                _buildSectionTitle('Order Summary'),
                const SizedBox(height: 16),
                _buildOrderSummary(),
                
                const SizedBox(height: 30),
                
                // Total and Checkout Button
                _buildTotalSection(),
                const SizedBox(height: 20),
                _buildCheckoutButton(),
                const SizedBox(height: 20),
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
        'Checkout',
        style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pop();
        },
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

  Widget _buildTextField(String label, TextEditingController controller, TextInputType keyboardType, {bool isRequired = true, String? Function(String?)? validator}) {
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
            keyboardType: keyboardType,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              hintText: label,
              hintStyle: GoogleFonts.montserrat(
                fontSize: 14,
                color: const Color(0xFFA4A9B3),
              ),
            ),
            validator: validator ?? (isRequired ? (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $label';
              }
              return null;
            } : null),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethods() {
    return Row(
      children: [
        _buildPaymentMethodOption('Credit Card', true),
        const SizedBox(width: 16),
        _buildPaymentMethodOption('PayPal', false),
        const SizedBox(width: 16),
        _buildPaymentMethodOption('Cash', false),
      ],
    );
  }

  Widget _buildPaymentMethodOption(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF83758) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? const Color(0xFFF83758) : const Color(0xFFC8C8C8),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : const Color(0xFF000000),
        ),
      ),
    );
  }

  Widget _buildCardForm() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFC8C8C8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField('Card Number', _cardNumberController, TextInputType.number, validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Card Number';
              }
              String cleanedValue = value.replaceAll(RegExp(r'\s+'), '');
              if (cleanedValue.length < 16) {
                return 'Please enter a valid card number';
              }
              return null;
            }),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField('Expiry Date', _expiryDateController, TextInputType.datetime, validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Expiry Date';
                    }
                    if (!RegExp(r'^(0[1-9]|1[0-2])/([0-9]{2})$').hasMatch(value)) {
                      return 'Please enter a valid expiry date (MM/YY)';
                    }
                    return null;
                  }),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField('CVV', _cvvController, TextInputType.number, validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter CVV';
                    }
                    if (value.length < 3) {
                      return 'Please enter a valid CVV';
                    }
                    return null;
                  }),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField('Name on Card', _cardNameController, TextInputType.text),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFC8C8C8),
        ),
      ),
      child: Column(
        children: [
          // Cart items
          ..._cartItems.map((item) => _buildOrderItem(item)).toList(),
          const Divider(height: 1, color: Color(0xFFC8C8C8)),
          // Price breakdown
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildPriceRow('Subtotal', '₹${_calculateSubtotal()}'),
                const SizedBox(height: 8),
                _buildPriceRow('Discount', '-₹${_calculateDiscount()}', isDiscount: true),
                const SizedBox(height: 8),
                _buildPriceRow('Shipping', 'FREE', isFree: true),
                const SizedBox(height: 12),
                const Divider(height: 1, color: Color(0xFFC8C8C8)),
                const SizedBox(height: 12),
                _buildPriceRow('Total', '₹${_calculateTotal()}', isTotal: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Product image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(item['imagePath']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Qty: ${item['quantity']}',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: const Color(0xFFA4A9B3),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '₹${(item['price'] * item['quantity']).toInt()}',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isDiscount = false, bool isTotal = false, bool isFree = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            color: const Color(0xFFA4A9B3),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: isDiscount 
                ? Colors.green 
                : isFree 
                    ? Colors.green 
                    : isTotal 
                        ? const Color(0xFFF83758) 
                        : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildTotalSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '₹${_calculateTotal()}',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFF83758),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Process checkout
            // Navigate to order confirmation screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderConfirmationScreen(),
              ),
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
          'PLACE ORDER',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Helper methods for calculations
  int _calculateSubtotal() {
    int total = 0;
    for (var item in _cartItems) {
      total += ((item['price'] as num) * (item['quantity'] as num)).toInt();
    }
    return total;
  }

  int _calculateDiscount() {
    // In a real app, this would be calculated based on promotions
    return (_calculateSubtotal() * 0.1).toInt(); // 10% discount for example
  }

  int _calculateTotal() {
    return _calculateSubtotal() - _calculateDiscount();
  }
}