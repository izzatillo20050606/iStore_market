import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phone_store/common/serves/baseOptions/baseOptions.dart';
import 'package:phone_store/data/entitiy/detail_getProduct.dart';
import 'package:phone_store/features/home/pages/detail_page.dart';

class KeraksizPage extends StatefulWidget {
  const KeraksizPage({super.key});

  @override
  State<KeraksizPage> createState() => _KeraksizPageState();
}

class _KeraksizPageState extends State<KeraksizPage> {
  @override
  Widget build(BuildContext context) {
    var item = DetailPageService.detailList[0];
    return Scaffold(
      body: Column(
        children: [
          Image.network(item.images.last),
          Text(item.name),
          Text(item.release.toString()),
          Text(item.specs[0].text.toString()),
          Text(item.specs[0].title.toString()),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailScreen(),
          ),
        );
      }),
    );
  }
}

class DetailPageService extends ChangeNotifier {
  static List<GetDetailProduct> detailList = [];
  static Dio dio = Dio(BaseOptionss.baseOptions);

  static Future<void> getProductDetail(
      String productId, BuildContext context) async {
    detailList.clear();
    try {
      var response = await dio.get('/products/$productId/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('${response.data}');
        detailList.add(GetDetailProduct.fromJson(response.data));
      } else {
        debugPrint('${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Error: $error');
    }
  }
}
