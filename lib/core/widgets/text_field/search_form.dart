import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_store/core/constants/colors.dart';
import 'package:route_store/core/constants/images.dart';

import '../../../navigation/search_cubit.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: const _SearchFormContent(),
    );
  }
}

class _SearchFormContent extends StatelessWidget {
  const _SearchFormContent();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();

    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: BlocBuilder<SearchCubit, String>(
        builder: (context, searchQuery) {
          return TextField(
            onChanged: cubit.updateSearch,
            style: const TextStyle(color: RColors.primary, fontSize: 16),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  RImages.searchIcon,
                  height: 24,
                  width: 24,
                  color: RColors.primary,
                ),
              ),
              suffixIcon: searchQuery.isNotEmpty
                  ? IconButton(
                onPressed: cubit.clearSearch,
                icon: const Icon(Icons.clear, color: RColors.primary),
              )
                  : null,
              hintText: "what do your search for?",
              hintStyle: Theme.of(context).textTheme.labelMedium!.apply( color:  Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          );
        },
      ),
    );
  }
}