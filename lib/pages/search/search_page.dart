import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchPage extends StatelessWidget {
  TextEditingController shoeName = TextEditingController();
  final listSelect = [
    'Nike',
    'Jordan',
    'Adidas',
    'Converse',
    'Vans',
  ];

  SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Search",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: shoeName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                        bottom: 7,
                        left: 15,
                      ),
                      hintText: 'Enter shoe name',
                      hintStyle: TextStyle(
                        color: Color(0xffD0D0D0),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownSearch<String>(
                    showClearButton: true,
                    clearButton: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 15,
                    ),
                    dropDownButton: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 25,
                    ),
                    popupShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    showSearchBox: true,
                    mode: Mode.BOTTOM_SHEET,
                    items: listSelect,
                    popupItemBuilder: (context, item, isSelected) => Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    itemAsString: (item) {
                      return item ?? 'Select brand';
                    },
                    dropdownBuilder: (context, item) {
                      return Text(
                        item ?? 'Select brand',
                        style: TextStyle(
                          color: item == null
                              ? const Color(0xffD0D0D0)
                              : Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                    onSaved: (item) {},
                    onChanged: (item) {},
                    dropdownSearchDecoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15),
                      isDense: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xffD0D0D0),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              'Clear',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.sort,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Sort',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.58,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) => Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 36,
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 41,
                                    height: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/icons/icon-like.png",
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Image.asset(
                                    "assets/images/product_home.png",
                                    width: 80,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 36,
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    width: 41,
                                    height: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/icons/icon-cart.png",
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Jordan 1',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: '250',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: RatingBarIndicator(
                              rating: 5,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 20,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
