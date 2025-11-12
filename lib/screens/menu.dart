import 'package:flutter/material.dart';
import 'package:adidos_mobile/widgets/product_card.dart';
import 'package:adidos_mobile/widgets/left_drawer.dart';
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.inventory, Colors.blue),
    ItemHomepage("My Products", Icons.shopping_bag, Colors.green),
    ItemHomepage("Create Product", Icons.add_box, Colors.red),
  ];
  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Adidos" dengan teks putih dan tebal.
        title: const Text(
          'Adidos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              )
            ]
          ),
        ),
      ),
    );
  }
}

class ItemHomepage {
 final String name;
 final IconData icon;
 final Color color;

 ItemHomepage(this.name, this.icon, this.color);
}