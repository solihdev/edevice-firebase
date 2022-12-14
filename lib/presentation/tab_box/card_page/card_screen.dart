import 'package:edevice/data/models/order_model.dart';
import 'package:edevice/presentation/tab_box/card_page/card_info.dart';
import 'package:edevice/view_model/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Card Screen",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: Consumer<OrdersViewModel>(
        builder: (context, orderViewModel, child) {
          return ListView(
            children: List.generate(orderViewModel.userOrders.length, (index) {
              var order = orderViewModel.userOrders[index];
              return ListTile(
                title: Text(order.productName,style: const TextStyle(color: Colors.black),),
                onTap: () {
                  orderViewModel.getSingleProduct(order.orderId);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) =>  CardInfo(orderModel: order,)));
                },
                trailing: Text("Count:${order.count}"),
              );
            }),
          );
        },
      ),
    );
  }
}