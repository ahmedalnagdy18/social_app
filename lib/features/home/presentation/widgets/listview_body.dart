import 'package:firebase_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class StoryUser extends StatelessWidget {
  const StoryUser(
      {super.key,
      required this.storyUsername,
      required this.src,
      required this.ownerId});
  final String storyUsername;
  final String src;
  final String ownerId;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey.shade200,
            ),
            child: Image.network(
              src,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                storyUsername,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddStoryButton extends StatelessWidget {
  const AddStoryButton({super.key, required this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade200,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 4),
            Text(S.of(context).add),
          ],
        ),
      ),
    );
  }
}
