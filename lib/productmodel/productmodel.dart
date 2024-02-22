import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'productmodel.g.dart';

@JsonSerializable()
class Productmodel {
	List<Product>? products;
	int? total;
	int? skip;
	int? limit;

	Productmodel({this.products, this.total, this.skip, this.limit});

	factory Productmodel.fromJson(Map<String, dynamic> json) {
		return _$ProductmodelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ProductmodelToJson(this);
}
