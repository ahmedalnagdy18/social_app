import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StoryDetailPage extends StatefulWidget {
  final List<String> imageUrl;
  final Function(int) deleteStory;
  final List<String> ownerStoryId;
  final int initialIndex;

  const StoryDetailPage({
    super.key,
    required this.imageUrl,
    required this.deleteStory,
    required this.ownerStoryId,
    this.initialIndex = 0,
  });

  @override
  StoryDetailPageState createState() => StoryDetailPageState();
}

class StoryDetailPageState extends State<StoryDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextStory();
      }
    });
  }

  void _nextStory() {
    if (currentIndex < widget.imageUrl.length - 1) {
      setState(() {
        currentIndex++;
        _controller.reset();
        _controller.forward();
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  void _onTap() {
    _nextStory();
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
      backgroundColor: Colors.black,
      body: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.down,
        onDismissed: (direction) {
          Navigator.of(context).pop();
        },
        background: Container(color: Colors.black),
        child: InkWell(
          onTap: _onTap,
          child: Stack(
            children: [
              Center(
                child: Image.network(
                  widget.imageUrl[currentIndex],
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
                          if (currentUserId ==
                              widget.ownerStoryId[currentIndex])
                            PopupMenuButton(
                              padding: EdgeInsets.zero,
                              color: Colors.white,
                              icon: const Icon(Icons.more_horiz,
                                  color: Colors.black),
                              elevation: 10,
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  onTap: () => widget.deleteStory(currentIndex),
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ))
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
