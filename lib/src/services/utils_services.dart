//classe para serviços como formataçao de valores,
//formato de datas etc..
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {
  //converter o preço para uma moeda.
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: "pt_BR");

    return numberFormat.format(price);
  }

  //metodo para retornar uma data formatada, usar no order_tile
  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();
    //apresentaçao da date, hora e minuto
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }
}
