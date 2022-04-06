///
//  Generated code. Do not modify.
//  source: autopilot.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'autopilot.pb.dart' as $10;
export 'autopilot.pb.dart';

class AutopilotClient extends $grpc.Client {
  static final _$status =
      $grpc.ClientMethod<$10.StatusRequest, $10.StatusResponse>(
          '/autopilotrpc.Autopilot/Status',
          ($10.StatusRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $10.StatusResponse.fromBuffer(value));
  static final _$modifyStatus =
      $grpc.ClientMethod<$10.ModifyStatusRequest, $10.ModifyStatusResponse>(
          '/autopilotrpc.Autopilot/ModifyStatus',
          ($10.ModifyStatusRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $10.ModifyStatusResponse.fromBuffer(value));
  static final _$queryScores =
      $grpc.ClientMethod<$10.QueryScoresRequest, $10.QueryScoresResponse>(
          '/autopilotrpc.Autopilot/QueryScores',
          ($10.QueryScoresRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $10.QueryScoresResponse.fromBuffer(value));
  static final _$setScores =
      $grpc.ClientMethod<$10.SetScoresRequest, $10.SetScoresResponse>(
          '/autopilotrpc.Autopilot/SetScores',
          ($10.SetScoresRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $10.SetScoresResponse.fromBuffer(value));

  AutopilotClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$10.StatusResponse> status($10.StatusRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$status, request, options: options);
  }

  $grpc.ResponseFuture<$10.ModifyStatusResponse> modifyStatus(
      $10.ModifyStatusRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$modifyStatus, request, options: options);
  }

  $grpc.ResponseFuture<$10.QueryScoresResponse> queryScores(
      $10.QueryScoresRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$queryScores, request, options: options);
  }

  $grpc.ResponseFuture<$10.SetScoresResponse> setScores(
      $10.SetScoresRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setScores, request, options: options);
  }
}

abstract class AutopilotServiceBase extends $grpc.Service {
  $core.String get $name => 'autopilotrpc.Autopilot';

  AutopilotServiceBase() {
    $addMethod($grpc.ServiceMethod<$10.StatusRequest, $10.StatusResponse>(
        'Status',
        status_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.StatusRequest.fromBuffer(value),
        ($10.StatusResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$10.ModifyStatusRequest, $10.ModifyStatusResponse>(
            'ModifyStatus',
            modifyStatus_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $10.ModifyStatusRequest.fromBuffer(value),
            ($10.ModifyStatusResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$10.QueryScoresRequest, $10.QueryScoresResponse>(
            'QueryScores',
            queryScores_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $10.QueryScoresRequest.fromBuffer(value),
            ($10.QueryScoresResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.SetScoresRequest, $10.SetScoresResponse>(
        'SetScores',
        setScores_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.SetScoresRequest.fromBuffer(value),
        ($10.SetScoresResponse value) => value.writeToBuffer()));
  }

  $async.Future<$10.StatusResponse> status_Pre(
      $grpc.ServiceCall call, $async.Future<$10.StatusRequest> request) async {
    return status(call, await request);
  }

  $async.Future<$10.ModifyStatusResponse> modifyStatus_Pre(
      $grpc.ServiceCall call,
      $async.Future<$10.ModifyStatusRequest> request) async {
    return modifyStatus(call, await request);
  }

  $async.Future<$10.QueryScoresResponse> queryScores_Pre($grpc.ServiceCall call,
      $async.Future<$10.QueryScoresRequest> request) async {
    return queryScores(call, await request);
  }

  $async.Future<$10.SetScoresResponse> setScores_Pre($grpc.ServiceCall call,
      $async.Future<$10.SetScoresRequest> request) async {
    return setScores(call, await request);
  }

  $async.Future<$10.StatusResponse> status(
      $grpc.ServiceCall call, $10.StatusRequest request);
  $async.Future<$10.ModifyStatusResponse> modifyStatus(
      $grpc.ServiceCall call, $10.ModifyStatusRequest request);
  $async.Future<$10.QueryScoresResponse> queryScores(
      $grpc.ServiceCall call, $10.QueryScoresRequest request);
  $async.Future<$10.SetScoresResponse> setScores(
      $grpc.ServiceCall call, $10.SetScoresRequest request);
}
