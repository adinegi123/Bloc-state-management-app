import 'package:bloc_state_management_youtube/features/home/bloc/home_bloc.dart';
import 'package:bloc_state_management_youtube/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc; //every product will get a product data model
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imgUrl))),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          productDataModel.name,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Text(
          productDataModel.description,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${productDataModel.price.toString()}',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProdutWishlistButtonClickedEvent(
                        clickedProduct: productDataModel));
                  },
                  icon: const Icon(Icons.favorite_outline_rounded),
                ),
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProdutCartButtonClickedEvent(
                        clickedProduct: productDataModel));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}
