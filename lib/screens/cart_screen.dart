import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Sample cart items data
  final List<CartItem> _cartItems = [
    CartItem(
      id: '1',
      name: 'Black Winter Jacket',
      description: 'Autumn And Winter Casual cotton-padded jacket...',
      price: 499.0,
      originalPrice: 1500.0,
      quantity: 1,
      rating: 4.5,
      ratingCount: '6,890',
      imagePath: 'assets/images/fashion_shop_illustration.png',
    ),
    CartItem(
      id: '2',
      name: 'Flare Dress',
      description: 'Antheaa Black & Rust Orange Floral Print Tiered Midi F...',
      price: 1990.0,
      originalPrice: 335566.0,
      quantity: 2,
      rating: 4.0,
      ratingCount: '3,35,566',
      imagePath: 'assets/images/sales_consulting_illustration.png',
    ),
    CartItem(
      id: '3',
      name: 'Muscle Blaze',
      description: 'NUTRITIONAL POWERHOUSE: MuscleBlaze Whey Performance+ Protein Powder...',
      price: 3900.0,
      originalPrice: 135566.0,
      quantity: 1,
      rating: 3.5,
      ratingCount: '1,35,566',
      imagePath: 'assets/images/shopping_bag_illustration.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: _buildAppBar(),
      body: _buildCartItems(),
      bottomNavigationBar: _buildCheckoutSection(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'My Cart',
        style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _buildCartItems() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: _cartItems.length,
      itemBuilder: (context, index) {
        return _buildCartItem(_cartItems[index]);
      },
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(item.imagePath),
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
                    item.name,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: const Color(0xFFA4A9B3),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  _buildRating(item.rating, item.ratingCount),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPrice(item.price, item.originalPrice),
                      _buildQuantitySelector(item),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRating(double rating, String ratingCount) {
    List<Widget> stars = [];
    
    // Add full stars
    for (int i = 0; i < rating.floor(); i++) {
      stars.add(const Icon(Icons.star, color: Color(0xFFEDB310), size: 14));
    }
    
    // Add half star if needed
    if (rating - rating.floor() >= 0.5) {
      stars.add(const Icon(Icons.star_half, color: Color(0xFFEDB310), size: 14));
    }
    
    // Add empty stars
    for (int i = stars.length; i < 5; i++) {
      stars.add(const Icon(Icons.star, color: Color(0xFFBBBBBB), size: 14));
    }
    
    stars.add(const SizedBox(width: 4));
    stars.add(
      Text(
        ratingCount,
        style: GoogleFonts.montserrat(
          fontSize: 10,
          color: const Color(0xFFA4A9B3),
        ),
      ),
    );
    
    return Row(
      children: stars,
    );
  }

  Widget _buildPrice(double price, double originalPrice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '₹${price.toInt()}',
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        if (originalPrice > price)
          Text(
            '₹${originalPrice.toInt()}',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              color: const Color(0xFFA4A9B3),
              decoration: TextDecoration.lineThrough,
            ),
          ),
      ],
    );
  }

  Widget _buildQuantitySelector(CartItem item) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, size: 16),
            onPressed: () {
              setState(() {
                if (item.quantity > 1) {
                  item.quantity--;
                }
              });
            },
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(),
          ),
          Text(
            '${item.quantity}',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 16),
            onPressed: () {
              setState(() {
                item.quantity++;
              });
            },
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection() {
    double subtotal = _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
    double discount = _cartItems.fold(0, (sum, item) => sum + ((item.originalPrice - item.price) * item.quantity));
    double total = subtotal;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Price breakdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: const Color(0xFFA4A9B3),
                ),
              ),
              Text(
                '₹${subtotal.toInt()}',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: const Color(0xFFA4A9B3),
                ),
              ),
              Text(
                '-₹${discount.toInt()}',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: const Color(0xFFA4A9B3),
                ),
              ),
              Text(
                'FREE',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Row(
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
                '₹${(subtotal - discount).toInt()}',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF83758),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Checkout button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckoutScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF83758),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'CHECKOUT',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  int quantity;
  final double rating;
  final String ratingCount;
  final String imagePath;

  CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.rating,
    required this.ratingCount,
    required this.imagePath,
  });
}