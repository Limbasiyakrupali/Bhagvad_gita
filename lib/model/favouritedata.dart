class Favouritedata {
  static Set<Map<String, dynamic>> favouritedata = {};
  static List<Map<String, dynamic>> favouriteproductdata = [];

  static void convertuniquedata() {
    favouriteproductdata = favouritedata.toList();
  }
}
