import 'package:json_annotation/json_annotation.dart';
part 'otp.g.dart';

@JsonSerializable()
class Otp {
  String? body;
  String? numSegments;
  String? direction;
  String? from;
  String? to;
  String? dateUpdated;
  dynamic price;
  dynamic errorMessage;
  String? uri;
  String? accountSid;
  String? numMedia;
  String? status;
  dynamic messagingServiceSid;
  String? sid;
  dynamic dateSent;
  String? dateCreated;
  dynamic errorCode;
  String? priceUnit;
  String? apiVersion;
  dynamic subresourceUris;

  Otp(
    this.body,
    this.numSegments,
    this.direction,
    this.from,
    this.to,
    this.dateUpdated,
    this.price,
    this.errorMessage,
    this.uri,
    this.accountSid,
    this.numMedia,
    this.status,
    this.messagingServiceSid,
    this.sid,
    this.dateSent,
    this.dateCreated,
    this.errorCode,
    this.priceUnit,
    this.apiVersion,
    this.subresourceUris,
  );

  factory Otp.fromJson(Map<String, dynamic> json) => _$OtpFromJson(json);

  Map<String, dynamic> toJson() => _$OtpToJson(this);
}
