import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phone_store/common/serves/network_servis.dart';
import 'package:phone_store/features/home/pages/home_controller.dart';

final selectedCategoryIndexProvider = StateProvider<int>((ref) => 0);

class ProductCategoryWidget extends ConsumerWidget {
  const ProductCategoryWidget({
    super.key,
    required this.index,
    required this.name,
    required this.image,
  });

  final int index;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(selectedCategoryIndexProvider);
    ref.watch(homeController);
    final selectedCategoryIndex =
        ref.read(selectedCategoryIndexProvider.notifier).state;
    return GestureDetector(
      onTap: () async {
        ref.read(selectedCategoryIndexProvider.notifier).state = index;

        debugPrint(categoryMacbookList.toString());
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: 100,
        height: 83,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selectedCategoryIndex == index
              ? const Color(0xFF242424)
              : const Color(0xFFFFFFFF),
        ),
        margin: const EdgeInsets.only(
          top: 10,
          right: 10,
        ),
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 45,
              height: 45,
              color: selectedCategoryIndex == index
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF242424),
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: selectedCategoryIndex == index
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF242424),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
