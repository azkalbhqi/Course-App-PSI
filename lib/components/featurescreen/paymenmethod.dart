import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  final String cardType;
  final String cardHolder;
  final String lastDigits;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodCard({
    Key? key,
    required this.cardType,
    required this.cardHolder,
    required this.lastDigits,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[50] : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Display card logo based on card type
            Image.asset(
              cardType == 'Visa'
                  ? 'assets/images/visa.png'
                  : 'assets/images/mastercard.png', // Replace with actual paths
              height: 30,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cardholder name (e.g., user's email)
                  Text(
                    cardHolder,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Last four digits of the card number
                  Text(
                    '**** $lastDigits',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Show check icon if the card is selected
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
