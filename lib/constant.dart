import 'package:flutter/material.dart';

const baseURL = "http://127.0.0.1:8000/api";
const loginURL = "$baseURL/login";
const registerURL = "$baseURL/register";
const logoutURL = "$baseURL/logout";
const userURL = "$baseURL/user";
const productsURL = "$baseURL/products";
const suppliersURL = "$baseURL/suppliers";
const categoriesURL = "$baseURL/categories";
const categoriesProdURL = "$categoriesURL/products";
const clientsURL = "$baseURL/clients";
const dailyDataURL = "$baseURL/daily_data";
const salesURL = "$baseURL/sales";
const mainURL = "$baseURL/main";
const vendreURL = "$productsURL/vendre";
const suppliersProdURL = "$suppliersURL/products";
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again';

// --- input decoration

InputDecoration kInputDecoration(String label) {
  return InputDecoration(
      labelText: label,
      contentPadding: const EdgeInsets.all(10),
      border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black)));
}

//button
TextButton KTextButton(String label, Function onPressed) {
  return TextButton(
    style: ButtonStyle(
        backgroundColor:
        WidgetStateColor.resolveWith((states) => Colors.blue),
        padding: WidgetStateProperty.resolveWith(
                (states) => const EdgeInsets.symmetric(vertical: 10))),
    onPressed: () => onPressed(),
    child: Text(label, style: const TextStyle(color: Colors.white)),
  );
}

//loginregister hint
Row kLoginRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
        child: Text(
          label,
          style: const TextStyle(color: Colors.blue),
        ),
        onTap: () => onTap(),
      )
    ],
  );
}