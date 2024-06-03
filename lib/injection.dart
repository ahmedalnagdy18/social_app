import 'package:firebase_app/features/authentication/data/repositories_imp/repository_imp.dart';
import 'package:firebase_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:firebase_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:firebase_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:firebase_app/features/home/data/data_source/data_source.dart';
import 'package:firebase_app/features/home/data/repositories/repository_imp.dart';
import 'package:firebase_app/features/home/domain/repositories/repository.dart';
import 'package:firebase_app/features/home/domain/usecases/get_allposts_usecase.dart';
import 'package:firebase_app/features/home/domain/usecases/get_allstory_usecase.dart';
import 'package:firebase_app/features/home/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:firebase_app/features/home/presentation/cubit/lang_cubit/locale_cubit.dart';
import 'package:firebase_app/features/home/presentation/cubit/story_cubit/story_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

void setupinjection() {
  //! authentication
  injector.registerSingleton<AuthRepositoryImp>(AuthRepositoryImp());
  injector.registerFactory(
      () => AuthCubit(loginUsecase: injector(), risgesterUsecase: injector()));
  injector.registerFactory(() => LoginUsecase(repository: injector()));
  injector.registerFactory(() => RisgesterUsecase(repository: injector()));

  //! Data Sources
  injector
      .registerSingleton<TimelineRemoteDataSource>(TimelineRemoteDataSource());

  //! Repositories
  injector.registerSingleton<TimelineRepository>(
    TimelineRepositoryImpl(dataSource: injector<TimelineRemoteDataSource>()),
  );

  //! Use Cases
  injector.registerFactory(() => GetPostsUseCase(repository: injector()));
  injector.registerFactory(() => GetStoriesUseCase(repository: injector()));
  injector.registerFactory(() => LikePostUseCase(repository: injector()));
  injector.registerFactory(() => BookmarkPostUseCase(repository: injector()));

  //! Posts Cubit
  injector.registerFactory(() => PostsCubit(
        getAllPostsUsecase: injector(),
        likePostUsecase: injector(),
        bookmarkPostUseCase: injector(),
      ));

  //! Story Cubit

  injector.registerFactory(() => StoryCubit(
        getStoriesUseCase: injector(),
      ));
  //! Lang Cubit
  injector.registerFactory(() => LocaleCubit());
}
