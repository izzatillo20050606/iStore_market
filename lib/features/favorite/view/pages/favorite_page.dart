// import 'package:flutter/material.dart';
// import 'package:phone_store/features/home/pages/home_page.dart';
// import 'package:phone_store/features/widgets/global_widgets/w_product_card.dart';

// class FavoritePage extends StatefulWidget {
//   const FavoritePage({super.key});

//   @override
//   State<FavoritePage> createState() => _FavoritePageState();
// }

// class _FavoritePageState extends State<FavoritePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(20),
//             bottomRight: Radius.circular(20),
//           ),
//         ),
//         backgroundColor: Colors.red,
//         title: const Text(
//           "Liked",
//           style: TextStyle(
//             fontSize: 26,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 255, 255, 255),
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: GridView.builder(
//           itemCount: productlike.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: MediaQuery.of(context).size.height / 1250),
//           itemBuilder: (contex, index) {
//             return GestureDetector(
//               onLongPress: () {
//                 IconButton(
//                   icon: const Icon(Icons.favorite_border),
//                   onPressed: () {
//                     setState(
//                       () {},
//                     );
//                   },
//                 );
//               },
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => DetailScreen(
//                 //       index: ProductServices.macbookList[index].id,
//                 //       categoryindex: 1,
//                 //     ),
//                 //   ),
//                 // );
//               },
//               child: Card(
//                 shape: BeveledRectangleBorder(
//                   borderRadius: BorderRadius.circular(
//                     14,
//                   ),
//                 ),
//                 child: ProductCardWidget(
//                   product: productlike[index],
//                   index: index,
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
