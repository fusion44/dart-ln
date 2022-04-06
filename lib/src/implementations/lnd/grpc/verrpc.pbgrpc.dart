///
//  Generated code. Do not modify.
//  source: verrpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'verrpc.pb.dart' as $6;
export 'verrpc.pb.dart';

class VersionerClient extends $grpc.Client {
  static final _$getVersion = $grpc.ClientMethod<$6.VersionRequest, $6.Version>(
      '/verrpc.Versioner/GetVersion',
      ($6.VersionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.Version.fromBuffer(value));

  VersionerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$6.Version> getVersion($6.VersionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getVersion, request, options: options);
  }
}

abstract class VersionerServiceBase extends $grpc.Service {
  $core.String get $name => 'verrpc.Versioner';

  VersionerServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.VersionRequest, $6.Version>(
        'GetVersion',
        getVersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.VersionRequest.fromBuffer(value),
        ($6.Version value) => value.writeToBuffer()));
  }

  $async.Future<$6.Version> getVersion_Pre(
      $grpc.ServiceCall call, $async.Future<$6.VersionRequest> request) async {
    return getVersion(call, await request);
  }

  $async.Future<$6.Version> getVersion(
      $grpc.ServiceCall call, $6.VersionRequest request);
}
