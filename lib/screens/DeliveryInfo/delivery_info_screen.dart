import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/controllers/delivery_info_controller.dart';
import 'package:sp_shop_app/screens/DeliveryInfo/components/card_item.dart';
import 'package:sp_shop_app/utils/constants.dart';

class DeliveryInfoScreen extends StatefulWidget {
  const DeliveryInfoScreen({Key? key}) : super(key: key);

  @override
  _DeliveryInfoScreenState createState() => _DeliveryInfoScreenState();
}

class _DeliveryInfoScreenState extends State<DeliveryInfoScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final DeliveryInfoController _deliveryInfoController =
      Get.put(DeliveryInfoController());
  late ListModel<dynamic> _list;
  Object? _selectedItem;
  late Object _nextItem;
  @override
  void initState() {
    super.initState();
    var deliveryList = _deliveryInfoController.deliveryInfo;
    _list = ListModel<dynamic>(
      listKey: _listKey,
      initialItems: deliveryList,
      removedItemBuilder: _buildRemovedItem,
    );
    // _nextItem = 2;
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
        backgroundColor: kPrimaryColor,
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
