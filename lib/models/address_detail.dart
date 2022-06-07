class Province {
  String id;
  late String name;
  Province({required this.id, required this.name});
}

class District {
  String id;
  late String name;
  String idParent;
  District({required this.id, required this.name, required this.idParent});
}

class Ward {
  String id;
  late String name;
  String idParent;
  Ward({
    required this.id,
    required this.name,
    required this.idParent,
  });
}
