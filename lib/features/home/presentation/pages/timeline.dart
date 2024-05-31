import 'package:firebase_app/features/home/domain/entites/entity.dart';
import 'package:firebase_app/features/home/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:firebase_app/features/home/presentation/cubit/story_cubit/story_cubit.dart';
import 'package:firebase_app/features/home/presentation/pages/create_story_page.dart';
import 'package:firebase_app/features/home/presentation/pages/story_details_page.dart';
import 'package:firebase_app/features/home/presentation/widgets/app_bar.dart';
import 'package:firebase_app/features/home/presentation/widgets/listview_body.dart';
import 'package:firebase_app/features/home/presentation/widgets/post_item.dart';
import 'package:firebase_app/generated/l10n.dart';
import 'package:firebase_app/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => PostsCubit(
              getAllPostsUsecase: injector.get(),
              likePostUsecase: injector.get())
            ..getAllPosts(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              StoryCubit(getStoriesUseCase: injector.get())..getStory(),
        ),
      ],
      child: const _TimelinePage(),
    );
  }
}

class _TimelinePage extends StatefulWidget {
  const _TimelinePage();

  @override
  State<_TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<_TimelinePage> {
  Set<int> bookmarkedPosts = {};

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
              BlocBuilder<StoryCubit, StoryState>(
                builder: (context, state) {
                  if (state is LoadingAllStories) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FailStories) {
                    return const Center(
                      child: Text('Failed to load stories.'),
                    );
                  }
                  final List<StoryEntity> stories =
                      state is SuccessAllStories ? state.stories : [];
                  return SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: stories.length + 1,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return AddStoryButton(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateStoryPage()));
                            },
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => StoryDetailPage(
                                    imageUrl: stories[index - 1].url),
                              ));
                            },
                            child: StoryUser(
                                text: 'Story $index',
                                src: stories[index - 1].url),
                          );
                        }
                      },
                    ),
                  );
                },
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
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: BlocBuilder<PostsCubit, PostsState>(
                  builder: (context, state) {
                    if (state is LoadingAllPosts) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is FailPosts) {
                      return const Center(
                        child: Text('Failed to load posts.'),
                      );
                    }
                    final List<PostEntity> posts =
                        state is SuccessAllPosts ? state.posts : [];
                    return posts.isEmpty
                        ? Center(
                            child: Text(
                              S.of(context).thereNoPost,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          )
                        : ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20),
                            itemCount: posts.length,
                            itemBuilder: (context, index) {
                              final post = posts[index];
                              return PostItemWidget(
                                deleteTap: () {
                                  BlocProvider.of<PostsCubit>(context)
                                      .delPost(posts[index].id);
                                },
                                likeCount: post.likeCount,
                                time: posts[index].time,
                                src: posts[index].url,
                                description: posts[index].description,
                                username: posts[index].username,
                                likes: post.like,
                                favicon: Icon(
                                  post.like.contains(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: post.like.contains(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      ? Colors.red
                                      : null,
                                ),
                                favonPressed: () {
                                  context.read<PostsCubit>().likePost(
                                        post.id,
                                        FirebaseAuth.instance.currentUser!.uid,
                                        !post.like.contains(FirebaseAuth
                                            .instance.currentUser!.uid),
                                      );
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
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
