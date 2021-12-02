import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:modulos/presentation/pages/vistas.dart';

// -------------- PAGINA HOME ----------------------
// HOME: construir pagina home con logo y dos botones
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Home'),
        // ),
        body: BodyHome(context));
  }
}

// BODY: clase que continene el cuerpo de la pagina home
Widget BodyHome(context) {
  String textobtn;
  return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          // colocar imagen de fonde desde local
          image: AssetImage('assets/fondo3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        // top margin
        margin: EdgeInsets.only(top: 70),
        child: Column(
          // alineacion del contenido
          crossAxisAlignment: CrossAxisAlignment.stretch, // o center
          mainAxisAlignment: MainAxisAlignment.start,
          // widgets que contendra la pagina
          children: <Widget>[
            // imagen principal de home
            Logo(),
            const SizedBox(
              height: 30,
            ),
            // boton para ir a la pagina de login
            BotonDefault(context, textobtn = 'Iniciar Sesión'),
            const SizedBox(
              height: 20,
            ),
            BotonDefault(context, textobtn = 'Registrarse'),
          ],
        ),
      ));
}

// LOGO: widget para el logo de la app que cargue una imagen de local
Widget Logo() {
  return Container(
      // margen del contenedor
      margin: const EdgeInsets.all(8),
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Image.asset('assets/LOGO2.png', width: 200.0, height: 250.0));
}

// REDIRECCION: metodo para redireccionar a cada pagina desde menu
void _irPage(String textobtn) {
  if (textobtn == 'Iniciar Sesión') {
    Get.toNamed('/Login');
  } else {
    Get.toNamed('/Signup');
  }
}

// BOTONES: crear un widget que reciba una funcion y retorne un boton
Widget BotonDefault(context, textobtn) {
  return MaterialButton(
    color: Color.fromARGB(255, 83, 68, 145),
    minWidth: 250.0,
    height: 50.0,
    child: Text(textobtn,
        style: TextStyle(
            color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold)),
    onPressed: () {
      _irPage(textobtn);
      print('boton redireccionando');
    },
  );
}

// ---------------------PAGINA LOG IN-----------------------------
// LOG IN: Pagina de incio de sesion
class InicioSesion extends StatelessWidget {
  // constructor de clase
  InicioSesion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarLogin(), body: BodyLogin(context));
  }

// APPBAR: widget para el appbar de la pagina login
  PreferredSizeWidget AppBarLogin() {
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
      title:
          Text('Inicio de Sesión', style: TextStyle(color: Colors.grey[700])),
      // color de appbar
      backgroundColor: Colors.white,
    );
  }

  // BODY LOGIN: crear widget con imagen de fondo
  Widget BodyLogin(context) {
    String textobtn;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // colocar imagen de fonde desde local
            image: AssetImage('assets/fondo3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(10),
          //widgets inicio de sesión
          children: <Widget>[
            Logo(),
            // Titulo(),
            Usuario(),
            Contrasena(),
            const SizedBox(height: 6.0),
            BotonDefaultLogin(context, textobtn = 'Iniciar Sesión'),
            BotonGoogle(context, textobtn = 'Login with Google'),
            RecuperarPass(context, textobtn = '¿Olvidaste la Contraseña?'),
            Btnsingup(context, textobtn = 'Registrarse'),
            // Spacer()
          ],
        ));
  }

  // LOGO LOGIN: Crear widget para ellogo de la applicacacion que cargue una imagen de local
  Widget Logo() {
    return Container(
        // margen del contenedor
        margin: const EdgeInsets.all(5),
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Image.asset('assets/LOGO2.png', width: 200.0, height: 100.0));
  }

  // // crear widget para titulo inicio de sesión
  // Widget Titulo() {
  //   return Container(
  //       child: Text('Iniciar Sesión',
  //           style: TextStyle(
  //               // colocar color de texto en hexadecimal
  //               color: Colors.grey, // color morado en A rgb
  //               fontSize: 15.0,
  //               fontWeight: FontWeight.bold)));
  // }

  // TEXTO USUARIO LOGIN : widget para usuraio de ingreso
  Widget Usuario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: TextField(
        decoration: const InputDecoration(
            //put a border color
            border: UnderlineInputBorder(
              //borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.deepPurple),
            ),
            labelText: 'Usuario',
            //hintText: 'Usuario',
            fillColor: Colors.white30,
            filled: true),
        onChanged: (text) {
          print("texto escrito: $text");
        },
      ),
    );
  }

  // TEXTO CONTRASEÑA LOGIN: widget para usuraio de ingreso
  Widget Contrasena() {
    return Container(
      // margen interno del cuadro
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: const TextField(
        // cuadro de texto
        obscureText: true, // ocualta contraseña
        decoration: InputDecoration(
            labelText: 'Contraseña',
            //hintText: 'Contraseña', // nombre del campo
            fillColor: Colors.white30, // color de fondo
            filled: true),
      ),
    );
  }

//  BOTONES----
  // // widget para crear boton de inicio de sesión 2
  // Widget BotonInicio2(texto) {
  //   return MaterialButton(
  //     color: Color.fromARGB(255, 83, 68, 145),
  //     minWidth: 370.0,
  //     height: 50.0,
  //     child: Text('Iniciar Sesión',
  //         style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 15.0,
  //             fontWeight: FontWeight.bold)),
  //     onPressed: () {
  //       print('boton funcionando 2');
  //     },
  //   );
  // }

// REDIRECCION login: metodo para redireccionar a cada pagina desde menu
  void _irPage2(context, String textobtn) {
    if (textobtn == 'Iniciar Sesión') {
      Get.toNamed('/VistaPpal');
    } else if (textobtn == 'Login with Google') {
      Get.toNamed('/ImageGoogle');
    } else if (textobtn == '¿Olvidaste la Contraseña?') {
      Get.toNamed('/TesterPage'); //FIXME: clase no existe
    } else if (textobtn == 'Registrarse') {
      Get.toNamed('/Signup');
    } else {
      Get.toNamed('/Home');
    }
  }

// BOTONES login: crear un widget que reciba una funcion y retorne un boton
  Widget BotonDefaultLogin(context, textobtn) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: MaterialButton(
          color: Color.fromARGB(255, 83, 68, 145),
          minWidth: 250.0,
          height: 50.0,
          child: Text(textobtn,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold)),
          onPressed: () {
            _irPage2(context, textobtn);
            print('boton redireccionando');
          },
        ));
  }

  // BOTON REUCPERAR PASS LOGIN:  widget para crear boton de inicio de sesión 1
  Widget RecuperarPass(context, textobtn) {
    return TextButton(
      child: Text(textobtn,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15.0,
              fontWeight: FontWeight.bold)),
      onPressed: () {
        _irPage2(context, textobtn);
        print('boton funcionando');
      },
    );
  }

// BOTON SINGUP LOGIN: widget para crear boton de inicio de sesión 1
  Widget Btnsingup(context, textobtn) {
    return TextButton(
      child: Text(textobtn,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15.0,
              fontWeight: FontWeight.bold)),
      onPressed: () {
        _irPage(textobtn);
        print('boton funcionando singup');
      },
    );
  }

// BOTON GOOGLE LOGIN: create a button to log in wth google
  Widget BotonGoogle(context, textobtn) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: MaterialButton(
        color: Colors.white,
        minWidth: 250.0,
        height: 50.0,
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/googleicon.png',
              width: 30.0,
              height: 30.0,
            ),
            const SizedBox(
              width: 65.0,
            ),
            Text(textobtn,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        onPressed: () {
          _irPage2(context, textobtn);
          print('boton funcionando');
        },
      ),
    );
  }
}

//------- PAGINA REGISTRO USUARIO --------
// REGISTRO USUARIO: Pagina de registro de usuario
class SignUpPage extends StatelessWidget {
  // constructor de clase
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarSignUp(), body: BodySignUp(context));
  }

// APPBAR SIGNUP: widget para el appbar de la pagina login
  PreferredSizeWidget AppBarSignUp() {
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
      title: Text('Registrarse', style: TextStyle(color: Colors.grey[700])),
      // color de appbar
      backgroundColor: Colors.white,
    );
  }

  // BODY SIGNUP: crear widget con imagen de fondo
  Widget BodySignUp(context) {
    String textobtn;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // colocar imagen de fonde desde local
            image: AssetImage('assets/fondo3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(10),
          //widgets inicio de sesión
          children: <Widget>[
            Logo(),
            // Titulo(),
            Usuario(),
            Contrasena(),
            Correo(),
            const SizedBox(
              height: 6,
            ),
            BotonDefaultLogin(context, textobtn = 'Registrarse'),
            BotonGoogle(context, textobtn = 'Sign up with Google'),
            Btnlogin(context, textobtn = 'Iniciar Sesión'),
            // Spacer()
          ],
        ));
  }

  // LOGO SIGNUP: Crear widget para ellogo de la applicacacion que cargue una imagen de local
  Widget Logo() {
    return Container(
        // margen del contenedor
        margin: const EdgeInsets.all(5),
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Image.asset('assets/LOGO2.png', width: 200.0, height: 100.0));
  }

  // // crear widget para titulo inicio de sesión
  // Widget Titulo() {
  //   return Container(
  //       child: Text('Iniciar Sesión',
  //           style: TextStyle(
  //               // colocar color de texto en hexadecimal
  //               color: Colors.grey, // color morado en A rgb
  //               fontSize: 15.0,
  //               fontWeight: FontWeight.bold)));
  // }

  // TEXTO USUARIO SIGNUP : widget para usuraio de ingreso
  Widget Usuario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: TextField(
        decoration: const InputDecoration(
            //put a border color
            border: UnderlineInputBorder(
              //borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.deepPurple),
            ),
            labelText: 'Usuario',
            //hintText: 'Usuario',
            fillColor: Colors.white30,
            filled: true),
        onChanged: (text) {
          print("texto escrito: $text");
        },
      ),
    );
  }

  // TEXTO CONTRASEÑA SIGNUP: widget para usuraio de ingreso
  Widget Contrasena() {
    return Container(
      // margen interno del cuadro
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: const TextField(
        // cuadro de texto
        obscureText: true, // ocualta contraseña
        decoration: InputDecoration(
            labelText: 'Contraseña',
            //hintText: 'Contraseña', // nombre del campo
            fillColor: Colors.white30, // color de fondo
            filled: true),
      ),
    );
  }

  // TEXTO CONTRASEÑA SIGNUP : widget para usuraio de ingreso
  Widget Correo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: TextField(
        decoration: const InputDecoration(
            //put a border color
            border: UnderlineInputBorder(
              //borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.deepPurple),
            ),
            labelText: 'Correo',
            //hintText: 'Usuario',
            fillColor: Colors.white30,
            filled: true),
        onChanged: (text) {
          print("texto escrito: $text");
        },
      ),
    );
  }

// BOTONES--------
// BOTONES SIGNUP: crear un widget que reciba una funcion y retorne un boton
  Widget BotonDefaultLogin(context, textobtn) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: MaterialButton(
          color: Color.fromARGB(255, 83, 68, 145),
          minWidth: 250.0,
          height: 50.0,
          child: Text(textobtn,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold)),
          onPressed: () {
            _irPage2(context, textobtn);
            print('boton redireccionando');
          },
        ));
  }

// REDIRECCION SIGNUP: metodo para redireccionar a cada pagina desde menu
  void _irPage2(context, String textobtn) {
    if (textobtn == 'Registrarse') {
      Get.toNamed('/Profile');
    } else if (textobtn == 'Sign up with Google') {
      Get.toNamed('/ImageGoogle');
    } else if (textobtn == 'Iniciar Sesión') {
      Get.toNamed('/Login');
    } else {
      Get.to(HomePage()); // forma sin ruta de ir
    }
  }

  // // widget para crear boton de inicio de sesión 2
  // Widget BotonInicio2(texto) {
  //   return MaterialButton(
  //     color: Color.fromARGB(255, 83, 68, 145),
  //     minWidth: 370.0,
  //     height: 50.0,
  //     child: Text('Iniciar Sesión',
  //         style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 15.0,
  //             fontWeight: FontWeight.bold)),
  //     onPressed: () {
  //       print('boton funcionando 2');
  //     },
  //   );
  // }

// BOTON SINGUP LOGIN: widget para crear boton de inicio de sesión 1
  Widget Btnlogin(context, textobtn) {
    return TextButton(
      child: Text('Iniciar Sesión',
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15.0,
              fontWeight: FontWeight.bold)),
      onPressed: () {
        _irPage2(context, textobtn);
        print('boton funcionando singup');
      },
    );
  }

// BOTON GOOGLE LOGIN: create a button to log in wth google
  Widget BotonGoogle(context, textobtn) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: MaterialButton(
        color: Colors.white,
        minWidth: 250.0,
        height: 50.0,
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/googleicon.png',
              width: 30.0,
              height: 30.0,
            ),
            const SizedBox(
              width: 65.0,
            ),
            Text(textobtn,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        onPressed: () {
          _irPage2(context, textobtn);
          print('boton funcionando');
        },
      ),
    );
  }
}

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
        _irPage2(context, textobtn);
        print('boton redireccionando');
      },
    );
  }

// REDIRECCION login: metodo para redireccionar a cada pagina desde menu
  void _irPage2(context, String textobtn) {
    if (textobtn == 'Ir a home') {
      Get.to(VistaPpal());
    } else {
      Get.to(ProfilePage());
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


// ------------------------------------
