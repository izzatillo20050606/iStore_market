import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phone_store/features/profile/profilePage.dart';
import '../../widgets/category_widgets/w_airpods_products.dart';
import '../../widgets/category_widgets/w_mac_products.dart';
import '../../widgets/category_widgets/w_phone_products.dart';
import '../../widgets/category_widgets/w_watch_products.dart';
import '../../widgets/global_widgets/w_product_category.dart';
import '../../widgets/w_premium_pro.dart';
import 'home_controller.dart';

// ignore: must_be_immutable
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    var res = ref.read(homeController);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.apple,
              size: 40,
            ),
            const Text(
              'iStore',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(350.0),
                      ),
                      child: CircleAvatar(
                        radius: 140,
                        backgroundColor: Colors.transparent,
                        backgroundImage: FileImage(
                          File(res.path!),
                        ),
                      ),
                    );
                  },
                );
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilPage(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 25, 198, 31),
                radius: 20,
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: res.isFileSelected
                      ? Image.file(File(res.path!)).image
                      : const AssetImage("assets/images/bagg_person.png"),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFE2E2E2),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            PremiumProWidget.premiumProWidget(),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    ProductCategoryWidget(
                      index: 0,
                      name: 'Mac',
                      image: 'assets/images/macbook.png',
                    ),
                    ProductCategoryWidget(
                      index: 1,
                      name: 'Phone',
                      image: 'assets/images/phones.png',
                    ),
                    ProductCategoryWidget(
                      index: 2,
                      name: 'Watch',
                      image: 'assets/images/smartwatch.png',
                    ),
                    ProductCategoryWidget(
                      index: 3,
                      name: 'AirPods',
                      image: 'assets/images/img_2.png',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Consumer(
                  builder: (context, ref, _) {
                    final selectedCategoryIndex =
                        ref.watch(selectedCategoryIndexProvider);
                    if (selectedCategoryIndex == 0) {
                      return macProducts();
                    } else if (selectedCategoryIndex == 1) {
                      return phoneProducts();
                    } else if (selectedCategoryIndex == 2) {
                      return watchProducts();
                    } else if (selectedCategoryIndex == 3) {
                      return airPodsProduct();
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
