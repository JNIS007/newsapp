



import 'package:newsapp/models/categories_news_model.dart';
import 'package:newsapp/models/news_channel_headlines_model.dart';
import 'package:newsapp/repository/news_repository.dart';
class NewsViewModel{
  final _rep = NewsRepository();
  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(String name)async {
    final response = _rep.fetchNewsChannelHeadlinesApi();
    return response;
  }


  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category)async {
    final response = _rep.fetchCategoriesNewsApi(category);
    return response;
  }
}