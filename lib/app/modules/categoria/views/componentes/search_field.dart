import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchField extends StatefulWidget {
  final void Function(String search) onSearch;
  const SearchField({Key? key, required this.onSearch}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _formKey = GlobalKey<FormState>();
  var _autoValidate = false;
  var _search;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        //autovalidate: _autoValidate,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.green,
                focusColor: Colors.green,
              ),
              child: TextFormField(
                textInputAction: TextInputAction.search,
                onTap: () {
                  print("search");
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: "Buscar",
                  border: OutlineInputBorder(),
                  filled: true,
                  errorStyle: TextStyle(
                    fontSize: 11.sp,
                  ),
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                ),
                onChanged: (value) {
                  _search = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter search term";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            /*SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    widget.onSearch(_search);
                    // Collapses keypad
                    FocusManager.instance.primaryFocus!.unfocus();
                  } else {
                    setState(() {
                      _autoValidate = true;
                    });
                  }
                },
                fillColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Buscar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
