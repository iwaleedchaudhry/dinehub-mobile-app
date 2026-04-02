import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'search_screen.dart';
import 'restaurant_details_screen.dart';
import 'booking_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCuisine = 'BBQ';

  final List<Map<String, String>> restaurants = [
    {
      'title': 'Butt Karahi',
      'subtitle': 'Desi • \$\$ • 1.2km',
      'rating': '4.8',
      'imagePath': 'assets/images/restaurant1.png',
      'cuisine': 'Desi',
    },
    {
      'title': 'Monal Lahore',
      'subtitle': 'Continental/Desi • \$\$\$ • 2.5km',
      'rating': '4.7',
      'imagePath': 'assets/images/restaurant2.png',
      'cuisine': 'BBQ',
    },
    {
      'title': 'Cafe Aylanto',
      'subtitle': 'Chinese • \$\$\$ • 5.3km',
      'rating': '4.9',
      'imagePath': 'assets/images/restaurant3.png',
      'cuisine': 'Chinese',
    },
    {
      'title': 'Spice Bazaar',
      'subtitle': 'Desi • \$\$ • 0.8km',
      'rating': '4.6',
      'imagePath': 'assets/images/restaurant1.png',
      'cuisine': 'Desi',
    },
  ];

  void _goTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  List<Map<String, String>> get filteredRestaurants {
    return restaurants
        .where((restaurant) => restaurant['cuisine'] == selectedCuisine)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 32.0 : 20.0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TopLocationBar(),
              const SizedBox(height: 24),
              Text(
                'Hi, Waleed👋',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'Ready for a delicious meal today?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              _SearchBar(onTap: () => _goTo(context, const SearchScreen())),
              const SizedBox(height: 22),
              const _OfferBanner(),
              const SizedBox(height: 26),
              _SectionHeader(title: 'Cuisines', actionText: 'See All'),
              const SizedBox(height: 14),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _CuisineChip(
                      label: 'BBQ',
                      selected: selectedCuisine == 'BBQ',
                      onTap: () => setState(() => selectedCuisine = 'BBQ'),
                    ),
                    const SizedBox(width: 10),
                    _CuisineChip(
                      label: 'Desi',
                      selected: selectedCuisine == 'Desi',
                      onTap: () => setState(() => selectedCuisine = 'Desi'),
                    ),
                    const SizedBox(width: 10),
                    _CuisineChip(
                      label: 'Chinese',
                      selected: selectedCuisine == 'Chinese',
                      onTap: () => setState(() => selectedCuisine = 'Chinese'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),
              Text(
                'Popular Near You',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              ...filteredRestaurants.map(
                (restaurant) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _RestaurantCard(
                    title: restaurant['title']!,
                    subtitle: restaurant['subtitle']!,
                    rating: restaurant['rating']!,
                    buttonText: 'Book Now',
                    imagePath: restaurant['imagePath']!,
                    onTap: () =>
                        _goTo(context, const RestaurantDetailsScreen()),
                  ),
                ),
              ),

              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) return;
          if (index == 1) _goTo(context, const SearchScreen());
          if (index == 2) _goTo(context, const BookingScreen());
          if (index == 3) _goTo(context, const ProfileScreen());
        },
      ),
    );
  }
}

class _TopLocationBar extends StatelessWidget {
  const _TopLocationBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: AppTheme.primaryOrange,
          size: 20,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            'Lahore, Pakistan',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  final VoidCallback onTap;

  const _SearchBar({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: AppTheme.textMuted),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Search for BBQ, Desi or Cafe...',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.lightPeach,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.tune_rounded,
                size: 18,
                color: AppTheme.primaryOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OfferBanner extends StatelessWidget {
  const _OfferBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [AppTheme.accentOrange, AppTheme.primaryOrange],
        ),
      ),
      child: const Text(
        '20% OFF your first booking!\nUse code: DINEPK',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;

  const _SectionHeader({required this.title, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const Spacer(),
        Text(
          actionText,
          style: const TextStyle(
            color: AppTheme.primaryOrange,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _CuisineChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CuisineChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFD7C7) : Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: selected ? AppTheme.primaryOrange : AppTheme.textDark,
          ),
        ),
      ),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String rating;
  final String buttonText;
  final String imagePath;
  final VoidCallback onTap;

  const _RestaurantCard({
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.buttonText,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(26),
              ),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Color(0xFFF4A300), size: 16),
                  const SizedBox(width: 4),
                  Text(
                    rating,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppTheme.primaryOrange,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
