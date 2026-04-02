import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'profile_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String selectedDate = 'Today';
  String selectedTime = '7:00 PM';
  int guests = 2;
  String selectedPayment = 'Manual Transfer';

  final TextEditingController notesController = TextEditingController();

  void _goToConfirmation() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('Booking Submitted'),
        content: const Text(
          'Your booking request has been submitted successfully and is now pending confirmation.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
            child: const Text(
              'OK',
              style: TextStyle(color: AppTheme.primaryOrange),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 32.0 : 20.0;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Reserve Table'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          horizontalPadding,
          12,
          horizontalPadding,
          30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _RestaurantSummaryCard(),
            const SizedBox(height: 28),

            Text('Choose Date', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _ChoiceChipCard(
                    label: 'Today',
                    selected: selectedDate == 'Today',
                    onTap: () => setState(() => selectedDate = 'Today'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ChoiceChipCard(
                    label: 'Tomorrow',
                    selected: selectedDate == 'Tomorrow',
                    onTap: () => setState(() => selectedDate = 'Tomorrow'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ChoiceChipCard(
                    label: 'Custom',
                    selected: selectedDate == 'Custom',
                    onTap: () => setState(() => selectedDate = 'Custom'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),
            Text('Select Time', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 14),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _TimeChip(
                  label: '6:30 PM',
                  selected: selectedTime == '6:30 PM',
                  onTap: () => setState(() => selectedTime = '6:30 PM'),
                ),
                _TimeChip(
                  label: '7:00 PM',
                  selected: selectedTime == '7:00 PM',
                  onTap: () => setState(() => selectedTime = '7:00 PM'),
                ),
                _TimeChip(
                  label: '7:30 PM',
                  selected: selectedTime == '7:30 PM',
                  onTap: () => setState(() => selectedTime = '7:30 PM'),
                ),
                _TimeChip(
                  label: '8:00 PM',
                  selected: selectedTime == '8:00 PM',
                  onTap: () => setState(() => selectedTime = '8:00 PM'),
                ),
              ],
            ),

            const SizedBox(height: 28),
            Text(
              'Number of Guests',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _CounterButton(
                    icon: Icons.remove,
                    onTap: () {
                      if (guests > 1) {
                        setState(() => guests--);
                      }
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '$guests Guests',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  _CounterButton(
                    icon: Icons.add,
                    onTap: () => setState(() => guests++),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            Text(
              'Special Notes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 14),
            TextField(
              controller: notesController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    'Any special requests? e.g. window seat, birthday setup...',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 28),
            Text(
              'Payment Method',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 14),
            Column(
              children: [
                _PaymentMethodCard(
                  title: 'Manual Transfer',
                  subtitle: 'Pay to restaurant account and share proof later',
                  selected: selectedPayment == 'Manual Transfer',
                  onTap: () =>
                      setState(() => selectedPayment = 'Manual Transfer'),
                ),
                const SizedBox(height: 12),
                _PaymentMethodCard(
                  title: 'Pay at Restaurant',
                  subtitle: 'Reserve now and pay when you arrive',
                  selected: selectedPayment == 'Pay at Restaurant',
                  onTap: () =>
                      setState(() => selectedPayment = 'Pay at Restaurant'),
                ),
              ],
            ),

            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _SummaryRow(label: 'Restaurant', value: 'Butt Karahi'),
                  const SizedBox(height: 10),
                  _SummaryRow(label: 'Date', value: selectedDate),
                  const SizedBox(height: 10),
                  _SummaryRow(label: 'Time', value: selectedTime),
                  const SizedBox(height: 10),
                  _SummaryRow(label: 'Guests', value: '$guests'),
                  const SizedBox(height: 10),
                  _SummaryRow(label: 'Advance', value: 'PKR 1,430'),
                  const Divider(height: 26),
                  _SummaryRow(label: 'Total', value: 'PKR 1,430', bold: true),
                ],
              ),
            ),

            const SizedBox(height: 26),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _goToConfirmation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RestaurantSummaryCard extends StatelessWidget {
  const _RestaurantSummaryCard();

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
      child: Row(
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(26)),
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1544025162-d76694265947?q=80&w=1200&auto=format&fit=crop',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Butt Karahi',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Lakshmi Chowk, Lahore',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.star, size: 18, color: Color(0xFFF4A300)),
                      SizedBox(width: 6),
                      Text(
                        '4.8',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChoiceChipCard extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ChoiceChipCard({
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
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFB191) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? AppTheme.primaryOrange : AppTheme.borderColor,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? AppTheme.primaryOrange : AppTheme.textDark,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _TimeChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TimeChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: selected ? AppTheme.primaryOrange : Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppTheme.textDark,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CounterButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.lightPeach,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: AppTheme.primaryOrange),
        ),
      ),
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _PaymentMethodCard({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFF0E8) : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: selected ? AppTheme.primaryOrange : AppTheme.borderColor,
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? AppTheme.primaryOrange : AppTheme.textMuted,
            ),
            const SizedBox(width: 12),
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
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = bold
        ? Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)
        : Theme.of(context).textTheme.bodyLarge;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: style?.copyWith(
              color: bold ? AppTheme.textDark : AppTheme.textMuted,
            ),
          ),
        ),
        Text(value, style: style),
      ],
    );
  }
}
