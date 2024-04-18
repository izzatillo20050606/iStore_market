import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../main.dart';
import '../auth/view/widgets/w_textField.dart';
import '../home/pages/home_controller.dart';

class ProfilPage extends ConsumerStatefulWidget {
  const ProfilPage({super.key});

  @override
  ConsumerState<ProfilPage> createState() => _ProfilPage();
}

class _ProfilPage extends ConsumerState<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController ismctr =
        TextEditingController(text: preferences.getString("ism"));
    TextEditingController familyactr =
        TextEditingController(text: preferences.getString("familya"));
    TextEditingController phonectr =
        TextEditingController(text: preferences.getString("phone"));
    TextEditingController gmailctr =
        TextEditingController(text: preferences.getString("gmail"));
    TextEditingController descripctr =
        TextEditingController(text: preferences.getString("description"));
    ref.watch(homeController);
    var res = ref.read(homeController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ismctr.text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: InkWell(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.transparent,
                              backgroundImage: FileImage(
                                File(res.path!),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    onTap: () async {
                      res.getImage();
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor:
                                const Color.fromARGB(255, 30, 205, 35),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: res.isFileSelected
                                  ? Image.file(File(res.path!)).image
                                  : Image.asset("assets/images/person.png")
                                      .image,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 96,
                          left: 235,
                          child: Align(
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              size: 26,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            WTextField(
              controllerr: ismctr,
              hintTest: "Name",
              icon: const Icon(Icons.edit_outlined),
            ),
            const SizedBox(
              height: 10,
            ),
            WTextField(
              controllerr: familyactr,
              hintTest: "Surname",
              icon: const Icon(Icons.edit_outlined),
            ),
            const SizedBox(
              height: 10,
            ),
            WTextField(
              controllerr: phonectr,
              hintTest: "Phone number",
              icon: const Icon(Icons.edit_outlined),
            ),
            const SizedBox(
              height: 10,
            ),
            WTextField(
              controllerr: descripctr,
              hintTest: "Description",
              icon: const Icon(Icons.edit_outlined),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(20),
                  ),
                ),
                onPressed: () {
                  setState(() {});
                  preferences.setString("ism", ismctr.text);
                  preferences.setString("familya", familyactr.text);
                  preferences.setString("phone", phonectr.text);
                  preferences.setString("gmail", gmailctr.text);
                  preferences.setString("description", descripctr.text);
                },
                child: const Text(
                  "Saved",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
