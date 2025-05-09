import 'package:flutter/material.dart';

class HeyPage extends StatelessWidget {
  const HeyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // fallback color
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isNarrow = constraints.maxWidth <= 500;

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFEB3B), // yellow
                  Colors.white,
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Howdy! Meet your trusted design partner,',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'crafting strong brands for SaaS and Web3.',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      const Icon(Icons.circle, size: 12, color: Colors.black),
                      const SizedBox(height: 20),
                      isNarrow
                          ? Column(
                              children: const [
                                Text(
                                  'Daniel',
                                  style: TextStyle(
                                    fontSize: 56,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Sun',
                                  style: TextStyle(
                                    fontSize: 56,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : Text.rich(
                              const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Daniel ',
                                    style: TextStyle(
                                      fontSize: 56,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sun',
                                    style: TextStyle(
                                      fontSize: 56,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
