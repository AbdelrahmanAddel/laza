import 'package:bloc/bloc.dart';
import 'package:laza/core/errors/server_exception.dart';
import 'package:laza/features/home/domain/repositories/home_repository.dart';
import 'package:laza/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());
  final HomeRepository homeRepository;

  Future<void> getProducts() async {
    emit(LoadingToLoadHomeProduct());
    try {
      final products = await homeRepository.getProducts();
      emit(HomeProductsLoaded(products: products));
    } on ServerException catch (errors) {
      emit(ErrorToLoadHomeProduct(message: errors.errorModel.getReadableMessage()));
    } catch (error) {
      emit(ErrorToLoadHomeProduct(message: "SomeThing Wen't Wrong"));
    }
  }
}
