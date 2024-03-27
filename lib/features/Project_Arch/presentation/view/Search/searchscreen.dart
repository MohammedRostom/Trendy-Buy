import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import 'widgets/widgets.dart';

class searchsecreen extends StatelessWidget {
  const searchsecreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllproductsCubit, GetAllproductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SearchBody(),
        );
      },
    );
  }
}
