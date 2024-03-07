import 'package:flutter/material.dart';
import 'package:newsapp/view/widgets/new_tiles.dart';

import '../controller/fetches_new_data.dart';
import '../model/news_model.dart';
import 'const/const.dart';
import 'news_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NewsModel newsModel;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('calling to fetchnewsdata here!!!!!!');
    getNewsData();
  }

  getNewsData() async {
    newsModel = await FetchNewsData.fetchNewsData();
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        onPageChanged: (value){
          setState(() {
            isLoading = true;
          });
          getNewsData();
        },
          itemBuilder: (context, index) {
            print(newsModel.toString());
            return isLoading ? Center(child: CircularProgressIndicator(backgroundColor: backgroundColor,),):NewTileWidget(
              imagePath: newsModel.imgPath,
              newsTitle: newsModel.newsTitle,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailsPage(newsUrl: newsModel.newsUrl,)));
              },
              newsDescription:newsModel.newsDes
            );
          }),
    );
  }
}
