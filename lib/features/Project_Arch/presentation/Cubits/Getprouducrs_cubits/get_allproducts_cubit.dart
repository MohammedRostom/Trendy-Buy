import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/Methods/methods.dart';
import '../../../data/data_sources/remote/Api/ApiServises.dart';
import '../../../data/models/categorymodel.dart';
import '../../../data/models/productmodel.dart';
import '../../../data/repositories_impl/Api_repo.dart';
part 'get_allproducts_state.dart';

class GetAllproductsCubit extends Cubit<GetAllproductsState> {
  GetAllproductsCubit() : super(GetAllproductsInitial());
  static GetAllproductsCubit get(contexct) =>
      BlocProvider.of<GetAllproductsCubit>(contexct);
  bool isloadingg = false;
  bool productLaodng = false;
  List<ProductModel> groupOproducts = [];
  // Get All Products
  Future<List<ProductModel>> GetAllProducts([bool? Flag_loder]) async {
    try {
      productLaodng = Flag_loder ?? true;
      emit(loadingdata());
      groupOproducts = await reboApi().GetProductsfromrepo();

      print(groupOproducts.length);
      productLaodng = false;
      emit(Successloadingdata());
    } on Exception catch (e) {}
    return groupOproducts;
  }

// AddProduct
  bool ProductAdded = false;
  Future<dynamic> AddProduct(ProductModel Product) async {
    ProductAdded = true;
    emit(Any_Action());
    await GetDataFromApi().Addproduct(Product);
    GetAllProducts(true);
    ProductAdded = false;
    emit(Any_Action());
  }

//DeleteProduct
  Future<dynamic> DeleteProduct(ProductModel Product) async {
    await GetDataFromApi().DeleteProduct(Product);
    GetAllProducts(true);
    emit(Any_Action());
  }

//UpdateProduct
  Future<dynamic> UpdateProduct(ProductModel Product) async {
    ProductAdded = true;
    emit(Any_Action());
    await GetDataFromApi().UpdateProduct(Product);
    GetAllProducts(true);
    ProductAdded = false;
    emit(Any_Action());
  }

  bool fFlag = false;
  CheckIfAddOrUpdateProduct(bool flag) {
    fFlag = flag;
    emit(Any_Action());
    print(fFlag);
  }

  List<ProductModel> newp1 = [];
  List<ProductModel> SearchProduct = [];
  bool gatedorySlected = false;

  int SlectedCategoryIndex = 0;
  GetogorySwithching(int index) {
    SlectedCategoryIndex = index;
    emit(Any_Action());
  }

  Future<List<ProductModel>> GetNameOfCategory(namcategory) async {
    emit(Successloadingdata());
    print(namcategory);
    List<ProductModel> products = await GetAllProducts();
    if (namcategory != groupOCategorys[0]) {
      GetCtegory = true;
      newp1 = products
          .where((element) => element.category.contains("$namcategory"))
          .toList();
      GetCtegory = false;
      isloadingg = false;
      emit(Successloadingdata());
      print(newp1.length);
      return await newp1;
    } else {
      return await GetAllProducts();
    }
  }

  bool GetCtegory = false;
  List<Categorymodel> groupOCategorys = [];
  Future<List<Categorymodel>> GetAllCategorys() async {
    GetCtegory = true;
    emit(loadingdata());
    groupOCategorys = await reboApi().GetCategoryfromrepo();
    groupOCategorys.insert(0, Categorymodel(id: "0", category: "All"));

    try {
      GetCtegory = false;
      gatedorySlected = false;
      emit(Successloadingdata());
    } on Exception catch (e) {
      // TODO
    }
    print(groupOCategorys.length);
    return await groupOCategorys;
  }

  bool isMore = false;
  ismore() {
    isMore = !isMore;
    emit(Any_Action());
    print(isMore);
  }

  void CallAllMethodsMustBeCalledGetAllData(context) async {
    isloadingg = true;

    List<ProductModel> products = await GetAllProducts();
    emit(Successloadingdata());

    await GetAllCategorys();

    isloadingg = false;
    emit(Successloadingdata());
  }
}
