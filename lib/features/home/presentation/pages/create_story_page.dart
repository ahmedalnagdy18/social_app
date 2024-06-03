import 'dart:io';
import 'package:firebase_app/features/home/presentation/pages/main_page.dart';
import 'package:firebase_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/core/common/buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class CreateStoryPage extends StatefulWidget {
  const CreateStoryPage({super.key});

  @override
  State<CreateStoryPage> createState() => _CreateStoryPageState();
}

class _CreateStoryPageState extends State<CreateStoryPage> {
  File? sfile;
  String? surl;
  getStoryImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagecamera =
        await picker.pickImage(source: ImageSource.gallery);
    if (imagecamera != null) {
      sfile = File(imagecamera.path);

      var imagename = basename(imagecamera.path);

      var refStorage = FirebaseStorage.instance.ref(imagename);
      await refStorage.putFile(sfile!);
      surl = await refStorage.getDownloadURL();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference story = FirebaseFirestore.instance.collection('Story');
    final userStorydata = FirebaseAuth.instance.currentUser;

    Future<void> addStory() {
      return story.add({
        'url': surl,
        'username': userStorydata?.email,
        'ownerId': userStorydata?.uid,
      });
    }

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          S.of(context).createPost,
          style: const TextStyle(
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
                  child: surl != null
                      ? Image.network(
                          surl!,
                          fit: BoxFit.cover,
                        )
                      : IconButton(
                          onPressed: () {
                            getStoryImage();
                          },
                          icon: const Icon(Icons.upload, color: Colors.red),
                        ),
                ),
                SizedBox(height: queryData.size.height * 0.1),
                ButtonWidget(
                  onPressed: () {
                    addStory();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MainPage()));
                  },
                  text: S.of(context).post,
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
