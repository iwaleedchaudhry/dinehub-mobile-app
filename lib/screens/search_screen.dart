import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';
import 'booking_screen.dart';
import 'profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedSort = 'Recommended';
  String selectedBudget = '\$\$';
  String selectedCuisine = 'Desi';
  bool halal = true;
  bool vegetarian = false;
  String selectedRating = '4.5+';
  double distanceValue = 3;

  void _goTo(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 32.0 : 20.0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TopBar(),
              const SizedBox(height: 20),
              const _SearchInput(),
              const SizedBox(height: 24),

              Text('Sort By', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _FilterChip(
                    label: 'Recommended',
                    selected: selectedSort == 'Recommended',
                    onTap: () => setState(() => selectedSort = 'Recommended'),
                  ),
                  _FilterChip(
                    label: 'Nearest',
                    selected: selectedSort == 'Nearest',
                    onTap: () => setState(() => selectedSort = 'Nearest'),
                  ),
                  _FilterChip(
                    label: 'Top Rated',
                    selected: selectedSort == 'Top Rated',
                    onTap: () => setState(() => selectedSort = 'Top Rated'),
                  ),
                ],
              ),

              const SizedBox(height: 28),
              Text('Budget', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: _BudgetChip(
                      label: '\$',
                      selected: selectedBudget == '\$',
                      onTap: () => setState(() => selectedBudget = '\$'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _BudgetChip(
                      label: '\$\$',
                      selected: selectedBudget == '\$\$',
                      onTap: () => setState(() => selectedBudget = '\$\$'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _BudgetChip(
                      label: '\$\$\$',
                      selected: selectedBudget == '\$\$\$',
                      onTap: () => setState(() => selectedBudget = '\$\$\$'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),
              Row(
                children: [
                  Text('Distance', style: Theme.of(context).textTheme.titleLarge),
                  const Spacer(),
                  const Text(
                    'Within 3km',
                    style: TextStyle(
                      color: AppTheme.primaryOrange,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: AppTheme.primaryOrange,
                        inactiveTrackColor: const Color(0xFFF1E5DE),
                        thumbColor: AppTheme.primaryOrange,
                        overlayColor: AppTheme.primaryOrange.withOpacity(0.15),
                        trackHeight: 4,
                      ),
                      child: Slider(
                        value: distanceValue,
                        min: 1,
                        max: 10,
                        divisions: 9,
                        onChanged: (value) {
                          setState(() {
                            distanceValue = value;
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1KM'),
                          Text('5KM'),
                          Text('10KM'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),
              Text('Cuisine', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 14),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
                children: [
                  _CuisineBox(
                    label: 'BBQ',
                    icon: Icons.outdoor_grill,
                    selected: selectedCuisine == 'BBQ',
                    onTap: () => setState(() => selectedCuisine = 'BBQ'),
                  ),
                  _CuisineBox(
                    label: 'Desi',
                    icon: Icons.restaurant,
                    selected: selectedCuisine == 'Desi',
                    onTap: () => setState(() => selectedCuisine = 'Desi'),
                  ),
                  _CuisineBox(
                    label: 'Chinese',
                    icon: Icons.ramen_dining,
                    selected: selectedCuisine == 'Chinese',
                    onTap: () => setState(() => selectedCuisine = 'Chinese'),
                  ),
                  _CuisineBox(
                    label: 'Fast Food',
                    icon: Icons.fastfood,
                    selected: selectedCuisine == 'Fast Food',
                    onTap: () => setState(() => selectedCuisine = 'Fast Food'),
                  ),
                  _CuisineBox(
                    label: 'Cafe',
                    icon: Icons.local_cafe,
                    selected: selectedCuisine == 'Cafe',
                    onTap: () => setState(() => selectedCuisine = 'Cafe'),
                  ),
                  _CuisineBox(
                    label: 'Continental',
                    icon: Icons.public,
                    selected: selectedCuisine == 'Continental',
                    onTap: () => setState(() => selectedCuisine = 'Continental'),
                  ),
                ],
              ),

              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: _PreferenceSection(
                      title: 'Dietary',
                      child: Column(
                        children: [
                          _CheckTile(
                            label: 'Halal',
                            checked: halal,
                            orange: true,
                            onTap: () => setState(() => halal = !halal),
                          ),
                          const SizedBox(height: 10),
                          _CheckTile(
                            label: 'Vegetarian',
                            checked: vegetarian,
                            orange: false,
                            onTap: () => setState(() => vegetarian = !vegetarian),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _PreferenceSection(
                      title: 'Rating',
                      child: Column(
                        children: [
                          _RatingTile(
                            label: '4.5+',
                            selected: selectedRating == '4.5+',
                            onTap: () => setState(() => selectedRating = '4.5+'),
                          ),
                          const SizedBox(height: 10),
                          _RatingTile(
                            label: '4.0+',
                            selected: selectedRating == '4.0+',
                            onTap: () => setState(() => selectedRating = '4.0+'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) _goTo(const HomeScreen());
          if (index == 1) return;
          if (index == 2) _goTo(const BookingScreen());
          if (index == 3) _goTo(const ProfileScreen());
        },
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, color: AppTheme.primaryOrange, size: 20),
        const SizedBox(width: 6),
        Text(
          'Search',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded),
        ),
      ],
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Icon(Icons.search, color: AppTheme.primaryOrange),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Desi Cuisines',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const Icon(Icons.close, color: AppTheme.textMuted),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFB191) : AppTheme.chipInactive,
          borderRadius: BorderRadius.circular(24),
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

class _BudgetChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _BudgetChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: selected ? AppTheme.primaryOrange : Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: selected ? Colors.white : AppTheme.textDark,
            ),
          ),
        ),
      ),
    );
  }
}

class _CuisineBox extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _CuisineBox({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? AppTheme.accentOrange : Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: selected ? Colors.white : AppTheme.primaryOrange,
              size: 26,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected ? Colors.white : AppTheme.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreferenceSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _PreferenceSection({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}

class _CheckTile extends StatelessWidget {
  final String label;
  final bool checked;
  final bool orange;
  final VoidCallback onTap;

  const _CheckTile({
    required this.label,
    required this.checked,
    required this.orange,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = checked
        ? (orange ? AppTheme.primaryOrange : const Color(0xFFEFE9E5))
        : Colors.white;

    final textColor = checked
        ? (orange ? Colors.white : AppTheme.textDark)
        : AppTheme.textDark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.borderColor),
        ),
        child: Row(
          children: [
            Icon(
              checked ? Icons.check_box : Icons.check_box_outline_blank,
              color: checked
                  ? (orange ? Colors.white : AppTheme.textDark)
                  : AppTheme.textMuted,
              size: 18,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RatingTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _RatingTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFB191) : AppTheme.chipInactive,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selected ? Icons.star : Icons.star_border,
              size: 18,
              color: selected ? AppTheme.primaryOrange : AppTheme.textDark,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: selected ? AppTheme.primaryOrange : AppTheme.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppTheme.primaryOrange,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu_outlined), label: 'Bookings'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}