import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:modulos/data/services/movie_pool.dart';
import 'package:modulos/domain/models/movie_model.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';
import 'package:modulos/presentation/pages/chat/chat.dart';

class ResponseHome extends StatelessWidget {
  final ThemeController controller;

  const ResponseHome({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviePoolService service = MoviePoolService();
    Future<List<MovieModel>> futureJobs = service.fecthData();
    return FutureBuilder<List<MovieModel>>(
      future: futureJobs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              MovieModel movie = items[index];
              return Card(
                // margen de la tarjeta
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      movie.posterUrl,
                      width: 120, // tamaño imagen
                    ),
                    const SizedBox(
                      width: 15, // separacion texto imagen
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Titulo: ${movie.title}"),
                          Text("Tipo de medio: ${movie.mediaType}"),
                          Text("Overview: ${movie.overview}"),
                          //Text( "Fecha de lanzamiento: ${movie.releaseDate.toString()}"),
                          IconButton(
                            icon: Icon(Icons.chat_bubble_outline),
                            onPressed: () {
                              Get.to(() => Pagechat());
                            },
                          ),
                        ],
                      ),
                    )
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
