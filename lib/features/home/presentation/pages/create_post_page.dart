import 'dart:io';
import 'package:firebase_app/features/home/presentation/pages/main_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/core/common/buttons.dart';
import 'package:firebase_app/core/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class CreatpostPage extends StatelessWidget {
  const CreatpostPage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: queryData.size.height * 0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/create.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: queryData.size.height * 0.030),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'You can created a post click on the create post button to create your post',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: queryData.size.height * 0.080),
                  ButtonWidget(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CreatePageBody()));
                    },
                    text: 'Create post',
                    colors: const [Colors.black, Colors.red],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//! add post body
class CreatePageBody extends StatefulWidget {
  const CreatePageBody({super.key});

  @override
  State<CreatePageBody> createState() => _CreatePageBodyState();
}

class _CreatePageBodyState extends State<CreatePageBody> {
  final TextEditingController describtion = TextEditingController();
  File? file;
  String? url;
  getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagecamera =
        await picker.pickImage(source: ImageSource.gallery);
    if (imagecamera != null) {
      file = File(imagecamera.path);

      var imagename = basename(imagecamera.path);

      var refStorage = FirebaseStorage.instance.ref(imagename);
      await refStorage.putFile(file!);
      url = await refStorage.getDownloadURL();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    Future<void> addPosts() {
      return posts.add({'Describtion': describtion.text, 'url': url ?? "none"});
    }

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Create post',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: DashedBorder.all(
                        dashLength: 10,
                        width: 2,
                        color: Colors.grey,
                      )),
                  child: url != null
                      ? Image.network(
                          url!,
                          fit: BoxFit.cover,
                        )
                      : IconButton(
                          onPressed: () {
                            getImage();
                          },
                          icon: const Icon(Icons.upload, color: Colors.red),
                        ),
                ),
                SizedBox(height: queryData.size.height * 0.1),
                TextFieldWidget(
                  mycontroller: describtion,
                  hintText: "Describtion*",
                  obscureText: false,
                ),
                SizedBox(height: queryData.size.height * 0.1),
                ButtonWidget(
                  onPressed: () {
                    if (describtion.text.isNotEmpty && url != null) {
                      addPosts();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MainPage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Please add both an image and description'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  text: 'Post',
                  colors: const [Colors.black, Colors.red],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
