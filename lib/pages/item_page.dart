import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text('Item Detail'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Tambahkan gambar produk dengan border radius
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                itemArgs.imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.0),
            // Tampilkan atribut lainnya dengan gaya teks dan ikon
            Text(
              itemArgs.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Price: \Rp${itemArgs.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            Text(
              'Stock: ${itemArgs.stock}',
              style: TextStyle(
                fontSize: 18,
                color: itemArgs.stock > 0 ? Colors.green : Colors.red,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  'Rating: ${itemArgs.rating.toString()}',
                  style: TextStyle(
                    fontSize: 18,
                    color: itemArgs.rating >= 4.0 ? Colors.green : Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
