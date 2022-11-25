import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EstimateResult extends StatefulWidget {
  EstimateResult(this.estimates, {super.key});
  var estimates;

  @override
  State<EstimateResult> createState() => _EstimateResultState();
}

class _EstimateResultState extends State<EstimateResult> {
  var estimates;

  @override
  void initState() {
    estimates = widget.estimates;
    print(estimates);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('名前')),
        DataColumn(label: Text('年齢')),
        DataColumn(
          label: Text('性別'),
        ),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('太朗')),
          DataCell(Text('19')),
          DataCell(Text('男'))
        ]),
        DataRow(cells: [
          DataCell(Text('太朗')),
          estimates != null ? DataCell(Text(estimates)) : DataCell(Text('id')),
          DataCell(Text('男'))
        ]),
      ],
    );
  }
}
