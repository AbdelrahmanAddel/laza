import 'package:bloc/bloc.dart';
import 'package:laza/core/errors/server_exception.dart';
import 'package:laza/features/reviews/domain/repositories/review_repository.dart';
import 'package:laza/features/reviews/presentation/cubit/review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this.reviewRepository) : super(ReviewInitial());
  final ReviewRepository reviewRepository;

  Future<void> getReviews(String productId) async {
    emit(LoadingToLoadReviews());
    try {
      final reviewsResponse = await reviewRepository.getReviews(productId);
      emit(ReviewsLoaded(reviewsResponse: reviewsResponse));
    } on ServerException catch (errors) {
      emit(ErrorToLoadReviews(message: errors.errorModel.detail ?? ''));
    } catch (error) {
      print(error);
      emit(ErrorToLoadReviews(message: "SomeThing Wen't Wrong"));
    }
  }
}
