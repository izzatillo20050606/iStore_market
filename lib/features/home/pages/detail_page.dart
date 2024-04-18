import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_store/common/serves/detail_page_service.dart';
import 'package:read_more_text/read_more_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../service/util_service.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool bosildi1 = false;
  bool bosildi2 = false;
  bool bosildi3 = false;
  bool bosildi1215GB = false;
  bool bosildi2512GB = false;
  bool bosildi31TB = false;
  int counter = 0;
  final telegrammurl = 'https://web.telegram.org/k/#@pdp2005';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var item = DetailPageService.detailList[0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE2E2E2),
        automaticallyImplyLeading: true,
      ),
      backgroundColor: const Color(0xFFE2E2E2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              item.images.last,
              width: 320,
              height: 300,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 470,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 60),
                    Text(
                      "Year: ${item.release}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  item.specs[0].title,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Color : ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bosildi1 ? Colors.amber : Colors.white,
                        fixedSize: const Size(110, 30),
                      ),
                      onPressed: () {
                        bosildi1 = !bosildi1;
                        setState(() {});
                      },
                      child: const Text(
                        "Gold",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF363431),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bosildi2 ? Colors.grey : Colors.white,
                        fixedSize: const Size(110, 30),
                      ),
                      onPressed: () {
                        bosildi2 = !bosildi2;
                        setState(() {});
                      },
                      child: const Text(
                        "Silver",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF363431),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bosildi3 ? Colors.black : Colors.white,
                        fixedSize: const Size(110, 30),
                      ),
                      onPressed: () {
                        bosildi3 = !bosildi3;
                        setState(() {});
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Black",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 76, 74, 71),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Description: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                ReadMoreText(
                  item.specs[0].text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.brown,
                  ),
                  numLines: 2,
                  readMoreText: 'Read more...',
                  readLessText: 'Read less...',
                ),
                const Text(
                  "Memory: ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bosildi1215GB
                            ? const Color.fromARGB(255, 102, 119, 215)
                            : Colors.white,
                        fixedSize: const Size(110, 30),
                      ),
                      onPressed: () {
                        bosildi1215GB = !bosildi1215GB;
                        setState(() {});
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "215 GB",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF363431),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bosildi2512GB
                            ? const Color.fromARGB(255, 102, 119, 215)
                            : Colors.white,
                        fixedSize: const Size(110, 30),
                      ),
                      onPressed: () {
                        bosildi2512GB = !bosildi2512GB;
                        setState(() {});
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "512 GB",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF363431),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bosildi31TB
                            ? const Color.fromARGB(255, 102, 119, 215)
                            : Colors.white,
                        fixedSize: const Size(110, 30),
                      ),
                      onPressed: () {
                        bosildi31TB = !bosildi31TB;
                        setState(() {});
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1 TB",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF363431),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 155,
                      height: 42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFF0F0F0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (counter <= 0) {
                                counter = 0;
                              } else {
                                setState(() {
                                  counter--;
                                });
                              }
                            },
                            icon: const Icon(CupertinoIcons.minus),
                          ),
                          Center(
                            child: Text(counter.toString()),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                counter++;
                              });
                            },
                            icon: const Icon(CupertinoIcons.plus),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: const Size(120, 50)),
                        onPressed: () async {
                          if (await canLaunchUrl(Uri.parse(telegrammurl))) {
                            await launchUrl(
                              Uri.parse(
                                telegrammurl,
                              ),
                            );
                          } else {
                            throw 'Could not launch $telegrammurl';
                          }
                        },
                        child: const Icon(
                          Icons.telegram,
                          color: Colors.white,
                          size: 34,
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: const Size(120, 50)),
                        onPressed: () {
                          Utils.phoneCall('+998905709144');
                        },
                        child: const Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 34,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
