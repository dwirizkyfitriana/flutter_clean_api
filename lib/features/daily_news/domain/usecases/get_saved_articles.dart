import 'package:flutter_clean_api/core/usecases/use_case.dart';
import 'package:flutter_clean_api/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_api/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticlesUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticlesUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
