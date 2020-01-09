import 'package:intl/intl.dart';

class CurrentDateTime{
  String getDateToday(){
    var today = DateTime.now();
    String formattedDate = DateFormat.yMMMEd().add_jm().format(today);
    return formattedDate;
  }
}

