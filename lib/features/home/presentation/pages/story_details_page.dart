import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StoryDetailPage extends StatefulWidget {
  final String imageUrl;
  final Function() deleteStory;
  final String ownerStoryId;

  const StoryDetailPage(
      {super.key,
      required this.imageUrl,
      required this.deleteStory,
      required this.ownerStoryId});

  @override
  StoryDetailPageState createState() => StoryDetailPageState();
}

class StoryDetailPageState extends State<StoryDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Stack(
          children: [
            Center(
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LinearProgressIndicator(
                          value: _controller.value,
                          color: Colors.white,
                          backgroundColor: Colors.black.withOpacity(0.2),
                        ),
                        if (currentUserId == widget.ownerStoryId)
                          PopupMenuButton(
                            padding: EdgeInsets.zero,
                            color: Colors.white,
                            icon: const Icon(Icons.more_horiz,
                                color: Colors.black),
                            elevation: 10,
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                  onTap: widget.deleteStory,
                                  child: const Text('delete')),
                            ],
                          ),
                      ],
                    );
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
