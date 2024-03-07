class NewsModel {
  String imgPath;
  String newsTitle;
  String newsDes;
  String newsUrl;
  NewsModel(
      {required this.newsTitle,
      required this.imgPath,
      required this.newsDes,
      required this.newsUrl});
  static NewsModel fromApiToFrontend(Map<String, dynamic> articles) {
    return NewsModel(
        newsTitle: articles['title'] ?? "Press Gazette",
        imgPath: articles['urlToImage'] ?? 'lib/assets/images/new2.jpg',
        newsDes: articles['description'] ?? 'You may have been told that you can’t judge a book by its cover, but that doesn’t apply to newspapers or magazines. In the case of this type of publication, that’s exactly what potential readers do. The first thing that draws the reader in is the brand name or the name of the newspaper. Therefore, it’s vital that you get it right. If you’re thinking about putting together a new magazine or newspaper business, an online newspaper maker will definitely come in handy. Check out our lists of various types of newspaper names. Among the lists are some real-world magazine and newspaper names that you might also find useful to look atRead more at.',
        newsUrl: articles['url'] ?? "https://m.dailyhunt.in"
    );
  }
}
