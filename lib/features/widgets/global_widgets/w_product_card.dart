import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_store/common/serves/detail_page_service.dart';
import 'package:phone_store/data/entitiy/product_model.dart';

class ProductCardWidget extends StatefulWidget {
  final Product product;
  final int index;

  const ProductCardWidget({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    var item = DetailPageService.detailList[0];

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFFFFFFF),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Image.network(
                widget.product.image,
                height: 170,
                width: 180,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF242424),
                    ),
                  ),
                ],
              ),
            ),
            Text("${item.release}"),
            const SizedBox(
              height: 4,
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              width: 100,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF242424),
              ),
              child: const Text(
                'Detail',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
