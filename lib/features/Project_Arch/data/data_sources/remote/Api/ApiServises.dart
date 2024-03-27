import 'package:note_app_with_cubit/features/Project_Arch/data/models/productmodel.dart';
import '../../../../../../core/Api_helper/api.dart';
import '../../../../../../core/utils/constants.dart';

class GetDataFromApi {
  Future<dynamic> GetCategorys() async {
    var response = await ApiHelper().get(
      url: "$Purl/cateogry",
    );

    return response["data"]["categories"];
  }

  Future<dynamic> Getproducts() async {
    var response = await ApiHelper().get(
      url: "$Purl/product",
    );

    return response["data"]["product"];
  }

  Future<void> Addproduct(
    Model,
  ) async {
    try {
      await ApiHelper().Post(Model, Url: "$Purl/product");
    } catch (e) {
      // Handle errors
      throw Exception('Failed to add product: $e');
    }
  }

  Future<void> UpdateProduct(
    ProductModel Model,
  ) async {
    try {
      await ApiHelper().update(Model, url: "$Purl/product/${Model.id}");
    } catch (e) {
      // Handle errors
      throw Exception('Failed to add product: $e');
    }
  }

  Future<void> DeleteProduct(
    ProductModel product,
  ) async {
    try {
      await ApiHelper().delete(
        Url: "$Purl/product/${product.id}",
      );
    } catch (e) {
      // Handle errors
      throw Exception('Failed to add product: $e');
    }
  }

//   Get all users
  Future<dynamic> GetAllusers() async {
    var response = await ApiHelper().get(
      url: "$Purl/users",
    );

    return response["data"]["users"];
  }

  Future<dynamic> adduser(Model, endPoint) async {
    try {
      var user = await ApiHelper().Post(Model, Url: "$Purl/users/$endPoint");
      print("============================>$user");
      if (user.containsKey("token")) {
        return user;
      } else {
        return user["message"];
      }
    } catch (e) {}
  }
}
