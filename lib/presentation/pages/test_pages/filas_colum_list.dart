import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modulos/presentation/pages/Inicio/inicio_page.dart';

// archivo para paginas de prueba de la applicacion

// ------- paina progile ------------------
// PROFILE: crear widget que envie a una pagina que diga sesion iniciada
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLogin2(),
      body: Profile(context),
    );
  }

// APPBAR: widget para el appbar de la pagina login
  PreferredSizeWidget AppBarLogin2() {
    return AppBar(
      // colocar icono de volver en appbar
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey[700]),
        onPressed: () {
          // volver a la pagina anterior
          Get.back();
          print("volver a Home");
        },
      ),
      title: Text('Perfil usuario', style: TextStyle(color: Colors.grey[700])),
      // color de appbar
      backgroundColor: Colors.white,
    );
  }

// body: Profile(),
  Widget Profile(context) {
    String textobtn;
    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center, //alienar col
          children: <Widget>[
            const Text('Sesión iniciada',
                style: TextStyle(
                    // colocar color de texto en hexadecimal
                    color: Colors.grey, // color morado en A rgb
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            BotonDefaultLogin(context, textobtn = 'Ir a home')
          ],
        ));
  }

// BOTONES login: crear un widget que reciba una funcion y retorne un boton
  Widget BotonDefaultLogin(context, textobtn) {
    return MaterialButton(
      color: Color.fromARGB(255, 83, 68, 145),
      minWidth: 250.0,
      height: 50.0,
      child: Text(textobtn,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold)),
      onPressed: () {
        _irPage5(context, textobtn);
        print('boton redireccionando');
      },
    );
  }

// REDIRECCION login: metodo para redireccionar a cada pagina desde menu
  void _irPage5(context, String textobtn) {
    if (textobtn == 'Ir a home') {
      Get.toNamed('/Home');
    } else {
      Get.toNamed('/Login');
    }
  }
}

// ----------- pagina de google ---------
class ImageGoogle extends StatelessWidget {
  // constructor de clase
  ImageGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarLogin2(),
        body: ListView(
          //permite scroll
          children: [
            Container(
              padding: EdgeInsets.all(80.0), //margen interno
              child: Image.network(
                'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(80.0), //margen interno
              child: Image.network(
                'https://www.educaciontrespuntocero.com/wp-content/uploads/2019/02/girasoles-978x652.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(80.0), //margen interno
              child: Image.network(
                'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ));
  }

// APPBAR: widget para el appbar de la pagina login
  PreferredSizeWidget AppBarLogin2() {
    return AppBar(
      // colocar icono de volver en appbar
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey[700]),
        onPressed: () {
          // volver a la pagina anterior
          Get.back();
          print("volver a Home");
        },
      ),
      title: Text('Login Google', style: TextStyle(color: Colors.grey[700])),
      // color de appbar
      backgroundColor: Colors.white,
    );
  }
}

// ------------ temas de la app ------------
// crear clase para cambiar entre tema light y dark
class ThemeChanger {
  // crear metodo para cambiar el tema
  static ThemeData get ligthTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,

      // estilos de botonos del ejemplo 3 no implementados
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //     //style: ElevatedButton.styleFrom(
      //     //textStyle: AppTextStyle.defaultFontStyle,
      //     //  ),
      //     ),
      // inputDecorationTheme: InputDecorationTheme(
      //   fillColor: Colors.grey.shade300,
      // ),
      // outlinedButtonTheme: OutlinedButtonThemeData(
      //     // style: ElevatedButton.styleFrom(
      //     //   textStyle: AppTextStyle.defaultFontStyle,
      //     // ),
      //     ),
      // textButtonTheme: TextButtonThemeData(
      //     // style: TextButton.styleFrom(
      //     //   textStyle: AppTextStyle.defaultFontStyle,
      //     // ),
      //     ),
      // //if we need to change some of the parameters
      // // textTheme: TextTheme(
      // //   headline1: AppTextStyle.headline1,
      // //   bodyText2: AppTextStyle.appBodyText,
      // // )
    );
  }

  // on DarkMode the Swatch parameter is not working
  // https://github.com/flutter/flutter/issues/19089
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.deepPurple,
      toggleableActiveColor: Colors.blue.shade500,

      // estilos de botonos del ejemplo 3 no implementados
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //     //     style: ElevatedButton.styleFrom(
      //     //   textStyle: AppTextStyle.defaultFontStyle,
      //     // )
      //     ),
      // outlinedButtonTheme: OutlinedButtonThemeData(
      //     // style: ElevatedButton.styleFrom(
      //     //   textStyle: AppTextStyle.defaultFontStyle,
      //     // ),
      //     ),
      // textButtonTheme: TextButtonThemeData(
      //     // style: TextButton.styleFrom(
      //     //   textStyle: AppTextStyle.defaultFontStyle,
      //     // ),
      //     ),
      // floatingActionButtonTheme: FloatingActionButtonThemeData(),

      // // copy from ligthTheme
      // inputDecorationTheme: ligthTheme.inputDecorationTheme,

      // //if we need to change some of the parameters
      // // textTheme: TextTheme(
      // //   headline1: AppTextStyle.headline1,
      // //   bodyText2: AppTextStyle.appBodyText,
      // // )
    );
  }
}

// -------pagina de test ------

// -------------------------------------------------
// stateful widget
// crear un StatefultWidget con un boton que cambie el la forma y el color de un container
class TesterPage extends StatefulWidget {
  const TesterPage({Key? key}) : super(key: key);

  @override
  _TesterPageState createState() => _TesterPageState();
}

// clase state que modifica el estado del boton
class _TesterPageState extends State<TesterPage> {
  // crear variable para cambiar el color del boton
  Color color = const Color(0xFF42A5F5);
  double alto = 50.0;
  double ancho = 200.0;
  double fuente = 15.0;
  String texto = 'Click para recuperar contraseña';

  // crear funcion para cambiar el color del boton
  void cambiarColor() {
    setState(() {
      if (color == const Color(0xFF42A5F5)) {
        color = Colors.red;
        alto = 100.0;
        ancho = 200.0;
        fuente = 25.0;
        texto = 'Contraseña recuperada';
      } else {
        color = const Color(0xFF42A5F5);
        alto = 50.0;
        ancho = 200.0;
        fuente = 15.0;
        texto = 'Click para recuperar contraseña';
      }
    });
  }

// metodo build que dibujo los widgets, aca se pueden poner toda la estructura que se construyo arriba para la red social
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          // margen interno del cuadro
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: MaterialButton(
            // color del boton
            color: color, // variable de cambio de color
            minWidth: ancho,
            height: alto,
            child: Text(texto,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fuente,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              // cambiar color del boton
              cambiarColor();
              print('boton funcionando');
            },
          )),
    );
  }

// metodo iniciador de clase
  @override
  void initState() {
    super.initState();
  }

// metodo para cerrar la clase
  @override
  void dispose() {
    super.dispose();
  }
}

// -------------------------------------------------

