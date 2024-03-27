import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app_with_cubit/core/utils/Assets.dart';
import 'package:note_app_with_cubit/core/utils/Colors.dart';
import 'package:note_app_with_cubit/core/components/C_Text.dart';
import 'package:note_app_with_cubit/core/utils/constants.dart';
import 'package:note_app_with_cubit/features/Project_Arch/data/models/productmodel.dart';
import 'package:note_app_with_cubit/features/Project_Arch/presentation/Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import '../../../../../../config/routing/routing.dart';
import '../../../../../../core/Methods/methods.dart';
import '../../../../../../core/components/C_textfield.dart';
import '../../../../../../core/components/Loader.dart';
import '../../../Cubits/Auth_cubit/auth_cubit.dart';
import '../../../Cubits_controller/controllers.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Proudcts_Controller(context).isloadingg
        ? Loader()
        : Column(
            children: [
              FristSection(),
              SecoundSection(),
            ],
          );
  }
}

class SecoundSection extends StatefulWidget {
  const SecoundSection({
    super.key,
  });

  @override
  State<SecoundSection> createState() => _SecoundSectionState();
}

class _SecoundSectionState extends State<SecoundSection> {
  @override
  void initState() {
    showAlertDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Container(
        height: MediaQuery.of(context).size.height - 280.h,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  C_Text(
                    Y_Text: "Products",
                    FontSize: 17.sp,
                  ),
                  InkWell(
                    onTap: () {
                      Proudcts_Controller(context).ismore();
                    },
                    child: C_Text(
                      Y_Text:
                          Proudcts_Controller(context).isMore ? "Less" : "More",
                      FontSize: 15.sp,
                      FontColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Proudcts_Controller(context).isMore
                ? MoreProducts()
                : LessProducts(),
          ],
        ),
      ),
    );
  }
}

class MoreProducts extends StatelessWidget {
  const MoreProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 300.h,
      child: Proudcts_Controller(context).productLaodng ||
              Proudcts_Controller(context).GetCtegory
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  children: List.generate(
                      Proudcts_Controller(context).newp1.isNotEmpty
                          ? Proudcts_Controller(context).newp1.length
                          : Proudcts_Controller(context).groupOproducts.length,
                      (index) => Dismissible(
                            background: Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, left: 4, bottom: 4),
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(14),
                                    child: Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                  color:
                                      const Color.fromARGB(255, 255, 100, 89)),
                            ),
                            onDismissed: (direction) {
                              print(Proudcts_Controller(context)
                                      .newp1
                                      .isNotEmpty
                                  ? Proudcts_Controller(context).newp1[index].id
                                  : Proudcts_Controller(context)
                                      .groupOproducts[index]
                                      .id);

                              Proudcts_Controller(context).DeleteProduct(
                                  Proudcts_Controller(context).newp1.isNotEmpty
                                      ? Proudcts_Controller(context)
                                          .newp1[index]
                                      : Proudcts_Controller(context)
                                          .groupOproducts[index]);
                            },
                            direction: DismissDirection.endToStart,
                            key: UniqueKey(),
                            child: Listitem(
                              product: Proudcts_Controller(context)
                                      .newp1
                                      .isNotEmpty
                                  ? Proudcts_Controller(context).newp1[index]
                                  : Proudcts_Controller(context)
                                      .groupOproducts[index],
                            ),
                          )),
                ),
              ),
            ),
    );
  }
}

class Listitem extends StatelessWidget {
  const Listitem({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
            color: BackWhite, borderRadius: BorderRadius.circular(12)),
        height: 90.h,
        child: ListTile(
          minLeadingWidth: 90,
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              C_Text(
                FontColor: Colors.blue,
                Y_Text: "${product.price}\$",
                FontSize: 18,
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Color.fromARGB(255, 212, 116, 20),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  C_Text(
                    Y_Text: product.rating.rate.toString(),
                    FontSize: 16,
                  )
                ]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(11)),
                  color:
                      const Color.fromARGB(255, 220, 220, 220).withOpacity(0.8),
                ),
                height: 20,
                width: 50.w,
              )
            ],
          ),
          leading: Container(
            child: Image.network(product.image),
            width: 100.w,
            height: 50.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          ),
          title: Text(
            "${product.title}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            "${product.description}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class LessProducts extends StatelessWidget {
  const LessProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductsSection(),
        SizedBox(
          height: 4.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              C_Text(
                Y_Text: "Popular ",
                FontSize: 16.sp,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        TrendySection(),
      ],
    );
  }
}

class TrendySection extends StatelessWidget {
  const TrendySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                Imgs.length,
                (index) => TrenduItem(
                      index: index,
                    )),
          ),
        ),
        height: MediaQuery.of(context).size.height - (280.h + 332.h),
      ),
    );
  }
}

class ProductsSection extends StatelessWidget {
  const ProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllproductsCubit, GetAllproductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Proudcts_Controller(context).productLaodng ||
                      Proudcts_Controller(context).GetCtegory
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      children: List.generate(
                          Proudcts_Controller(context).newp1.isNotEmpty
                              ? Proudcts_Controller(context).newp1.length
                              : Proudcts_Controller(context)
                                  .groupOproducts
                                  .length,
                          (index) => ProductItem(
                                index: index,
                                Product: Proudcts_Controller(context)
                                        .newp1
                                        .isNotEmpty
                                    ? Proudcts_Controller(context).newp1[index]
                                    : Proudcts_Controller(context)
                                        .groupOproducts[index],
                              )),
                    ),
            ),
            height: 290.h,
          ),
        );
      },
    );
  }
}

class FloatinBtn extends StatelessWidget {
  const FloatinBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Photo_Controller(context).downloadURL = null;
        Textcontrollers.forEach((element) {
          element.text = "";
        });
        Navigator.pushNamed(context, Routeing.AddProduct);
        Proudcts_Controller(context).CheckIfAddOrUpdateProduct(true);
      },
      child: Container(
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(15)),
        width: 65.w,
        height: 55.h,
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  ProductItem({
    super.key,
    required this.index,
    required this.Product,
  });
  final ProductModel Product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, bottom: 8),
      child: InkWell(
        onTap: () {
          Photo_Controller(context).downloadURL = Product.image;
          Textcontrollers[0].text = Product.title;
          Textcontrollers[1].text = Product.description;
          Textcontrollers[2].text = Product.category;
          Textcontrollers[3].text = Product.price;
          Textcontrollers[4].text = Product.rating.rate.toString();
          Navigator.pushNamed(context, Routeing.AddProduct, arguments: Product);
          print(Product.toJson());
          Proudcts_Controller(context).CheckIfAddOrUpdateProduct(false);
        },
        child: Container(
          width: 220.w,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Colors.grey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(12),
                    color: BackWhite),
                height: double.maxFinite,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      Product.image,
                      fit: BoxFit.contain,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 220.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 62.h,
                    width: double.maxFinite,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 150),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${Product.title}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500),
                                ),
                                C_Text(
                                  Y_Text: "${Product.price} \$",
                                  FontSize: 21,
                                  FontColor: Colors.blue,
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 25,
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: SvgPicture.asset(Asset_App.Bag),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
              Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Color.fromARGB(255, 212, 116, 20),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  C_Text(
                    Y_Text: Product.rating.rate == null
                        ? "0"
                        : Product.rating.rate.toString(),
                    FontSize: 19,
                  )
                ]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(11)),
                  color:
                      const Color.fromARGB(255, 220, 220, 220).withOpacity(0.8),
                ),
                height: 30,
                width: 60.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TrenduItem extends StatelessWidget {
  const TrenduItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, bottom: 5),
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              "${Imgs[index]}",
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: BackWhite,
            ),
            width: 95.w,
            height: double.maxFinite,
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.star,
                size: 15,
                color: Color.fromARGB(255, 212, 116, 20),
              ),
              SizedBox(
                width: 5,
              ),
              C_Text(
                Y_Text: Proudcts_Controller(context)
                    .groupOproducts[index]
                    .rating
                    .rate
                    .toString(),
                FontSize: 10,
              )
            ]),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(11)),
              color: const Color.fromARGB(255, 220, 220, 220).withOpacity(0.8),
            ),
            height: 20,
            width: 40.w,
          )
        ],
      ),
    );
  }
}

class FristSection extends StatelessWidget {
  const FristSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllproductsCubit, GetAllproductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          children: [
            HeroSection(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeShowSection(),
                  SearchBar(),
                  SizedBox(
                    height: 15.h,
                  ),
                  C_Text(
                    Y_Text: "Categories",
                    FontSize: 17.sp,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CategorySection()
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            Proudcts_Controller(context).groupOCategorys.length,
            (index) => CategoryItem(
                  index: index,
                )),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Proudcts_Controller(context).GetNameOfCategory(
            Proudcts_Controller(context).groupOCategorys[index].category);
        Proudcts_Controller(context).GetogorySwithching(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 6),
        child: Column(
          children: [
            AnimatedContainer(
                duration: Duration(milliseconds: 400),
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  "${Proudcts_Controller(context).groupOCategorys[index].category}",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: index ==
                              Proudcts_Controller(context).SlectedCategoryIndex
                          ? Colors.white
                          : Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                width:
                    index == Proudcts_Controller(context).SlectedCategoryIndex
                        ? 100.w
                        : 78.w,
                height: 40.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: index ==
                              Proudcts_Controller(context).SlectedCategoryIndex
                          ? const Color.fromARGB(255, 25, 107, 174)
                          : BackWhite,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: index ==
                            Proudcts_Controller(context).SlectedCategoryIndex
                        ? Colors.blue
                        : Color(0xfff0f0f0))),
            SizedBox(
              height: 3.5.h,
            ),
            CircleAvatar(
              radius: 4,
              backgroundColor:
                  index == Proudcts_Controller(context).SlectedCategoryIndex
                      ? Colors.blue.withOpacity(0.6)
                      : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: Offset(0, 8),
                blurRadius: 15),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          border: Border.all(
              width: 5,
              color: Color(0xff41A4FF).withOpacity(0.4),
              strokeAlign: BorderSide.strokeAlignOutside),
        ));
  }
}

class SearchBar extends StatelessWidget {
  SearchBar({
    super.key,
  });
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        C_TextField(
          ControllerText: textController,
          hinttext: "Search",
          LabelText: "",
          is_secure: false,
          suffixIcon: Icon(Icons.search),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routeing.Search);
          },
          child: Container(
            color: Colors.transparent,
            width: 400.w,
            height: 60,
          ),
        ),
      ],
    );
  }
}

class WelcomeShowSection extends StatelessWidget {
  WelcomeShowSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 54.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Hi,",
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    letterSpacing: 1.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Text(
                                    Auth_Contrller(context).username.substring(
                                        0,
                                        Auth_Contrller(context)
                                                    .username
                                                    .length >
                                                16
                                            ? Auth_Contrller(context)
                                                    .username
                                                    .length -
                                                20
                                            : 15),
                                    // "${PreferencesService.getUserName("Username")!.toUpperCase().substring(0, PreferencesService.getUserName("Username")!.length - 19)}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25.sp,
                                        letterSpacing: 1.sp),
                                  )),
                            ]),
                        SizedBox(
                          height: 4.h,
                        ),
                        Opacity(
                          opacity: 0.67,
                          child: Text(
                            " Your Order Is Here",
                            style: TextStyle(
                                fontSize: 15.2.sp, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 54.w,
                        height: 54.h,
                        child: SvgPicture.asset(Asset_App.Logo),
                      ),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                ]),
          ),
        );
      },
    );
  }
}
