import 'package:http/http.dart' as http;
// https://developers.google.com/books/docs/v1/using
import 'dart:convert' as convert;


void main() async {
// https://www.googleapis.com/books/v1/volumes?q=search+terms
  var url = Uri.http('10.14.20.6', 'users/celindex');

  var retorno = await http.get(url);
  if (retorno.statusCode == 200) {
    print(retorno.body);
  } else {
    print("Erro");
  }
}
