import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_cubit/firebase_options.dart';
import 'core/Cache/cache.dart';
import 'core/Methods/methods.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'features/Project_Arch/presentation/Cubits/Auth_cubit/auth_cubit.dart';
import 'features/Project_Arch/presentation/Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import 'features/Project_Arch/presentation/Cubits/addphoto_cubit/addphoto_cubit.dart';
import 'features/Project_Arch/presentation/Cubits/searsh_cubit/searsh_cubit_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();
  // var email = PreferencesService.getUserName("Username");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();

  runApp(NotesApp(
    username: User,
  ));
}

class NotesApp extends StatelessWidget {
  NotesApp({
    Key? key,
    required this.username,
  }) : super(key: key);
  final username;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => SearshCubitCubit(),
        ),
        BlocProvider(
          create: (context) => AddphotoCubit(),
        ),
        BlocProvider(
            create: (context) => GetAllproductsCubit()
              ..CallAllMethodsMustBeCalledGetAllData(context))
      ],
      child: StartManger(user: username),
    );
  }
}
