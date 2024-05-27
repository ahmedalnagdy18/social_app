import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/home/presentation/pages/create_story_page.dart';
import 'package:firebase_app/features/home/presentation/pages/story_details_page.dart';
import 'package:firebase_app/features/home/presentation/widgets/app_bar.dart';
import 'package:firebase_app/features/home/presentation/widgets/listview_body.dart';
import 'package:firebase_app/features/home/presentation/widgets/post_item.dart';
import 'package:firebase_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  Set<int> likedPosts = {};
  Set<int> bookmarkedPosts = {};

  List<QueryDocumentSnapshot> data = [];
  List<QueryDocumentSnapshot> story = [];

  getStory() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("Story").get();
    story.addAll(querySnapshot.docs);
    setState(() {});
  }

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("posts").get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getStory();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const MyAppbar(),
                const SizedBox(height: 20),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: story.length + 1,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return AddStoryButton(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CreateStoryPage()));
                          },
                        );
                      } else {
                        // story item widget
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StoryDetailPage(
                                  imageUrl: story[index - 1]['url']),
                            ));
                          },
                          child: StoryUser(
                              text: 'Story $index',
                              src: "${story[index - 1]['url']}"),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    S.of(context).posts,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: data.isEmpty
                      ? const Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Loading....",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black54),
                              ),
                            ],
                          ),
                        )
                      : ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return PostItemWidget(
                              src: "${data[index]['url']}",
                              describtion: "${data[index]['Describtion']}",
                              username: 'User $index',
                              favicon: Icon(
                                likedPosts.contains(index)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: likedPosts.contains(index)
                                    ? Colors.red
                                    : null,
                              ),
                              favonPressed: () {
                                setState(() {
                                  if (likedPosts.contains(index)) {
                                    likedPosts.remove(index);
                                  } else {
                                    likedPosts.add(index);
                                  }
                                });
                              },
                              bookicon: Icon(
                                bookmarkedPosts.contains(index)
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                color: bookmarkedPosts.contains(index)
                                    ? Colors.yellow.shade700
                                    : null,
                              ),
                              bookonPressed: () {
                                setState(() {
                                  if (bookmarkedPosts.contains(index)) {
                                    bookmarkedPosts.remove(index);
                                  } else {
                                    bookmarkedPosts.add(index);
                                  }
                                });
                              },
                            );
                          },
                        ),
                )
              ],
            ),
          ),
        ));
  }
}
