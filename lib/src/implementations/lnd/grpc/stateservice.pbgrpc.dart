///
//  Generated code. Do not modify.
//  source: stateservice.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'stateservice.pb.dart' as $7;
export 'stateservice.pb.dart';

class StateClient extends $grpc.Client {
  static final _$subscribeState =
      $grpc.ClientMethod<$7.SubscribeStateRequest, $7.SubscribeStateResponse>(
          '/lnrpc.State/SubscribeState',
          ($7.SubscribeStateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.SubscribeStateResponse.fromBuffer(value));
  static final _$getState =
      $grpc.ClientMethod<$7.GetStateRequest, $7.GetStateResponse>(
          '/lnrpc.State/GetState',
          ($7.GetStateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.GetStateResponse.fromBuffer(value));

  StateClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$7.SubscribeStateResponse> subscribeState(
      $7.SubscribeStateRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$subscribeState, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$7.GetStateResponse> getState($7.GetStateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getState, request, options: options);
  }
}

abstract class StateServiceBase extends $grpc.Service {
  $core.String get $name => 'lnrpc.State';

  StateServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.SubscribeStateRequest,
            $7.SubscribeStateResponse>(
        'SubscribeState',
        subscribeState_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $7.SubscribeStateRequest.fromBuffer(value),
        ($7.SubscribeStateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.GetStateRequest, $7.GetStateResponse>(
        'GetState',
        getState_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.GetStateRequest.fromBuffer(value),
        ($7.GetStateResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$7.SubscribeStateResponse> subscribeState_Pre(
      $grpc.ServiceCall call,
      $async.Future<$7.SubscribeStateRequest> request) async* {
    yield* subscribeState(call, await request);
  }

  $async.Future<$7.GetStateResponse> getState_Pre(
      $grpc.ServiceCall call, $async.Future<$7.GetStateRequest> request) async {
    return getState(call, await request);
  }

  $async.Stream<$7.SubscribeStateResponse> subscribeState(
      $grpc.ServiceCall call, $7.SubscribeStateRequest request);
  $async.Future<$7.GetStateResponse> getState(
      $grpc.ServiceCall call, $7.GetStateRequest request);
}
