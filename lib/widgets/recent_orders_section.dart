import 'package:flutter/material.dart';

class RecentOrdersSection extends StatelessWidget {
  const RecentOrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'All',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.42,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See history',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.95,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(6.54),
                      ),
                      child: const Icon(Icons.task, size: 20),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'There are\ntasks to do',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.95,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Physics',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 42.03,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
