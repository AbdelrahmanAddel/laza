import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:laza/features/add_review/data/datasources/add_review_api_service.dart';
import 'package:laza/features/add_review/data/repositories/add_review_repository_impl.dart';
import 'package:laza/features/add_review/domain/repositories/add_review_repository.dart';
import 'package:laza/features/add_review/presentation/cubit/add_review_cubit.dart';
import 'package:laza/features/category/data/datasources/category_api_service.dart';
import 'package:laza/features/category/data/repositories/category_repository_impl.dart';
import 'package:laza/features/category/domain/repositories/category_repository.dart';
import 'package:laza/features/category/presentation/cubit/category_cubit.dart';
import 'package:laza/features/home/data/datasources/home_api_service.dart';
import 'package:laza/features/home/data/repositories/home_repoistory_impl.dart';
import 'package:laza/features/home/domain/repositories/home_repository.dart';
import 'package:laza/features/home/presentation/cubit/home_cubit.dart';
import 'package:laza/features/reviews/data/datasources/review_api_service.dart';
import 'package:laza/features/reviews/data/repositories/review_repository_impl.dart';
import 'package:laza/features/reviews/domain/repositories/review_repository.dart';
import 'package:laza/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

void setup() {
  Dio dio = DioFactory.getDio();
  _home(dio);
  _category(dio);
  _reviews(dio);
  _addReview(dio);
}

_home(Dio dio) {
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(apiService: getIt()),
  );
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
}

_category(Dio dio) {
  getIt.registerLazySingleton<CategoryApiService>(
    () => CategoryApiService(dio),
  );
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(apiService: getIt()),
  );
  getIt.registerLazySingleton<CategoryCubit>(() => CategoryCubit(getIt()));
}

_reviews(Dio dio) {
  getIt.registerLazySingleton<ReviewApiService>(
    () => ReviewApiService(dio),
  );
  getIt.registerLazySingleton<ReviewRepository>(
    () => ReviewRepositoryImpl(apiService: getIt()),
  );
  getIt.registerFactory<ReviewCubit>(() => ReviewCubit(getIt()));
}

_addReview(Dio dio) {
  getIt.registerLazySingleton<AddReviewApiService>(
    () => AddReviewApiService(dio),
  );
  getIt.registerLazySingleton<AddReviewRepository>(
    () => AddReviewRepositoryImpl(apiService: getIt()),
  );
  getIt.registerFactory<AddReviewCubit>(() => AddReviewCubit(repository: getIt()));
}

class DioFactory {
  DioFactory._();
  static Dio? _dioInstance;
  static Dio getDio() {
    const time = Duration(seconds: 30);
    if (_dioInstance == null) {
      _dioInstance = Dio();
      _dioInstance!.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNjliZDhhYS1jMWE5LTRjODItNTM3NC0wOGRlMDQ4NTRkODkiLCJqdGkiOiJhYTZiZmFhMi02ZmMwLTQ3YjUtYWQxNS0wNmVkMDgyZjU5Y2UiLCJlbWFpbCI6InNhZGlvem1hbm5AZ21haWwuY29tIiwibmFtZSI6IkFiZGVscmFtYW4gQWRlbCBFenplbGRlYW4iLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3NjAwNDE3MDksImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.ILGhXkaFB17meH1HKXB5t8ulZT4nQoa4qPdeShfpooE';

      prettyLogger();
      _dioInstance!
        ..options.connectTimeout = time
        ..options.receiveTimeout = time;
      return _dioInstance!;
    } else {
      return _dioInstance!;
    }
  }

  static void prettyLogger() {
    _dioInstance!.interceptors.add(
      PrettyDioLogger(requestHeader: true, requestBody: true),
    );
  }
}
