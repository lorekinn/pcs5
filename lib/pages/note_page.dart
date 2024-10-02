import 'package:flutter/material.dart';
import '../models/note.dart';

class ProductDetailPage extends StatelessWidget {
  final Sweet sweet;
  final VoidCallback onDelete;

  const ProductDetailPage({super.key, required this.sweet, required this.onDelete});
  final textFont = const TextStyle(fontSize: 20);

  void _deleteProduct(BuildContext context) {
    sweets.remove(sweet);
    onDelete();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(sweet.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              sweet.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                sweet.description,
                style: textFont,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Цена: ${sweet.price} рублей',
                style: textFont,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Бренд: ${sweet.brand}',
                style: textFont,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Вкус: ${sweet.flavor}',
                style: textFont,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Состав: ${sweet.ingredients}',
                style: textFont,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _deleteProduct(context),
                icon: const Icon(Icons.delete),
                label: const Text('Удалить товар'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
