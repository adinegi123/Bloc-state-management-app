import 'package:bloc_state_management_youtube/features/home/bloc/home_bloc.dart';
import 'package:bloc_state_management_youtube/features/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/bloc/ui/cart.dart';
import '../../wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(
        HomeInitialFetchEvent()); //to add the intial event as soon as the app opens
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) =>
          current is HomeActionState, //listen when action state
      buildWhen: (previous, current) => current
          is! HomeActionState, //build when not action state and it is build state
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          //if state is this then take this action
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const Cart()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          //if state is this then take this action
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const Wishlist()));
        } else if (state is HomeProductItemsWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item wishlisted')));
        } else if (state is HomeProductItemsAddedToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item added to cart')));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );

          case HomeLoadedSuccessState:
            final sucessState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('grocery products'),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      //even

                      homeBloc.add(
                          HomeWishListButtonNavigateClickEvent()); //when this button is clicked it will call an event method ocurred which will call state change
                    },
                    icon: const Icon(Icons.favorite_outline_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateClickEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  )
                ],
              ),
              body: ListView.builder(
                  itemCount: sucessState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        homeBloc: homeBloc,
                        productDataModel: sucessState.products[index]);
                  }),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(child: Text('Error while loading')),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
