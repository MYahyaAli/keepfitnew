class WeightModel {
  String? weight;
  String? height;
  String? noOfCups;

  WeightModel({this.weight, this.height, this.noOfCups});

  //recieve data from server
  factory WeightModel.fromMap(map) {
    return WeightModel(
      weight: map['weight'],
      height: map['height'],
      noOfCups: map['noOfCups'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'height': height,
      'noOfCups': noOfCups,
    };
  }
}
