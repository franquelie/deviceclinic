import 'package:flutter/material.dart';
import '../problems.dart';

class LaptopBrandsView extends StatelessWidget {
  const LaptopBrandsView({super.key});

  static final List<Map<String, dynamic>> _brands = [
    {'name': 'Lenovo', 'icon': Icons.laptop},
    {'name': 'HP', 'icon': Icons.laptop},
    {'name': 'Apple', 'icon': Icons.laptop_mac},
    {'name': 'Asus', 'icon': Icons.laptop},
    {'name': 'Dell', 'icon': Icons.laptop},
    {'name': 'Acer', 'icon': Icons.laptop},
    {'name': 'Fujitsu', 'icon': Icons.laptop},
    {'name': 'Razer', 'icon': Icons.laptop},
    {'name': 'Others', 'icon': Icons.laptop},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('deviceclinic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'What is your laptop brand?',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child:GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                children: _brands.map((brand) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(8.0),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 2,
                    ),
                    /* onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Selected: ${brand['name']}')),
                      );
                      Navigator.of(context).pop(brand['name']);
                    }, */
                    onPressed: () async {
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const DeviceProblemView()),
                      );
                      if (result != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Selected: $result')),
                        );
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            brand['icon'] as IconData,
                            size: 28.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          brand['name'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  );
          
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Note: This file uses Material icons as placeholders for brand logos.
// To use real logos, add image assets to `assets/` and replace the
// CircleAvatar child with `Image.asset(...)`.
