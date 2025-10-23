part of '../../home.dart';

class ProductModel {
  final String id;
  final String image;
  final String name;
  final bool hasOffer;
  final bool isFav;
  final double priceAfter;
  final double priceBefore;
  final String description;

  const ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.hasOffer,
    required this.isFav,
    required this.priceAfter,
    required this.priceBefore,
    required this.description,
  });

  ProductModel copyWith({
    String? id,
    String? image,
    String? name,
    bool? hasOffer,
    bool? isFav,
    double? priceAfter,
    double? priceBefore,
    String? description,
  }) {
    return ProductModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      hasOffer: hasOffer ?? this.hasOffer,
      isFav: isFav ?? this.isFav,
      priceAfter: priceAfter ?? this.priceAfter,
      priceBefore: priceBefore ?? this.priceBefore,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'hasOffer': hasOffer,
      'isFav': isFav,
      'priceAfter': priceAfter,
      'priceBefore': priceBefore,
      'description': description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      hasOffer: map['hasOffer'] ?? false,
      isFav: map['isFav'] ?? false,
      priceAfter: (map['priceAfter'] ?? 0).toDouble(),
      priceBefore: (map['priceBefore'] ?? 0).toDouble(),
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, priceAfter: $priceAfter, priceBefore: $priceBefore, hasOffer: $hasOffer, isFav: $isFav, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.image == image &&
        other.name == name &&
        other.hasOffer == hasOffer &&
        other.isFav == isFav &&
        other.priceAfter == priceAfter &&
        other.priceBefore == priceBefore &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        name.hashCode ^
        hasOffer.hashCode ^
        isFav.hashCode ^
        priceAfter.hashCode ^
        priceBefore.hashCode ^
        description.hashCode;
  }
}
