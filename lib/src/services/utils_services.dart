//classe para serviços como formataçao de valores,
//formato de datas etc..
import 'package:intl/intl.dart';

class UtilsServices{

  //converter o preço para uma moeda.
  String priceToCurrency(double price){

    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: "pt_BR");
    
    return numberFormat.format(price);

  }
}