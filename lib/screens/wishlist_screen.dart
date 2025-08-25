import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // Sample wishlist items data
  final List<WishlistItem> _wishlistItems = [
    WishlistItem(
      id: '1',
      name: 'Nike Air Jordan Retro 1 Low Mystic Black',
      category: 'NIke Sneakers',
      price: 1900.0,
      originalPrice: 2500.0,
      rating: 4.5,
      ratingCount: '46,890',
      imagePath: 'assets/images/fashion_shop_illustration.png',
    ),
    WishlistItem(
      id: '2',
      name: 'Mid Peach Mocha Shoes For Man White Black Pink S...',
      category: 'NIke Sneakers',
      price: 1900.0,
      originalPrice: 2500.0,
      rating: 4.5,
      ratingCount: '2,56,890',
      imagePath: 'assets/images/sales_consulting_illustration.png',
    ),
    WishlistItem(
      id: '3',
      name: 'Nike Air Jordan 1 Low Shoes For Man Basketball Sh...',
      category: 'NIke Sneakers',
      price: 1900.0,
      originalPrice: 2500.0,
      rating: 4.5,
      ratingCount: '1,56,890',
      imagePath: 'assets/images/shopping_bag_illustration.png',
    ),
    WishlistItem(
      id: '4',
      name: 'Jordan 1 Hyper Royal Heavy Quality',
      category: 'NIke Sneakers',
      price: 1500.0,
      originalPrice: 2000.0,
      rating: 4.5,
      ratingCount: '96,890',
      imagePath: 'assets/images/fashion_shop_illustration.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: _buildAppBar(),
      body: _buildWishlistItems(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'My Wishlist',
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

  Widget _buildWishlistItems() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: _wishlistItems.length,
      itemBuilder: (context, index) {
        return _buildWishlistItem(_wishlistItems[index]);
      },
    );
  }

  Widget _buildWishlistItem(WishlistItem item) {
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
                    item.category,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.name,
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
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.shopping_cart_outlined, size: 20),
                            onPressed: () {
                              // Handle add to cart
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, size: 20),
                            onPressed: () {
                              // Handle remove from wishlist
                            },
                          ),
                        ],
                      ),
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
}

class WishlistItem {
  final String id;
  final String name;
  final String category;
  final double price;
  final double originalPrice;
  final double rating;
  final String ratingCount;
  final String imagePath;

  WishlistItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.ratingCount,
    required this.imagePath,
  });
}