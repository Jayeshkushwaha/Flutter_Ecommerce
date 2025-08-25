import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cart_screen.dart';
import 'wishlist_screen.dart';
import 'profile_screen.dart';

class EcommerceHomeScreen extends StatefulWidget {
  const EcommerceHomeScreen({super.key});

  @override
  State<EcommerceHomeScreen> createState() => _EcommerceHomeScreenState();
}

class _EcommerceHomeScreenState extends State<EcommerceHomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    CategoriesContent(),
    CartContent(),
    WishlistContent(),
    ProfileContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFF83758),
          unselectedItemColor: const Color(0xFFA0A0A1),
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              activeIcon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          // Logo
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFFF83758),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Stylish',
            style: GoogleFonts.libreCaslonText(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFF83758),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

// Home Content Widget
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          const SizedBox(height: 20),
          _buildOfferBanner(),
          const SizedBox(height: 20),
          _buildCategoriesSection(),
          const SizedBox(height: 20),
          _buildDealOfDaySection(),
          const SizedBox(height: 20),
          _buildTrendingProductsSection(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.04),
              spreadRadius: 2,
              blurRadius: 9,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search any Product..',
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xFFF83758),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.mic, color: Colors.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferBanner() {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF17223B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '50-40% OFF',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Now in (product)',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'All colours',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Shop Now',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Categories',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildCategoryItem('Beauty', 'assets/images/fashion_shop_illustration.png'),
              const SizedBox(width: 15),
              _buildCategoryItem('Fashion', 'assets/images/sales_consulting_illustration.png'),
              const SizedBox(width: 15),
              _buildCategoryItem('Kids', 'assets/images/shopping_bag_illustration.png'),
              const SizedBox(width: 15),
              _buildCategoryItem('Mens', 'assets/images/fashion_shop_illustration.png'),
              const SizedBox(width: 15),
              _buildCategoryItem('Womens', 'assets/images/sales_consulting_illustration.png'),
              const SizedBox(width: 15),
              _buildCategoryItem('Gifts', 'assets/images/shopping_bag_illustration.png'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String title, String imagePath) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildDealOfDaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deal of the Day',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      '22h 55m 20s remaining',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF17223B),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Women Printed Kurta',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF83758),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '40%Off',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Neque porro quisquam est qui dolorem ipsum quia',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '₹1500',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '₹2499',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const Icon(Icons.star_half, color: Colors.amber, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      '56890',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingProductsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Products',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.date_range, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      'Last Date 29/02/22',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildProductItem(
                'Women Printed Kurta',
                'Neque porro quisquam est qui dolorem ipsum quia',
                '₹1500',
                '₹2499',
                '40%Off',
                '56890',
                'assets/images/fashion_shop_illustration.png',
              ),
              const SizedBox(width: 15),
              _buildProductItem(
                'HRX by Hrithik Roshan',
                'Neque porro quisquam est qui dolorem ipsum quia',
                '₹2499',
                '₹4999',
                '50%Off',
                '344567',
                'assets/images/sales_consulting_illustration.png',
              ),
              const SizedBox(width: 15),
              _buildProductItem(
                'Philips BHH880/10',
                'Hair Straightening Brush With Keratin Infused Bristles (Black).',
                '₹999',
                '₹1999',
                '50%Off',
                '646776',
                'assets/images/shopping_bag_illustration.png',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(
    String title,
    String description,
    String price,
    String originalPrice,
    String discount,
    String ratingCount,
    String imagePath,
  ) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF83758),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        discount,
                        style: GoogleFonts.montserrat(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const Icon(Icons.star_half, color: Colors.amber, size: 14),
                    const SizedBox(width: 5),
                    Text(
                      ratingCount,
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Categories Content Widget
class CategoriesContent extends StatelessWidget {
  const CategoriesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          _buildSearchBar(),
          const SizedBox(height: 20),
          
          // Item count and filter options
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '52,082+ Iteams',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            spreadRadius: 1,
                            blurRadius: 16,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Sort',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.swap_vert,
                            size: 16,
                            color: const Color(0xFF232327),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            spreadRadius: 1,
                            blurRadius: 16,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Filter',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.filter_alt_outlined,
                            size: 16,
                            color: const Color(0xFF232327),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Product grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // First row of products
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductCard(
                      'Black Winter...',
                      'Autumn And Winter Casual cotton-padded jacket...',
                      '₹499',
                      '6,890',
                      'assets/images/fashion_shop_illustration.png',
                    ),
                    const SizedBox(width: 16),
                    _buildTallProductCard(
                      'Mens Starry\nSky Printed Shirt\n100% Cotton Fabric',
                      'Mens Starry',
                      '₹399',
                      '1,52,344',
                      'assets/images/sales_consulting_illustration.png',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Second row of products
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTallProductCard(
                      'Blue cotton denim dress Look 2 Printed cotton dr...',
                      'denim dress',
                      '₹999',
                      '27,344',
                      'assets/images/shopping_bag_illustration.png',
                    ),
                    const SizedBox(width: 16),
                    _buildTallProductCard(
                      'Solid Black Dress for Women, Sexy Chain Shorts Ladi...',
                      'Black Dress',
                      '₹2,000',
                      '5,23,456',
                      'assets/images/fashion_shop_illustration.png',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Third row of products
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductCard(
                      'Flare Dress',
                      'Antheaa Black & Rust Orange Floral Print Tiered Midi F...',
                      '₹1,990',
                      '3,35,566',
                      'assets/images/sales_consulting_illustration.png',
                    ),
                    const SizedBox(width: 16),
                    _buildProductCard(
                      'Muscle Blaze...',
                      'NUTRITIONAL POWERHOUSE: MuscleBl...',
                      '₹3,900',
                      '1,35,566',
                      'assets/images/shopping_bag_illustration.png',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Fourth row of products
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductCard(
                      'men\'s & boys s...',
                      'George Walker Derby Brown Formal Shoes',
                      '₹999',
                      '3,44,567',
                      'assets/images/fashion_shop_illustration.png',
                    ),
                    const SizedBox(width: 16),
                    _buildProductCard(
                      'Realme 7',
                      '6 GB RAM | 64 GB ROM | Expandable Upto 256...',
                      '₹3,499',
                      '13,45,678',
                      'assets/images/sales_consulting_illustration.png',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Fifth row of products
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTallProductCard(
                      'chocolate with ashwagandha and get a coconu...',
                      'Hot chocolate',
                      '₹200',
                      '6,23,569',
                      'assets/images/shopping_bag_illustration.png',
                    ),
                    const SizedBox(width: 16),
                    _buildTallProductCard(
                      'This warm and comfortable jacket is great for learni...',
                      'Black Jacket 12...',
                      '₹2,999',
                      '2,23,569',
                      'assets/images/fashion_shop_illustration.png',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Sixth row of products
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTallProductCard(
                      'D7200 Digital Camera (Nikon) In New Area...',
                      'D7200 Digital C...',
                      '₹26,999',
                      '67,456',
                      'assets/images/sales_consulting_illustration.png',
                    ),
                    const SizedBox(width: 16),
                    _buildProductCard(
                      'Jordan Stay',
                      'The classic Air Jordan 12 to create a shoe that\'s fres...',
                      '₹4,999',
                      '10,23,456',
                      'assets/images/shopping_bag_illustration.png',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Seventh row of products
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductCard(
                      'Pink Embroide...',
                      'EARTHEN Rose Pink Embroidered Tiered Max...',
                      '₹1,900',
                      '45,678',
                      'assets/images/fashion_shop_illustration.png',
                    ),
                    const SizedBox(width: 16),
                    _buildProductCard(
                      'Sony PS4',
                      'Sony PS4 Console, 1TB Slim with 3 Games: Gran Turis...',
                      '₹1,999',
                      '8,35,566',
                      'assets/images/sales_consulting_illustration.png',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.04),
              spreadRadius: 2,
              blurRadius: 9,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search any Product..',
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xFFF83758),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.mic, color: Colors.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    String title,
    String description,
    String price,
    String ratingCount,
    String imagePath,
  ) {
    return Expanded(
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Container(
              height: 136,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 136,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Product details
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: const Color(0xFFA4A9B3),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFEDB310), size: 14),
                      const Icon(Icons.star, color: Color(0xFFEDB310), size: 14),
                      const Icon(Icons.star, color: Color(0xFFEDB310), size: 14),
                      const Icon(Icons.star, color: Color(0xFFEDB310), size: 14),
                      const Icon(Icons.star_half, color: Color(0xFFBBBBBB), size: 14),
                      const SizedBox(width: 4),
                      Text(
                        ratingCount,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          color: const Color(0xFFA4A9B3),
                        ),
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

  Widget _buildTallProductCard(
    String description,
    String title,
    String price,
    String ratingCount,
    String imagePath,
  ) {
    return Expanded(
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Container(
              height: 196,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 196,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Product details
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: const Color(0xFFA4A9B3),
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFEDB310), size: 14),
                      const Icon(Icons.star, color: Color(0xFFEDB310), size: 14),
                      const Icon(Icons.star, color: Color(0xFFEDB310), size: 14),
                      const Icon(Icons.star, color: Color(0xFFEDB310), size: 14),
                      const Icon(Icons.star_half, color: Color(0xFFBBBBBB), size: 14),
                      const SizedBox(width: 4),
                      Text(
                        ratingCount,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          color: const Color(0xFFA4A9B3),
                        ),
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
}

// Cart Content Widget
class CartContent extends StatelessWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartScreen();
  }
}

// Wishlist Content Widget
class WishlistContent extends StatelessWidget {
  const WishlistContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const WishlistScreen();
  }
}

// Profile Content Widget
class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen();
  }
}