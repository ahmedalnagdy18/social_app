import 'package:firebase_app/features/authentication/data/repositories_imp/repository_imp.dart';
import 'package:firebase_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:firebase_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:firebase_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:firebase_app/features/home/data/data_source/data_source.dart';
import 'package:firebase_app/features/home/data/data_source/remote_data_source.dart';
import 'package:firebase_app/features/home/data/repositories/repository_imp.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

void setupinjection() {
  //! authentication
  injector.registerSingleton<AuthRepositoryImp>(AuthRepositoryImp());
  injector.registerFactory(
      () => AuthCubit(loginUsecase: injector(), risgesterUsecase: injector()));
  injector.registerFactory(() => LoginUsecase(repository: injector()));
  injector.registerFactory(() => RisgesterUsecase(repository: injector()));

  //! time line

  injector.registerSingleton<RepositoryImp>(RepositoryImp(
      dataSource: TimelineRemoteDataSource(dataSource: FirebaseDataSource())));
}
