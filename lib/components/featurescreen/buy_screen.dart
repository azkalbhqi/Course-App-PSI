import 'dart:convert';
import 'package:courses_app/components/featurescreen/paymenmethod.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart'; // Ensure Firebase Auth is set up


class BuyPage extends StatefulWidget {
  final Map<String, dynamic> course;

  const BuyPage({Key? key, required this.course}) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  String selectedCard = 'Visa'; // Track the selected payment method
  final String? userEmail = FirebaseAuth.instance.currentUser?.email; // Retrieve the user's email

  Future<void> _markAsPurchased() async {
    final courseId = widget.course['id'];
    final url = 'https://65fd90629fc4425c653243d7.mockapi.io/courses/$courseId';

    final response = await http.put(
      Uri.parse(url),
      body: json.encode({'purchased': true}),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Purchase successful!')),
      );
      Navigator.pop(context); // Go back to the previous screen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to complete purchase')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose payment method'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Payment Method Options
            PaymentMethodCard(
              cardType: 'Visa',
              cardHolder: userEmail ?? 'No Email', // Use userEmail here
              lastDigits: '6767',
              isSelected: selectedCard == 'Visa',
              onTap: () {
                setState(() {
                  selectedCard = 'Visa';
                });
              },
            ),
            const SizedBox(height: 10),
            PaymentMethodCard(
              cardType: 'MasterCard',
              cardHolder: userEmail ?? 'No Email', // Use userEmail here
              lastDigits: '0089',
              isSelected: selectedCard == 'MasterCard',
              onTap: () {
                setState(() {
                  selectedCard = 'MasterCard';
                });
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Add new card functionality here (e.g., navigate to add new card screen)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add new card functionality not implemented.')),
                );
              },
              child: Row(
                children: [
                  const Icon(Icons.add, color: Colors.blueAccent),
                  const SizedBox(width: 8),
                  const Text(
                    "Add new card",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Security Info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'We adhere entirely to the data security standards of the payment card industry.',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Buy Now Button
            ElevatedButton(
              onPressed: _markAsPurchased,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
