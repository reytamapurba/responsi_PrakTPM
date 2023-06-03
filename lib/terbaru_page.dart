import 'package:flutter/material.dart';
import 'package:responsi/list_news_model.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/nasional_page.dart';
import 'package:url_launcher/url_launcher.dart';

class TerbaruPage extends StatefulWidget {
  final String link;
  const TerbaruPage({Key? key, required this.link}) : super(key: key);

  @override
  State<TerbaruPage> createState() => _TerbaruPageState();
}

class _TerbaruPageState extends State<TerbaruPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CNN News"),
        centerTitle: true,
      ),
      body: _buildDetailTerbaru(),
    );
  }

  Widget _buildDetailTerbaru() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadTerbaru(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            ListNewsModel listNewsModel = ListNewsModel.fromJson(snapshot.data);
            return _buildSuccessSection(listNewsModel, widget.link);
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

  Widget _buildSuccessSection(ListNewsModel data, String link) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.data!.posts!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemTerbaru(data.data!.posts![index], link);
      },
    );
  }

  Widget _buildItemTerbaru(Posts postingan, String link) {
    return (link == postingan.link!)
        ? Container(
            child: Column(
              children: [
                Text(
                  postingan.title!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(postingan.pubDate!),
                Image.network(postingan.thumbnail!),
                Text(postingan.description!),
                InkWell(
                  child: new Text('Baca Selengkapnya...'),
                  onTap: () => launchUrl(Uri.parse(postingan.link!)),
                ),
              ],
            ),
          )
        : SizedBox();
  }
}
