part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialFetchEvent extends HomeEvent {}

class HomeProdutWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;//passing data through events

  HomeProdutWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProdutCartButtonClickedEvent extends HomeEvent {

  final ProductDataModel clickedProduct;

  HomeProdutCartButtonClickedEvent({required this.clickedProduct});//passing data through events
}

class HomeWishListButtonNavigateClickEvent extends HomeEvent {}

class HomeCartButtonNavigateClickEvent extends HomeEvent {}
