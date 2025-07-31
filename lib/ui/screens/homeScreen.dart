import 'package:dev_app/models/RadioModel.dart';
import 'package:dev_app/models/enums.dart';
import 'package:dev_app/providers/productProvider.dart';
import 'package:dev_app/ui/widgets/coffeCard.dart';
import 'package:dev_app/ui/widgets/radioSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CoffeeCategory _selectedCategory = CoffeeCategory.cappuccino;
  int _selectedIndex = 0;

  void changeCategoryState(value) {
    setState(() => _selectedCategory = value);
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int index,
  ) {
    final bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Top border indicator
          Container(
            height: 4,
            width: 24,
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFF846046) : Colors.transparent,
            ),
          ),
          Icon(icon, color: isSelected ? Color(0xFF846046) : Colors.grey),
        ],
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<Widget> _buildCoffeCards() {
      return productProvider.products.map((ProductModel) {
        return SizedBox(
          child: CoffeeCard(ProductModel),
          width: (MediaQuery.of(context).size.width / 2) - 36,
        );
      }).toList();
    }

    List<RadioModel> radioProps = [
      RadioModel(
        label: "Cappuccino",
        icon: 'assets/icons/Cappuccino.svg',
        value: CoffeeCategory.cappuccino,
        groupValue: _selectedCategory,
        onChanged: changeCategoryState,
      ),
      RadioModel(
        label: "Cold Brew",
        icon: 'assets/icons/Cold.svg',
        value: CoffeeCategory.coldBrew,
        groupValue: _selectedCategory,
        onChanged: changeCategoryState,
      ),
      RadioModel(
        label: "Expresso",
        icon: 'assets/icons/Expresso.svg',
        value: CoffeeCategory.expresso,
        groupValue: _selectedCategory,
        onChanged: changeCategoryState,
      ),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Color(0xFF846046),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.favorite_border, 'Favourite', 1),
          _buildNavItem(Icons.shopping_cart_outlined, 'Cart', 2),
          _buildNavItem(Icons.person_outline, 'Profile', 3),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('assets/avatar.jpg'),
                    ),

                    Row(
                      children: [
                        Icon(Icons.location_on, color: Color(0xFF846046)),
                        Text(
                          "Bintara, Bekasi",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset('assets/notification.png'),
                        Positioned(
                          right: -2,
                          top: 2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0XFFFE8668),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                const Text(
                  "Good morning, Dityo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Search Coffee...",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(
                      Icons.tune,
                      color: Color(0xFF846046),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(color: Color(0xFFCBCBD4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(color: Color(0xFFCBCBD4)),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                RadioSection(label: 'Categories', radioProps: radioProps),
                const SizedBox(height: 20),

                Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  runSpacing: 8,
                  children: _buildCoffeCards().toList(),
                ),
                const SizedBox(height: 20),

                Row(
                  spacing: 5,
                  children: [
                    const Text(
                      "Special Offer",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SvgPicture.asset('assets/icons/Fire_Emote.svg'),
                  ],
                ),

                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/coffee_offer.jpg',
                          width: 140,
                          height: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF846046),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                "Limited",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Buy 1 get 1 free\nif you buy with Gopay",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
