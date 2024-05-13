import '../services/log_service.dart';

class ConcurrencyRepository {
  List<String> images = ['iu_0.png', 'iu_1.png', 'iu_2.png'];
  List<int> delay = [2000, 1400, 2500];

  Future<String> getImage(int index) async {
    LogService.i((index % 3).toString());
    await Future.delayed(Duration(milliseconds: delay[index % 3]));
    LogService.i('result : ${images[index % 3]}');
    return images[index % 3];
  }
}