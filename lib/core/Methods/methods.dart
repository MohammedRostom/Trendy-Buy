import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app_with_cubit/core/utils/Assets.dart';
import 'package:note_app_with_cubit/features/Project_Arch/data/models/productmodel.dart';
import '../../config/routing/routing.dart';
import '../../features/Project_Arch/presentation/Cubits_controller/controllers.dart';
import '../../features/Project_Arch/presentation/view/signup/signup.dart';
import '../components/C_Text.dart';
import '../utils/constants.dart';

void LoginORSignupDoneMetthod(context,
    {required String content,
    required Widget widget,
    bool? ismove,
    Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 700),
      backgroundColor: color ?? Colors.blue,
      content: Text(content)));
  if (ismove == true) {
    Future.delayed(
        Duration(milliseconds: 1700),
        () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => widget,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            ));
  }
}

Future<dynamic> Photo_model_Sheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Take Photo'),
              onTap: () {
                Photo_Controller(context).uploadImageFrom_gallery_or_camera(
                  context,
                  gallery_or_camera: "camera",
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Choose from Gallery'),
              onTap: () {
                Photo_Controller(context).uploadImageFrom_gallery_or_camera(
                  context,
                  gallery_or_camera: "gallery",
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

void addproduct(context) {
  ProductModel newproduct = ProductModel(
      title: Textcontrollers[0].text,
      price: Textcontrollers[3].text,
      description: Textcontrollers[1].text,
      category: Textcontrollers[2].text,
      image: Photo_Controller(context).downloadURL,
      rating: Rating(rate: double.parse(Textcontrollers[4].text)));
  Proudcts_Controller(context)
      .AddProduct(newproduct)
      .then((value) => Navigator.popAndPushNamed(context, Routeing.HomeS));
}

void Updateproduct(context, ProductModel productModel) {
  ProductModel newproduct = ProductModel(
      id: productModel.id,
      title: Textcontrollers[0].text,
      price: Textcontrollers[3].text,
      description: Textcontrollers[1].text,
      category: Textcontrollers[2].text,
      image: Photo_Controller(context).downloadURL,
      rating: Rating(rate: double.parse(Textcontrollers[4].text)));
  Proudcts_Controller(context)
      .UpdateProduct(newproduct)
      .then((value) => Navigator.pushNamed(context, Routeing.HomeS));
}

class StartManger extends StatelessWidget {
  const StartManger({
    super.key,
    required this.user,
  });
  final user;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          routes: Routeing.MapOfAppRoutes,
          // initialRoute: user != null ? Routeing.Login : Routeing.sginup,
          initialRoute: Routeing.start),
    );
  }
}

void DelaySplachScreen(BuildContext context) {
  Future.delayed(Duration(milliseconds: 4200), () {
    // Navigate to the next screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Signupscreen()),
    );
  });
}

bool functionCalled = false;

// Function that should be called only once

void showAlertDialog(BuildContext context, {Function()? onPressed}) {
  Future.delayed(Duration(seconds: 3), () {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: AlertDialog(
              title: Center(
                child: C_Text(
                  Y_Text: " Your Token (JWT)",
                  FontSize: 25,
                ),
              ),
              content: Container(
                height: 150 + 194,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          LottieBuilder.asset(
                            Asset_App.token,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          C_Text(
                              Y_Text: Auth_Contrller(context).Token,
                              FontSize: 20,
                              FontColor: Colors.blue,
                              Bold: FontWeight.bold),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        'Close',
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        if (onPressed != null) {
                          onPressed(); // Call the provided function if available
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  });
}
