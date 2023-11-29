import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

class ClientController extends GetxController {
  Client client = Client();
 
  @override
  void onInit() {
    super.onInit();

    // const endPoint = "http://10.0.2.2:8080/v1";
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "6565d93d490ed34fa644";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
  }
}
