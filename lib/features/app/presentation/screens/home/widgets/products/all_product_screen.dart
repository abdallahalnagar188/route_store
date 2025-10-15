import 'package:flutter/material.dart';
import 'package:route_store/core/constants/sizes.dart';

import 'all_product_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_store/core/di/di.dart';
import 'package:route_store/features/app/presentation/viewmodels/product/product_cubit.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: BlocProvider<ProductCubit>(
        create: (context) => sl<ProductCubit>(),
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: const AllProductWidget(),
        ),
      ),
    );
  }
}