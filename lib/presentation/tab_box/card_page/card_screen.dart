import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/orders_view_model.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Card Page",style: TextStyle(color: Colors.black,fontSize: 24),),
      ),
      body: Consumer<OrderViewModel>(
        builder: (context, orderViewModel, child) {
          return ListView(
            children:
            List.generate(orderViewModel.userOrders.length, (index) {
              var userOrder = orderViewModel.userOrders[index];
              return ListTile(
                title: Text(userOrder.productName),
                trailing: Text("Count : ${userOrder.count }"),
              );
            }),
          );
        },
      ),
    );
  }
}
