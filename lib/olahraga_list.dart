import 'package:flutter/material.dart';
import 'package:responsi/list_news_model.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/olahraga_page.dart';
import 'package:responsi/olahraga_page.dart';

class OlahragaList extends StatefulWidget {
  const OlahragaList({Key? key}) : super(key: key);

  @override
  State<OlahragaList> createState() => _OlahragaListState();
}

class _OlahragaListState extends State<OlahragaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CNN OLAHRAGA"),
        centerTitle: true,
      ),
      body: _buildListOlahraga(),
    );
  }

  Widget _buildListOlahraga() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadOlahraga(),
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
          builder: (context) => OlahragaPage(
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
