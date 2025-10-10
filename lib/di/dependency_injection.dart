import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:laza/core/helper/shared_pref.dart';
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
import 'package:laza/features/login/data/datasources/login_api_service.dart';
import 'package:laza/features/login/data/repositories/login_repository_impl.dart';
import 'package:laza/features/login/domain/repositories/login_repository.dart';
import 'package:laza/features/login/presentation/cubit/login_cubit.dart';
import 'package:laza/features/reviews/data/datasources/review_api_service.dart';
import 'package:laza/features/reviews/data/repositories/review_repository_impl.dart';
import 'package:laza/features/reviews/domain/repositories/review_repository.dart';
import 'package:laza/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:laza/features/cart/data/datasources/cart_api_service.dart';
import 'package:laza/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:laza/features/cart/domain/repositories/cart_repository.dart';
import 'package:laza/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:laza/features/signup/data/datasources/signup_api_service.dart';
import 'package:laza/features/signup/data/repositories/signup_repository_impl.dart';
import 'package:laza/features/signup/domain/repositories/signup_repository.dart';
import 'package:laza/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  Dio dio = await DioFactory.getDio();
  _login(dio);
  _signup(dio);
  _home(dio);
  _category(dio);
  _reviews(dio);
  _addReview(dio);
  _cart(dio);
}

_login(Dio dio) {
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(getIt()),
  );
  getIt.registerSingleton<LoginCubit>(LoginCubit(getIt()));
}

_signup(Dio dio) {
  getIt.registerLazySingleton<SignupApiService>(() => SignupApiService(dio));
  getIt.registerLazySingleton<SignupRepository>(
    () => SignupRepositoryImpl(getIt()),
  );
  getIt.registerSingleton<SignupCubit>(SignupCubit(getIt()));
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
  getIt.registerLazySingleton<ReviewApiService>(() => ReviewApiService(dio));
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
  getIt.registerFactory<AddReviewCubit>(
    () => AddReviewCubit(repository: getIt()),
  );
}

_cart(Dio dio) {
  getIt.registerLazySingleton<CartApiService>(() => CartApiService(dio));
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(apiService: getIt()),
  );
  getIt.registerFactory<CartCubit>(() => CartCubit(cartRepository: getIt()));
}

class DioFactory {
  DioFactory._();
  static Dio? _dioInstance;
  static Future<Dio> getDio() async {
    const time = Duration(seconds: 30);
    if (_dioInstance == null) {
      _dioInstance = Dio();
      _dioInstance!.options.headers['Authorization'] =
          'Bearer ${await SharedPrefHelper.getSecuredString('token')}';

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
