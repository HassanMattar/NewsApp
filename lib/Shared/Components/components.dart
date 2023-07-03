import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';


import '../../Modules/webView.dart';

Widget NewsItem(@required artical, context) {
  var img = artical['urlToImage'];
  return InkWell(
       onTap: () {
          
     GoTo(context,WebViews(artical['url']));
        },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.hardEdge,
          child: img == null
              ? Container()
              : Image(
                  fit: BoxFit.cover,
                  image: NetworkImage("${artical['urlToImage']}")),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: Text('${artical['title']}',
                          textDirection: TextDirection.rtl,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyText1)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${artical['publishedAt']}',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget MyInputTFF({
  TextEditingController? controller,
  Icon? preIcon,
  ValueChanged<String>? onChange,
  ValueChanged<String>? onSubmit,
  FormFieldValidator<String>? validat,
  required String lable,
}) {
  return TextFormField(
    controller: controller,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    validator: validat,
    style: TextStyle(fontSize: 20),
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 13),
      label: Text(lable),
      prefixIcon: preIcon,
    ),
  );
}

void GoTo(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Widget NewsBuilder(List list, {bool isSearch = false}) {
  return ConditionalBuilder(
    condition: list.length > 0 && !isSearch,
    builder: (context) => Padding(
      padding: const EdgeInsets.only(top: 10, left: 7, right: 7),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        itemBuilder: (context, index) => NewsItem(list[index], context),
        itemCount: list.length,
      ),
    ),
    fallback: (context) => Center(child: CircularProgressIndicator()),
  );
}
