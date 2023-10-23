import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, imageUrl: '../../images/gula.jpg', stock: 50, rating: 5),
    Item(name: 'Salt', price: 2000, imageUrl: '../../images/garam.jpg', stock: 50, rating: 4),
    // Tambahkan item lainnya
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Card(
              child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // Untuk mengatur komponen di tengah vertikal
      children: [
        Image.asset(
          item.imageUrl,
          width: 100, // Lebar gambar yang diinginkan
          height: 100, // Tinggi gambar yang diinginkan
          fit: BoxFit.cover, // atau sesuaikan dengan jenis yang Anda butuhkan
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Untuk mengatur komponen di tengah horizontal
            children: [
              Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Price: \$${item.price.toStringAsFixed(2)}'),
              Text('Stock: ${item.stock}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Untuk mengatur baris di tengah horizontal
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Text('Rating: ${item.rating.toStringAsFixed(1)}'),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),

          );
        },
      ),
    );
  }
}
