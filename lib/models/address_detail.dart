class Province {
  final String id;
  final String name;
  Province({required this.id, required this.name});
}

class District {
  final String id;
  final String name;
  final String idParent;
  District({required this.id, required this.name, required this.idParent});
}

class Ward {
  final String id;
  final String name;
  final String idParent;
  Ward({
    required this.id,
    required this.name,
    required this.idParent,
  });
}
