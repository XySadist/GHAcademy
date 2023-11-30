import 'package:flutter/material.dart';

class fromName extends StatelessWidget {
  const fromName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Name",
              labelText: "Name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return "Nama Harus Terisi!";
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Email",
              labelText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return "Email Harus Terisi!";
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            autofocus: false,
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Message",
              labelText: "Message",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return "Email Harus Terisi!";
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff03AEC6)),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Color(0xff01294D), width: 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.only(top: 8, right: 22, bottom: 8, left: 22)),
                  elevation: MaterialStateProperty.all<double>(5)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Vollkorn',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}