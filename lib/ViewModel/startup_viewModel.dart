import 'package:ffood/ViewModel/base_model.dart';
import 'package:ffood/utils/shared_pref.dart';

class StartUpViewModel extends BaseModel {
  StartUpViewModel() {
    handleStartUpLogic();
  }
  Future handleStartUpLogic() async {
    // AccountDAO _accountDAO = AccountDAO();
    await Future.delayed(Duration(seconds: 3));
    // var hasLoggedInUser = await _accountDAO.isUserLoggedIn();
    bool isFirstOnBoard = await getIsFirstOnboard() ?? true;
  }
}
