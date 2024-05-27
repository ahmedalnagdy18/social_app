import 'package:firebase_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget(
      {super.key,
      required this.username,
      required this.favicon,
      required this.favonPressed,
      required this.bookicon,
      required this.bookonPressed,
      required this.describtion,
      required this.src});
  final String username;
  final String describtion;
  final String src;
  final Widget favicon;
  final Widget bookicon;
  final void Function()? favonPressed;
  final void Function()? bookonPressed;
  @override
  Widget build(BuildContext context) {
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
                        S.of(context).time,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    padding: EdgeInsets.zero,
                    color: Colors.white,
                    icon: const Icon(Icons.more_horiz, color: Colors.black),
                    elevation: 10,
                    itemBuilder: (context) => [
                      const PopupMenuItem(child: Text('edit')),
                      PopupMenuItem(onTap: () {}, child: const Text('delete')),
                    ],
                  ),
                ],
              ),
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
                describtion,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  IconButton(
                    icon: favicon,
                    onPressed: favonPressed,
                  ),
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
