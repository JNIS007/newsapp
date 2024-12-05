import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/categories_news_model.dart';
import 'package:newsapp/models/news_channel_headlines_model.dart';
class NewsRepository {
  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi()async{
    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=31afa4f6eb054270af01f7371ea5fed5';
    final response = await http.get(Uri.parse(url));
    if(kDebugMode) {
      print(response.body);
    }
    if(response.statusCode == 200 ) {
      final body = jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);
    }
    throw Exception('Error:Unable to fetch news');
  }


  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category)async{
    String url = 'https://newsapi.org/v2/everything?q=${category}&apiKey=31afa4f6eb054270af01f7371ea5fed5';
    final response = await http.get(Uri.parse(url));
    if(kDebugMode) {
      print(response.body);
    }
    if(response.statusCode == 200 ) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error:Unable to fetch news');
  }
}