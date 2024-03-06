import 'package:dartz/dartz.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
