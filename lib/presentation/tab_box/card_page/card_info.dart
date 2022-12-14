import 'package:edevice/view_model/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key}) : super(key: key);

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
            if (orderViewModel.orderModelForInfo != null) {
              var order = orderViewModel.orderModelForInfo!;
              return Column(
                children: [
                  Text(order.orderStatus),
                  Text(order.createdAt),
                  Text(order.count.toString()),
                  Text(order.totalPrice.toString()),
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