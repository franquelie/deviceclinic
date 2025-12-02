import 'package:flutter/material.dart';

class PhoneBrandsView extends StatelessWidget {
  const PhoneBrandsView({super.key});

  static final List<Map<String, dynamic>> _brands = [
    {'name': 'Samsung', 'icon': Icons.phone_android},
    {'name': 'Apple', 'icon': Icons.phone_iphone},
    {'name': 'Oppo', 'icon': Icons.phone_android},
    {'name': 'Vivo', 'icon': Icons.phone_android},
    {'name': 'Realme', 'icon': Icons.phone_android},
    {'name': 'Xiaomi', 'icon': Icons.phone_android_sharp},
    {'name': 'Vivo', 'icon': Icons.phone_android},
    {'name': 'OnePlus', 'icon': Icons.phone_android},
    {'name': 'Others', 'icon': Icons.phone_android_sharp},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cdeviceclinic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'What is your phone brand?',
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Selected: ${brand['name']}')),
                      );
                      Navigator.of(context).pop(brand['name']);
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
