import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_with_cubit/core/components/C_Text.dart';
import 'package:note_app_with_cubit/core/components/Loader.dart';
import 'package:note_app_with_cubit/features/Project_Arch/data/models/productmodel.dart';
import '../../../../../../config/routing/routing.dart';
import '../../../../../../core/Methods/methods.dart';
import '../../../../../../core/components/C_btn.dart';
import '../../../../../../core/components/C_textfield.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../Cubits/Auth_cubit/auth_cubit.dart';
import '../../../Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import '../../../Cubits/addphoto_cubit/addphoto_cubit.dart';
import '../../../Cubits_controller/controllers.dart';

class AddProductBody extends StatelessWidget {
  AddProductBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: BlocConsumer<GetAllproductsCubit, GetAllproductsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [FristSection(), SecoundSectionInputFields()],
                ),
              ),
              Proudcts_Controller(context).ProductAdded ? Loader() : Text("")
            ],
          );
        },
      ),
    );
  }
}

class SecoundSectionInputFields extends StatelessWidget {
  const SecoundSectionInputFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                C_Text(
                  Y_Text: "Photo",
                  FontSize: 14,
                  Bold: FontWeight.normal,
                ),
                InkWell(
                  onTap: () {
                    Photo_model_Sheet(context);
                  },
                  child: C_Text(
                    Y_Text: Proudcts_Controller(context).fFlag
                        ? "Add photo"
                        : " Change ",
                    FontSize: 14,
                    FontColor: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            InkWell(
                onTap: () {
                  Photo_model_Sheet(context);
                },
                child: BlocConsumer<AddphotoCubit, AddphotoState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Container(
                      height: 130.h,
                      width: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5)),
                          color: Color.fromARGB(255, 246, 246, 246),
                          borderRadius: BorderRadius.circular(15)),
                      child: Photo_Controller(context).downloadURL == null
                          ? Icon(
                              Icons.add_photo_alternate_rounded,
                              size: 45.h,
                              color: Colors.grey,
                            )
                          : BlocConsumer<AddphotoCubit, AddphotoState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                return Photo_Controller(context).isblurlLoading
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Image.network(
                                        Photo_Controller(context).downloadURL);
                              },
                            ),
                    );
                  },
                )),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          child: C_TextField(
            ControllerText: Textcontrollers[0],
            hinttext: "Ex: Product 1",
            LabelText: "Title",
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        C_TextField(
            ControllerText: Textcontrollers[1],
            hinttext: "Ex: description 1",
            LabelText: "Description",
            onFieldSubmitted: (p) {}),
        SizedBox(
          height: 15.h,
        ),
        CategoryFeild(),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150.w,
              child: C_TextField(
                maxdigit: 6,
                keyboardType: TextInputType.number,
                ControllerText: Textcontrollers[3],
                hinttext: "Ex: 252 \$",
                LabelText: "Price",
              ),
            ),
            Container(
              width: 150.w,
              child: C_TextField(
                maxdigit: 3,
                keyboardType: TextInputType.number,
                ControllerText: Textcontrollers[4],
                hinttext: "Ex: 3.9",
                LabelText: "Rating",
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}

class CategoryFeild extends StatelessWidget {
  const CategoryFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showBottomSheet(
            context: context,
            builder: (context) => Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      Proudcts_Controller(context).groupOCategorys.length,
                      (index) => InkWell(
                            onTap: index == 0
                                ? null
                                : () {
                                    Textcontrollers[2].text =
                                        Proudcts_Controller(context)
                                            .groupOCategorys[index]
                                            .category;
                                    Navigator.pop(context);
                                  },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: index == 0
                                          ? BorderSide(
                                              width: 1, color: Colors.grey)
                                          : BorderSide.none)),
                              child: C_Text(
                                  Y_Text: index == 0
                                      ? Proudcts_Controller(context)
                                              .groupOCategorys[index]
                                              .category +
                                          " categories".toUpperCase()
                                      : Proudcts_Controller(context)
                                          .groupOCategorys[index]
                                          .category,
                                  FontSize: index == 0 ? 25 : 20,
                                  Bold: index == 0 ? FontWeight.w500 : null),
                            ),
                          )),
                ),
                width: double.infinity,
                height: 230.h,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 243, 243, 243)),
              ),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            C_TextField(
                suffixIcon: Icon(Icons.arrow_drop_down),
                ControllerText: Textcontrollers[2],
                hinttext: "Ex: women's clothing",
                LabelText: "Category",
                onFieldSubmitted: (p) {}),
            Container(
              width: 45,
              height: 70,
              decoration: BoxDecoration(color: Colors.transparent),
            ),
          ],
        ));
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeShowSection(),
            SizedBox(
              height: 12.h,
            ),
          ],
        );
      },
    );
  }
}

class WelcomeShowSection extends StatelessWidget {
  WelcomeShowSection({
    super.key,
    this.model,
  });
  final model;
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
                                Proudcts_Controller(context).fFlag
                                    ? "Add Product"
                                    : "Update Product",
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    letterSpacing: 1.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ]),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 80.w,
                    height: 40.h,
                    child: C_BTN(
                        TextBtn:
                            Proudcts_Controller(context).fFlag ? "Add" : "Save",
                        onTap: () {
                          Proudcts_Controller(context).fFlag
                              ? addproduct(context)
                              : Updateproduct(
                                  context,
                                  ModalRoute.of(context)!.settings.arguments
                                      as ProductModel);
                        },
                        SizeText: 18.5.sp),
                  ),
                ]),
          ),
        );
      },
    );
  }
}
