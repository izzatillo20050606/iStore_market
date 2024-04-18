import 'package:flutter/material.dart';
import 'package:phone_store/common/serves/product/get_product.dart';
import 'package:phone_store/common/serves/detail_page_service.dart';
import '../../home/pages/detail_page.dart';
import '../global_widgets/w_product_card.dart';

phoneProducts() => GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100 / 150),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
    ),
    scrollDirection: Axis.vertical,
    itemCount: ProductServices.iphoneList.length,
    itemBuilder: (context, index) {
      final phoneProduct = ProductServices.iphoneList[index];
      return GestureDetector(
        onTap: () async {
          await DetailPageService.getProductDetail(
              ProductServices.iphoneList[index].id.toString(), context);
          debugPrint(ProductServices.iphoneList[index].id.toString());
          Navigator.push(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
              builder: (context) => const DetailScreen(),
            ),
          );
        },
        child: ProductCardWidget(
          product: phoneProduct,
          index: index,
        ),
      );
    });
