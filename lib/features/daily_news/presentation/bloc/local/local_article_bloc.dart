import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_api/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_api/features/daily_news/domain/usecases/get_saved_articles.dart';
import 'package:flutter_clean_api/features/daily_news/domain/usecases/remove_article.dart';
import 'package:flutter_clean_api/features/daily_news/domain/usecases/save_article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticlesUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(LocalArticleInitial()) {
    on<LocalArticleEvent>((_, emit) => emit(LocalArticleLoading()));
    on<GetSavedArticles>(_onGetSavedArticles);
    on<RemoveArticle>(_onRemoveArticle);
    on<SaveArticle>(_onSaveArticle);
  }

  void _onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticleSuccess(articles));
  }

  void _onRemoveArticle(
      RemoveArticle event, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase();
    final articles = await _getSavedArticlesUseCase(params: event.article);
    emit(LocalArticleSuccess(articles));
  }

  void _onSaveArticle(
      SaveArticle event, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase();
    final articles = await _getSavedArticlesUseCase(params: event.article);
    emit(LocalArticleSuccess(articles));
  }
}
