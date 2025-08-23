import 'package:json_annotation/json_annotation.dart';


part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final int id;
  final String? note;
  final int rate;
  final String doctorId;
  final String doctorName;
  final String assistantId;


  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isLatest;

  ReviewModel({
    required this.id,
    this.note,
    required this.rate,
    required this.doctorId,
    required this.doctorName,
    required this.assistantId,
    this.isLatest = false,
  });


  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);


  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
