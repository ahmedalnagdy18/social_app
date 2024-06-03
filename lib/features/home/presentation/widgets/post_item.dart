import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    super.key,
    required this.username,
    required this.favicon,
    required this.favonPressed,
    required this.bookicon,
    required this.bookonPressed,
    required this.description,
    required this.src,
    required this.time,
    required this.deleteTap,
    required this.likeCount,
    required this.likes,
    required this.bookmarks,
    required this.ownerId,
  });
  final String username;
  final String description;
  final String src;
  final String time;
  final Widget favicon;
  final List<String> likes;
  final List<String> bookmarks;
  final Widget bookicon;
  final void Function()? favonPressed;
  final void Function()? bookonPressed;
  final Function() deleteTap;
  final int likeCount;
  final String ownerId;
  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade200,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (currentUserId == ownerId)
                    PopupMenuButton(
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      icon: const Icon(Icons.more_horiz, color: Colors.black),
                      elevation: 10,
                      itemBuilder: (context) => [
                        const PopupMenuItem(child: Text('edit')),
                        PopupMenuItem(
                            onTap: deleteTap, child: const Text('delete')),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxHeight: 250, // Ensure the height does not exceed 250
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  src,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: favicon,
                    onPressed: favonPressed,
                  ),
                  Text(likeCount.toString()),
                  const SizedBox(width: 18),
                  const Icon(
                    Icons.chat_bubble_outline,
                    size: 20,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: bookicon,
                    onPressed: bookonPressed,
                  ),
                ],
              )
            ]));
  }
}
