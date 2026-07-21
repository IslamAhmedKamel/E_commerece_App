class AddProductToFavoritModel {
  String? status;
  String? message;
  List<String>? data;

  AddProductToFavoritModel({this.status, this.message, this.data});

  AddProductToFavoritModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'].cast<String>();
  }
}
