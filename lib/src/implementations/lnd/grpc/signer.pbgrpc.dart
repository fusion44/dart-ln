///
//  Generated code. Do not modify.
//  source: signer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'signer.pb.dart' as $2;
export 'signer.pb.dart';

class SignerClient extends $grpc.Client {
  static final _$signOutputRaw = $grpc.ClientMethod<$2.SignReq, $2.SignResp>(
      '/signrpc.Signer/SignOutputRaw',
      ($2.SignReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.SignResp.fromBuffer(value));
  static final _$computeInputScript =
      $grpc.ClientMethod<$2.SignReq, $2.InputScriptResp>(
          '/signrpc.Signer/ComputeInputScript',
          ($2.SignReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.InputScriptResp.fromBuffer(value));
  static final _$signMessage =
      $grpc.ClientMethod<$2.SignMessageReq, $2.SignMessageResp>(
          '/signrpc.Signer/SignMessage',
          ($2.SignMessageReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.SignMessageResp.fromBuffer(value));
  static final _$verifyMessage =
      $grpc.ClientMethod<$2.VerifyMessageReq, $2.VerifyMessageResp>(
          '/signrpc.Signer/VerifyMessage',
          ($2.VerifyMessageReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.VerifyMessageResp.fromBuffer(value));
  static final _$deriveSharedKey =
      $grpc.ClientMethod<$2.SharedKeyRequest, $2.SharedKeyResponse>(
          '/signrpc.Signer/DeriveSharedKey',
          ($2.SharedKeyRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.SharedKeyResponse.fromBuffer(value));

  SignerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.SignResp> signOutputRaw($2.SignReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signOutputRaw, request, options: options);
  }

  $grpc.ResponseFuture<$2.InputScriptResp> computeInputScript(
      $2.SignReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$computeInputScript, request, options: options);
  }

  $grpc.ResponseFuture<$2.SignMessageResp> signMessage(
      $2.SignMessageReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signMessage, request, options: options);
  }

  $grpc.ResponseFuture<$2.VerifyMessageResp> verifyMessage(
      $2.VerifyMessageReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyMessage, request, options: options);
  }

  $grpc.ResponseFuture<$2.SharedKeyResponse> deriveSharedKey(
      $2.SharedKeyRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deriveSharedKey, request, options: options);
  }
}

abstract class SignerServiceBase extends $grpc.Service {
  $core.String get $name => 'signrpc.Signer';

  SignerServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.SignReq, $2.SignResp>(
        'SignOutputRaw',
        signOutputRaw_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SignReq.fromBuffer(value),
        ($2.SignResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SignReq, $2.InputScriptResp>(
        'ComputeInputScript',
        computeInputScript_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SignReq.fromBuffer(value),
        ($2.InputScriptResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SignMessageReq, $2.SignMessageResp>(
        'SignMessage',
        signMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SignMessageReq.fromBuffer(value),
        ($2.SignMessageResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.VerifyMessageReq, $2.VerifyMessageResp>(
        'VerifyMessage',
        verifyMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.VerifyMessageReq.fromBuffer(value),
        ($2.VerifyMessageResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SharedKeyRequest, $2.SharedKeyResponse>(
        'DeriveSharedKey',
        deriveSharedKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SharedKeyRequest.fromBuffer(value),
        ($2.SharedKeyResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.SignResp> signOutputRaw_Pre(
      $grpc.ServiceCall call, $async.Future<$2.SignReq> request) async {
    return signOutputRaw(call, await request);
  }

  $async.Future<$2.InputScriptResp> computeInputScript_Pre(
      $grpc.ServiceCall call, $async.Future<$2.SignReq> request) async {
    return computeInputScript(call, await request);
  }

  $async.Future<$2.SignMessageResp> signMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$2.SignMessageReq> request) async {
    return signMessage(call, await request);
  }

  $async.Future<$2.VerifyMessageResp> verifyMessage_Pre($grpc.ServiceCall call,
      $async.Future<$2.VerifyMessageReq> request) async {
    return verifyMessage(call, await request);
  }

  $async.Future<$2.SharedKeyResponse> deriveSharedKey_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.SharedKeyRequest> request) async {
    return deriveSharedKey(call, await request);
  }

  $async.Future<$2.SignResp> signOutputRaw(
      $grpc.ServiceCall call, $2.SignReq request);
  $async.Future<$2.InputScriptResp> computeInputScript(
      $grpc.ServiceCall call, $2.SignReq request);
  $async.Future<$2.SignMessageResp> signMessage(
      $grpc.ServiceCall call, $2.SignMessageReq request);
  $async.Future<$2.VerifyMessageResp> verifyMessage(
      $grpc.ServiceCall call, $2.VerifyMessageReq request);
  $async.Future<$2.SharedKeyResponse> deriveSharedKey(
      $grpc.ServiceCall call, $2.SharedKeyRequest request);
}
