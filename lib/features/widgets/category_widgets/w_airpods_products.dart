import 'package:flutter/material.dart';
import 'package:phone_store/common/serves/product/get_product.dart';
import 'package:phone_store/data/entitiy/product_model.dart';
import 'package:phone_store/common/serves/detail_page_service.dart';
import '../../home/pages/detail_page.dart';
import '../global_widgets/w_product_card.dart';

airPodsProduct() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 150),
          mainAxisSpacing: 15,
          crossAxisSpacing: 15),
      scrollDirection: Axis.vertical,
      itemCount: ProductServices.airPodsList.length,
      itemBuilder: (context, index) {
        final Product airPodsProduct = ProductServices.airPodsList[index];
        return GestureDetector(
          onTap: () async {
            await DetailPageService.getProductDetail(
                ProductServices.airPodsList[index].id.toString(), context);
            debugPrint(ProductServices.airPodsList[index].id.toString());
            Navigator.push(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) => const DetailScreen(),
              ),
            );
          },
          child: ProductCardWidget(
            product: airPodsProduct,
            index: index,
          ),
        );
      },
    );
