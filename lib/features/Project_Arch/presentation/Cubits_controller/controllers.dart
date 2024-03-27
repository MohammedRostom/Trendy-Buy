import 'package:note_app_with_cubit/features/Project_Arch/presentation/Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import 'package:note_app_with_cubit/features/Project_Arch/presentation/Cubits/addphoto_cubit/addphoto_cubit.dart';
import '../Cubits/Auth_cubit/auth_cubit.dart';
import '../Cubits/searsh_cubit/searsh_cubit_cubit.dart';

AuthCubit Auth_Contrller(Context) => AuthCubit.get(Context);

GetAllproductsCubit Proudcts_Controller(context) =>
    GetAllproductsCubit.get(context);

AddphotoCubit Photo_Controller(context) => AddphotoCubit.get(context);

SearshCubitCubit Search_Controller(Context) => SearshCubitCubit.get(Context);
