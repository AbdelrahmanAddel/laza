import 'package:bloc/bloc.dart';
import 'package:laza/core/errors/server_exception.dart';
import 'package:laza/features/category/domain/repositories/category_repository.dart';
import 'package:laza/features/category/presentation/cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepository) : super(CategoryInitial());
  final CategoryRepository categoryRepository;

  Future<void> getCategories() async {
    emit(LoadingToLoadCategories());
    try {
      final categories = await categoryRepository.getCategories();
      emit(CategoriesLoaded(categories: categories));
    } on ServerException catch (errors) {
      emit(ErrorToLoadCategories(message: errors.errorModel.getReadableMessage()));
    } catch (error) {
      print(error);
      emit(ErrorToLoadCategories(message: "SomeThing Wen't Wrong"));
    }
  }
}
