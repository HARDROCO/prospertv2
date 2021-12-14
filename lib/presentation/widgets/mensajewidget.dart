import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MensajeWidget extends StatelessWidget {
  late final String texto;
  late final DateTime fecha;

  MensajeWidget(this.texto, this.fecha);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1, top: 5, right: 1, bottom: 2),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 2.0,
                  offset: Offset(0, 1.0),
                )
              ],
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.white,
            ),
            child: MaterialButton(
              disabledTextColor: Colors.black87,
              padding: EdgeInsets.only(left: 18),
              onPressed: null,
              child: Wrap(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: Text(texto)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                DateFormat('kk:mma, dd-MM-yyyy').format(fecha).toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}