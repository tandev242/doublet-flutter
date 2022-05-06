import 'package:flutter/material.dart';
import 'package:sp_shop_app/apis/delivery_api.dart';
import 'package:sp_shop_app/entities/delivery.dart';
import 'package:sp_shop_app/screens/Address/components/card_item.dart';
import 'package:sp_shop_app/utils/constants.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel<dynamic> _list;
  Object? _selectedItem;
  late Object _nextItem;
  @override
  void initState() {
    super.initState();
    var deliveryList = getListAddressFuture();
    print('Delivery on Screen: $deliveryList');
    _list = ListModel<dynamic>(
      listKey: _listKey,
      initialItems: <dynamic>[],
      removedItemBuilder: _buildRemovedItem,
    );
    // _nextItem = 2;
  }

  getListAddressFuture() async {
    var res = await DeliveryApi.getListDelivery();
    if (res != null) {
      var deliveryInfo = res['deliveryInfo'];
      var deliveryList = deliveryInfo['address'];
      return deliveryList;
    }
    return <dynamic>[];
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(
      dynamic item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  // Insert the "next item" into the list model.
  void _insert() {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem!);
    _list.insert(index, _nextItem);
  }

  // Remove the selected item from the list model.
  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem!));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedList'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: _insert,
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle),
            onPressed: _remove,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _list.length,
          itemBuilder: _buildItem,
        ),
      ),
    );
  }
}
