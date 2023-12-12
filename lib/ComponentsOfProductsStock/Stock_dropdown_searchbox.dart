import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:shop/ComponentsOfProductsStock/user_model.dart';

class Add_stocks_dropdown_searchbox extends StatelessWidget {
  const Add_stocks_dropdown_searchbox(
      BuildContext context, TextEditingController stockQuantitycontroller,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          children: [
            Expanded(
              child: DropdownSearch<UserModel>(
                dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                  fillColor: Colors.white, filled: true,
                  hintText: "Select Product",
                  // icon: Icon(Icons.add_shopping_cart),
                )),
                asyncItems: (filter) => getData(filter),
                compareFn: (i, s) => i.isEqual(s),
                popupProps: PopupPropsMultiSelection.modalBottomSheet(
                  isFilterOnline: true,
                  showSelectedItems: true,
                  showSearchBox: true,
                  itemBuilder: _customPopupItemBuilderExample2,
                  favoriteItemProps: FavoriteItemProps(
                    showFavoriteItems: true,
                    favoriteItems: (us) {
                      return us.where((e) => e.name.contains("Mrs")).toList();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, UserModel item, bool isSelected) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name),
        subtitle: Text(item.createdAt.toString()),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.avatar),
        ),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://63c1210999c0a15d28e1ec1d.mockapi.io/users",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
}
