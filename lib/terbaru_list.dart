import 'package:flutter/material.dart';
import 'package:responsi/list_news_model.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/terbaru_page.dart';
import 'package:responsi/terbaru_page.dart';

class TerbaruList extends StatefulWidget {
  const TerbaruList({Key? key}) : super(key: key);

  @override
  State<TerbaruList> createState() => _TerbaruListState();
}

class _TerbaruListState extends State<TerbaruList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CNN TERBARU"),
        centerTitle: true,
      ),
      body: _buildListTerbaru(),
    );
  }

  Widget _buildListTerbaru() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadTerbaru(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            ListNewsModel listNewsModel = ListNewsModel.fromJson(snapshot.data);
            return _buildSuccessSection(listNewsModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(ListNewsModel data) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.data!.posts!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemTerbaru(data.data!.posts![index]);
      },
    );
  }

  Widget _buildItemTerbaru(Posts postingan) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TerbaruPage(
            link: postingan.link!,
          ),
        ),
      ),
      child: Card(
        child: ListTile(
          leading: Image.network(postingan.thumbnail!),
          title: Text(
            postingan.title!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
