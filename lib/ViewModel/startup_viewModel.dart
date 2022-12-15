import 'package:ffood/Constant/route_constraint.dart';
import 'package:ffood/Model/DAO/AccountDAO.dart';
import 'package:ffood/ViewModel/base_model.dart';
import 'package:ffood/utils/shared_pref.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'root_viewModel.dart';

class StartUpViewModel extends BaseModel {
  StartUpViewModel() {
    handleStartUpLogic();
  }
  Future handleStartUpLogic() async {
    AccountDAO _accountDAO = AccountDAO();
    await Future.delayed(Duration(seconds: 3));
    var hasLoggedInUser = await _accountDAO.isUserLoggedIn();
    bool isFirstOnBoard = await getIsFirstOnboard() ?? true;
    if (isFirstOnBoard) {
      // await Get.find<RootViewModel>().startUp();
      Get.offAndToNamed(RoutHandler.ONBOARD);
    } else if (hasLoggedInUser) {
      await Get.find<RootViewModel>().startUp();
      Get.offAndToNamed(RoutHandler.NAV);
    } else {
      Get.offAndToNamed(RoutHandler.LOGIN);
    }
  }
}
