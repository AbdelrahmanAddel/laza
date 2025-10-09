import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/errors/server_exception.dart';
import 'package:laza/features/add_review/domain/entities/add_review_entity.dart';
import 'package:laza/features/add_review/domain/repositories/add_review_repository.dart';
import 'package:laza/features/add_review/presentation/cubit/add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  final AddReviewRepository repository;

  AddReviewCubit({required this.repository}) : super(AddReviewInitial());

  Future<void> addReview(String userId, AddReviewRequest request) async {
    emit(LoadingToAddReview());
    try {
      final response = await repository.addReview(userId, request);
      if (response != null) {
        emit(ReviewAdded(response: response));
      }
    } on ServerException catch (error) {
      emit(ErrorToAddReview(message: error.errorModel.getReadableMessage()));
    } catch (e) {
      emit(ErrorToAddReview(message: e.toString()));
    }
  }
}
