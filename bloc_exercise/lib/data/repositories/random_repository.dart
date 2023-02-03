import 'dart:math';

import '../models/data_home.dart';
import '../models/masakan.dart';
import '../models/user.dart';
import '../providers/masakan_provider.dart';
import '../providers/user_provider.dart';

class RandomRepository {
  UserProvider userProvider = UserProvider();
  MasakanProvider masakanProvider = MasakanProvider();

  Future<Map<String, dynamic>> getRandomData() async {
    Map<String, dynamic> dataUser = await userProvider.getDataUser();
    Map<String, dynamic> dataMasakan = await masakanProvider.getDataMasakan();

    if (dataUser["error"] == true) {
      return dataUser;
    }

    if (dataMasakan["error"] == true) {
      return dataMasakan;
    }

    // GET RANDOM USER
    UserModel userModel = dataUser["data"] as UserModel;

    late DataUser dataRandomUser;

    if (userModel.data != null) {
      dataRandomUser = userModel.data!.randomUser();
    } else {
      dataRandomUser = DataUser();
    }

    // GET RANDOM MASAKAN
    MasakanModel masakanModel = dataMasakan["data"] as MasakanModel;

    late Results dataRandomMasakan;

    if (masakanModel.results != null) {
      dataRandomMasakan = masakanModel.results!.randomMasakan();
    } else {
      dataRandomMasakan = Results();
    }

    // Memasukan ke dalam 1 kesatuan model / object
    return {
      "error": false,
      "message": "Berhasil mengambil database random user & masakan",
      "data": DataHomeModel(
        fullname: "${dataRandomUser.firstName} ${dataRandomUser.lastName}",
        email: "${dataRandomUser.email}",
        profile: "${dataRandomUser.avatar}",
        masakan: "${dataRandomMasakan.title}",
        gambarMasakan: "${dataRandomMasakan.thumb}",
        porsi: "${dataRandomMasakan.serving}",
        kesulitan: "${dataRandomMasakan.difficulty}",
      ),
    };
  }
}

extension RandomUser on List<DataUser> {
  DataUser randomUser() {
    return elementAt(Random().nextInt(length - 1));
  }
}

extension RandomMasakan on List<Results> {
  Results randomMasakan() {
    return elementAt(Random().nextInt(length - 1));
  }
}
