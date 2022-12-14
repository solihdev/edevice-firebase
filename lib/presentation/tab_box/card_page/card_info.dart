import 'package:edevice/data/models/order_model.dart';
import 'package:edevice/view_model/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key, required this.orderModel}) : super(key: key);

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Card Info",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        body: Consumer<OrdersViewModel>(
          builder: (context, orderViewModel, child) {
            if (orderViewModel.productModel != null) {
              var product = orderViewModel.productModel!;
              return Column(
                children: [
                  Text(orderModel.orderStatus),
                  Text(orderModel.createdAt),
                  Text(orderModel.count.toString()),
                  Text(orderModel.totalPrice.toString()),
                  Text(product.productName),
                  Text(product.price.toString()),
                  Image.network(product.productImages[0]),
                  Text(product.description),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
