import 'package:http/http.dart';
import 'dart:convert';

//import 'package:pokedex/data/response/list_pokemons_response.dart';
import './app_exception.dart';

dynamic returnResponse(Response response) {
  var responseJson = json.decode(response.body.toString());

  switch (response.statusCode) {
    case 200:
      return response.body;
    case 400:
      throw BadRequestException(message: responseJson['err']['message']);
    case 401:
    case 403:
      throw UnauthorizedException(message: responseJson['err']['message']);
    case 404:
      throw NotFoundException(message: responseJson['err']['message']);
    case 500:
      throw InternalServerException(message: responseJson['err']['message']);
    case 20201:
      throw InvalidInputException(message: responseJson['err']['message']);
    default:
      throw FetchDataException(
          message:
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
