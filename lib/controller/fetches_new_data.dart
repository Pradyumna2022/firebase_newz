
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../model/news_model.dart';
import '../view/const/const.dart';
class FetchNewsData{
  static List sourceId = [
    'abc-news',
    'aftenposten',
    'al-jazeera-english',
    'ansa',
    'argaam',
    'ars-technica',
    'ary-news',
    'associated-press',
    'australian-financial-review',
    'axios',
    'bbc-news'
  ];
  static Future<NewsModel> fetchNewsData() async{
    final _random = Random();
    var newSourceId = sourceId[_random.nextInt(sourceId.length)];
    var response  = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?sources=$newSourceId&apiKey=8a592c9aac1745fd85a24c990060d02c'));
    Map data = jsonDecode(response.body);
    List articles = data['articles'];
    var newArticleId = articles[_random.nextInt(articles.length)];
    // print(newArticleId);
    
    return NewsModel.fromApiToFrontend(newArticleId);
   }
}