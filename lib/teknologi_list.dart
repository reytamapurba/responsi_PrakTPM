import 'package:flutter/material.dart';
import 'package:responsi/list_news_model.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/teknologi_page.dart';
import 'package:responsi/teknologi_page.dart';

class TeknologiList extends StatefulWidget {
  const TeknologiList({Key? key}) : super(key: key);

  @override
  State<TeknologiList> createState() => _TeknologiListState();
}

class _TeknologiListState extends State<TeknologiList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CNN TEKNOLOGI"),
        centerTitle: true,
      ),
      body: _buildListTeknologi(),
    );
  }

  Widget _buildListTeknologi() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadTeknologi(),
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
          builder: (context) => TeknologiPage(
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
