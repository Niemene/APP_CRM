import 'package:flutter/material.dart';

import '../model/models.dart';
import '../screen/contractDetailPage.dart';

class ContractCard extends StatelessWidget {
  final List<Contract> contracts;
  ContractCard({Key? key, required this.contracts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       return ListView.builder(
          shrinkWrap: true,
          itemCount: contracts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => _onCardTapped(context, index),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ExpansionTile(
                  title: Text(contracts[index].name),
                ),
              ),
            );
          },
        );
  }

  void _onCardTapped(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContractDetailPage(contract: contracts[index]),
      ),
    );
  }
}
