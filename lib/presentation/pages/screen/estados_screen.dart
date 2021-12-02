import 'package:flutter/material.dart';
import 'package:modulos/data/services/article_pool.dart';
import 'package:modulos/domain/models/article_model.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';

class ResponseEstados extends StatelessWidget {
  final ThemeController controller;

  const ResponseEstados({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArticlePoolService service = ArticlePoolService();
    Future<List<ArticleModel>> futureArticles = service.fecthData();
    return FutureBuilder<List<ArticleModel>>(
      future: futureArticles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              ArticleModel article = items[index];
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Image.network(article.thumbnail,
                    //  width: 160,
                    //),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.person_outline_outlined),
                          onPressed: () {},
                        ),
                        Text("Usuario:  ${article.byline}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Descripcion: ${article.title}"),
                        //separacion
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Ubicacion: ${article.subsection}",
                            style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ))
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
