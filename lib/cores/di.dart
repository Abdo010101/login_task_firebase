import 'package:login_task/feaures/login_feature/data/data_source/remote/repostory/login_repo.dart';
import 'package:login_task/feaures/login_feature/domain/repostory/login_repo_imp.dart';
import 'package:login_task/feaures/login_feature/presention/login/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  _setupRepositories();
  setupBlocs();
}

void setupBlocs() {
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get()));
}

void _setupRepositories() {
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl());
}
