import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:grin/generated/l10n.dart';

abstract class LocalizedMessage {
  String getLocalizedMessage(BuildContext context);
}

abstract class Failure extends Equatable implements LocalizedMessage {
  const Failure();

  @override
  List<Object> get props => [];
}

class EmptyFailure extends Failure {
  const EmptyFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) => '';
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(this.statusCode) : super();

  @override
  List<Object> get props => [statusCode ?? 0];

  @override
  String getLocalizedMessage(BuildContext context) =>
      '${S.current.strServerError} $statusCode';
}

class ConnectionFailure extends Failure {
  const ConnectionFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) =>
      S.current.strCheckInternetConnection;
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) =>
      S.current.strUnknownFailure;
}

class GeneralFailure extends Failure {
  const GeneralFailure(this.error) : super();
  final String error;

  @override
  String getLocalizedMessage(BuildContext context) => error;
}

class UnAuthorizationFailure extends Failure {
  const UnAuthorizationFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) =>
      S.current.strUnAuthorizationFailure;
}

class EmailPasswordWrongFailure extends Failure {
  const EmailPasswordWrongFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) =>
      S.current.strEmailOrPasswordWrong;
}

class UserNotFound extends Failure {
  const UserNotFound() : super();

  @override
  String getLocalizedMessage(BuildContext context) => S.current.strUserNotfound;
}

class WrongCodeFailure extends Failure {
  const WrongCodeFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) => S.current.strWrongCode;
}

class CacheFailure extends Failure {
  const CacheFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) => S.current.strCachFailure;
}

class EnterValidPhoneFailure extends Failure {
  const EnterValidPhoneFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) =>
      S.current.strEnterValidPhone;
}

class AlreadyInUseFailure extends Failure {
  const AlreadyInUseFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) => S.current.strAlreadyInUse;
}

class UserDeactivedFailure extends Failure {
  const UserDeactivedFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) =>
      S.current.strUserDeactived;
}

class HaveNotPurchasedFailure extends Failure {
  const HaveNotPurchasedFailure() : super();

  @override
  String getLocalizedMessage(BuildContext context) =>
      S.current.strHaveNotPurchased;
}
