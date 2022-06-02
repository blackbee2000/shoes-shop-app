part of 'otp.dart';

Otp _$OtpFromJson(Map<String, dynamic> json) {
  return Otp(
    json['body'] as String?,
    json['numSegments'] as String?,
    json['direction'] as String?,
    json['from'] as String?,
    json['to'] as String?,
    json['dateUpdated'] as String?,
    json['price'] as dynamic,
    json['errorMessage'] as dynamic,
    json['uri'] as String?,
    json['accountSid'] as String?,
    json['numMedia'] as String?,
    json['status'] as String?,
    json['messagingServiceSid'] as dynamic,
    json['sid'] as String?,
    json['dateSent'] as dynamic,
    json['dateCreated'] as String?,
    json['errorCode'] as dynamic,
    json['priceUnit'] as String?,
    json['apiVersion'] as String?,
    json['subresourceUris'] as dynamic,
  );
}

Map<String, dynamic> _$OtpToJson(Otp instance) => <String, dynamic>{
      'body': instance.body,
      'numSegments': instance.numSegments,
      'direction': instance.direction,
      'from': instance.from,
      'to': instance.to,
      'dateUpdated': instance.dateUpdated,
      'price': instance.price,
      'errorMessage': instance.errorMessage,
      'uri': instance.uri,
      'accountSid': instance.accountSid,
      'numMedia': instance.numMedia,
      'status': instance.status,
      'messagingServiceSid': instance.messagingServiceSid,
      'sid': instance.sid,
      'dateSent': instance.dateSent,
      'dateCreated': instance.dateCreated,
      'errorCode': instance.errorCode,
      'priceUnit': instance.priceUnit,
      'apiVersion': instance.apiVersion,
      'subresourceUris': instance.subresourceUris,
    };
