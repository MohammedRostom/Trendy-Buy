import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app_with_cubit/core/utils/Assets.dart';
import 'package:note_app_with_cubit/core/utils/Colors.dart';
import 'package:note_app_with_cubit/core/components/C_Text.dart';
import 'package:note_app_with_cubit/features/Project_Arch/data/models/productmodel.dart';
import '../../../../../../core/components/C_textfield.dart';
import '../../../../../../core/components/Loader.dart';
import '../../../Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import '../../../Cubits/searsh_cubit/searsh_cubit_cubit.dart';
import '../../../Cubits_controller/controllers.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FristSection(),
        SecoundSection(),
      ],
    );
  }
}

class SecoundSection extends StatelessWidget {
  const SecoundSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearshCubitCubit, SearshCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Container(
            height: MediaQuery.of(context).size.height - 200.h,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      C_Text(
                        Y_Text: "Search result",
                        FontSize: 17.sp,
                      ),
                      Icon(Icons.filter_list)
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                MoreProducts()
              ],
            ),
          ),
        );
      },
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
      height: MediaQuery.of(context).size.height - 230.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Search_Controller(context).isStartedSearch
              ? Center(child: CircularProgressIndicator())
              : Container(
                  child: Column(
                    children: List.generate(
                        Search_Controller(context)
                            .GroupFoResultsfromSearched
                            .length,
                        (index) => Listitem(
                            product: Search_Controller(context)
                                .GroupFoResultsfromSearched[index])),
                  ),
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
      child: Container(
        width: 220.w,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 2, color: Colors.grey.withOpacity(0.2)),
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
                                    fontSize: 23, fontWeight: FontWeight.w500),
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
                  Y_Text: Product.rating.rate.toString(),
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
    );
  }
}

class FristSection extends StatelessWidget {
  const FristSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearshCubitCubit, SearshCubitState>(
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
                ],
              ),
            ),
          ],
        );
      },
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
        height: 180.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: Offset(0, 8),
                blurRadius: 15),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          border: Border.all(
              width: 5,
              color: Color(0xff41A4FF).withOpacity(0.4),
              strokeAlign: BorderSide.strokeAlignOutside),
        ));
  }
}

class SearchBar extends StatefulWidget {
  SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode _searchFocus = FocusNode();
  TextEditingController textController = TextEditingController();
  void initState() {
    _searchFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        C_TextField(
          FoucNode: _searchFocus,
          onFieldSubmitted: (value) {
            Search_Controller(context).SearchProducts(value: value);
          },
          ControllerText: textController,
          hinttext: "Search",
          LabelText: "",
          is_secure: false,
          suffixIcon: Icon(Icons.search),
        ),
      ],
    );
  }
}

class WelcomeShowSection extends StatelessWidget {
  const WelcomeShowSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Container(
          height: 45.h,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(Icons.sort_rounded),
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(
                "Search",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.sp,
                    letterSpacing: 1.sp),
              ),
            ),
            Icon(
              Icons.sort_rounded,
              color: Colors.transparent,
            ),
          ]),
        ),
      ),
    );
  }
}
