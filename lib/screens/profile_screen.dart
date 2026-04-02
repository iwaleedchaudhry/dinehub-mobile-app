
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'booking_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedBudget = '\$\$';
  final Set<String> selectedFoods = {'Desi', 'BBQ'};

  void _goTo(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  void toggleFood(String item) {
    setState(() {
      if (selectedFoods.contains(item)) {
        selectedFoods.remove(item);
      } else {
        selectedFoods.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 32.0 : 20.0;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(horizontalPadding, 12, horizontalPadding, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Profile',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.settings_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
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
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 42,
                          backgroundImage: AssetImage('assets/images/profile.png'),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryOrange,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Waleed Asif',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'waleed@email.com',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Expanded(
                          child: _MiniStatCard(title: 'Bookings', value: '12'),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _MiniStatCard(title: 'Favorites', value: '8'),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _MiniStatCard(title: 'Reviews', value: '5'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Text('Account', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 14),
              const _OptionTile(
                icon: Icons.person_outline,
                title: 'Personal Information',
                subtitle: 'Update your name, phone and email',
              ),
              const SizedBox(height: 12),
              const _OptionTile(
                icon: Icons.lock_outline,
                title: 'Privacy & Security',
                subtitle: 'Password, permissions and account safety',
              ),
              const SizedBox(height: 12),
              const _OptionTile(
                icon: Icons.notifications_none_rounded,
                title: 'Notifications',
                subtitle: 'Manage booking and offer alerts',
              ),
              const SizedBox(height: 28),
              Text('Preferred Budget', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: _BudgetChoice(
                      label: '\$',
                      selected: selectedBudget == '\$',
                      onTap: () => setState(() => selectedBudget = '\$'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _BudgetChoice(
                      label: '\$\$',
                      selected: selectedBudget == '\$\$',
                      onTap: () => setState(() => selectedBudget = '\$\$'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _BudgetChoice(
                      label: '\$\$\$',
                      selected: selectedBudget == '\$\$\$',
                      onTap: () => setState(() => selectedBudget = '\$\$\$'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Text('Food Preferences', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 14),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _FoodChip(
                    label: 'Desi',
                    selected: selectedFoods.contains('Desi'),
                    onTap: () => toggleFood('Desi'),
                  ),
                  _FoodChip(
                    label: 'BBQ',
                    selected: selectedFoods.contains('BBQ'),
                    onTap: () => toggleFood('BBQ'),
                  ),
                  _FoodChip(
                    label: 'Chinese',
                    selected: selectedFoods.contains('Chinese'),
                    onTap: () => toggleFood('Chinese'),
                  ),
                  _FoodChip(
                    label: 'Fast Food',
                    selected: selectedFoods.contains('Fast Food'),
                    onTap: () => toggleFood('Fast Food'),
                  ),
                  _FoodChip(
                    label: 'Cafe',
                    selected: selectedFoods.contains('Cafe'),
                    onTap: () => toggleFood('Cafe'),
                  ),
                  _FoodChip(
                    label: 'Continental',
                    selected: selectedFoods.contains('Continental'),
                    onTap: () => toggleFood('Continental'),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Text('More', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 14),
              const _OptionTile(
                icon: Icons.help_outline,
                title: 'Help & Support',
                subtitle: 'FAQs and contact support',
              ),
              const SizedBox(height: 12),
              const _OptionTile(
                icon: Icons.info_outline,
                title: 'About DineHub',
                subtitle: 'App version, policies and terms',
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1EB),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: const Color(0xFFFFD9CC)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.logout, color: AppTheme.primaryOrange),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: AppTheme.primaryOrange,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomNavBar(
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) _goTo(const HomeScreen());
          if (index == 1) _goTo(const SearchScreen());
          if (index == 2) _goTo(const BookingScreen());
          if (index == 3) return;
        },
      ),
    );
  }
}

class _MiniStatCard extends StatelessWidget {
  final String title;
  final String value;

  const _MiniStatCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppTheme.chipInactive,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.primaryOrange,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _OptionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: AppTheme.lightPeach,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppTheme.primaryOrange),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppTheme.textMuted),
        ],
      ),
    );
  }
}

class _BudgetChoice extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _BudgetChoice({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: selected ? AppTheme.primaryOrange : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: selected ? Colors.white : AppTheme.textDark,
            ),
          ),
        ),
      ),
    );
  }
}

class _FoodChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FoodChip({
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
          color: selected ? const Color(0xFFFFB191) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected ? AppTheme.primaryOrange : AppTheme.borderColor,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? AppTheme.primaryOrange : AppTheme.textDark,
            fontWeight: FontWeight.w700,
          ),
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