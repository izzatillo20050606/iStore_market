import 'package:flutter/material.dart';
import 'package:phone_store/common/serves/product/get_product.dart';
import 'package:phone_store/common/serves/detail_page_service.dart';
import '../../home/pages/detail_page.dart';
import '../global_widgets/w_product_card.dart';

watchProducts() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: (100 / 150),
      ),
      itemCount: ProductServices.watchList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final watchProduct = ProductServices.watchList[index];
        return GestureDetector(
          onTap: () async {
            await DetailPageService.getProductDetail(
                ProductServices.watchList[index].id.toString(), context);
            debugPrint(ProductServices.watchList[index].id.toString());
            Navigator.push(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) => const DetailScreen(),
              ),
            );
          },
          child: ProductCardWidget(
            product: watchProduct,
            index: index,
          ),
        );
      },
    );
