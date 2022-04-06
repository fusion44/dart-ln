///
//  Generated code. Do not modify.
//  source: dev.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'lightning.pb.dart' as $0;
import 'dev.pb.dart' as $9;
export 'dev.pb.dart';

class DevClient extends $grpc.Client {
  static final _$importGraph =
      $grpc.ClientMethod<$0.ChannelGraph, $9.ImportGraphResponse>(
          '/devrpc.Dev/ImportGraph',
          ($0.ChannelGraph value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $9.ImportGraphResponse.fromBuffer(value));

  DevClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$9.ImportGraphResponse> importGraph(
      $0.ChannelGraph request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$importGraph, request, options: options);
  }
}

abstract class DevServiceBase extends $grpc.Service {
  $core.String get $name => 'devrpc.Dev';

  DevServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChannelGraph, $9.ImportGraphResponse>(
        'ImportGraph',
        importGraph_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChannelGraph.fromBuffer(value),
        ($9.ImportGraphResponse value) => value.writeToBuffer()));
  }

  $async.Future<$9.ImportGraphResponse> importGraph_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ChannelGraph> request) async {
    return importGraph(call, await request);
  }

  $async.Future<$9.ImportGraphResponse> importGraph(
      $grpc.ServiceCall call, $0.ChannelGraph request);
}
