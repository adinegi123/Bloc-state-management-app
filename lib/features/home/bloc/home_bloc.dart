import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management_youtube/data/cart_items.dart';
import 'package:bloc_state_management_youtube/data/grocery_data.dart';
import 'package:bloc_state_management_youtube/data/wishlist_items.dart';
import 'package:meta/meta.dart';
import '../models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialFetchEvent>(homeInitialFetchEvent);
    on<HomeProdutWishlistButtonClickedEvent>(
        homeProdutWishlistButtonClickedEvent);
    on<HomeProdutCartButtonClickedEvent>(homeProdutCartButtonClickedEvent);
    on<HomeWishListButtonNavigateClickEvent>(
        homeWishListButtonNavigateClickEvent);
    on<HomeCartButtonNavigateClickEvent>(homeCartButtonNavigateClickEvent);
  }

  FutureOr<void> homeInitialFetchEvent(
      HomeInitialFetchEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState()); //first state
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryList
            .map((e) => ProductDataModel(     
                id: e['id'],
                name: e['name'],
                description: e['description'],
                quantity: e['quantity'],
                price: e['price'],
                imgUrl: e['imageUrl']))
            .toList()));

    //took list of maps and for every map converted into product data model
  }

  FutureOr<void> homeProdutWishlistButtonClickedEvent(
      HomeProdutWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist Product Clicked'); //not from appbar
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemsWishlistedActionState());
  }

  FutureOr<void> homeProdutCartButtonClickedEvent(
      HomeProdutCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Shopping Cart Product Clicked');
    cartItems.add(event.clickedProduct); //not from appBar
    emit(HomeProductItemsAddedToCartActionState());
  }

  FutureOr<void> homeWishListButtonNavigateClickEvent(
      HomeWishListButtonNavigateClickEvent event, Emitter<HomeState> emit) {
    print('wishlist navigator event called');

    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateClickEvent(
      HomeCartButtonNavigateClickEvent event, Emitter<HomeState> emit) {
    print('cart navigator event called');
    emit(HomeNavigateToCartPageActionState());
  }
}
