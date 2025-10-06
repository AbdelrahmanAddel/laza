import 'package:bloc/bloc.dart';
import 'package:laza/core/errors/server_exception.dart';
import 'package:laza/features/home/domain/repositories/home_repository.dart';
import 'package:laza/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());
  final HomeRepository homeRepository;

  Future<void> getProducts() async {
    emit(HomeLoading());
    try {
      final products = await homeRepository.getProducts();
      emit(HomeSuccess(products: products));
    } on ServerException catch (errors) {
      emit(HomeError(message: errors.errorModel.detail ?? ''));
    } catch (error) {
      emit(HomeError(message: "SomeThing Wen't Wrong"));
    }
  }
}
