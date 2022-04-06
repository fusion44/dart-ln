///
//  Generated code. Do not modify.
//  source: wtclient.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'wtclient.pb.dart' as $5;
export 'wtclient.pb.dart';

class WatchtowerClient extends $grpc.Client {
  static final _$addTower =
      $grpc.ClientMethod<$5.AddTowerRequest, $5.AddTowerResponse>(
          '/wtclientrpc.WatchtowerClient/AddTower',
          ($5.AddTowerRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.AddTowerResponse.fromBuffer(value));
  static final _$removeTower =
      $grpc.ClientMethod<$5.RemoveTowerRequest, $5.RemoveTowerResponse>(
          '/wtclientrpc.WatchtowerClient/RemoveTower',
          ($5.RemoveTowerRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.RemoveTowerResponse.fromBuffer(value));
  static final _$listTowers =
      $grpc.ClientMethod<$5.ListTowersRequest, $5.ListTowersResponse>(
          '/wtclientrpc.WatchtowerClient/ListTowers',
          ($5.ListTowersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.ListTowersResponse.fromBuffer(value));
  static final _$getTowerInfo =
      $grpc.ClientMethod<$5.GetTowerInfoRequest, $5.Tower>(
          '/wtclientrpc.WatchtowerClient/GetTowerInfo',
          ($5.GetTowerInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $5.Tower.fromBuffer(value));
  static final _$stats = $grpc.ClientMethod<$5.StatsRequest, $5.StatsResponse>(
      '/wtclientrpc.WatchtowerClient/Stats',
      ($5.StatsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.StatsResponse.fromBuffer(value));
  static final _$policy =
      $grpc.ClientMethod<$5.PolicyRequest, $5.PolicyResponse>(
          '/wtclientrpc.WatchtowerClient/Policy',
          ($5.PolicyRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $5.PolicyResponse.fromBuffer(value));

  WatchtowerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$5.AddTowerResponse> addTower($5.AddTowerRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTower, request, options: options);
  }

  $grpc.ResponseFuture<$5.RemoveTowerResponse> removeTower(
      $5.RemoveTowerRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTower, request, options: options);
  }

  $grpc.ResponseFuture<$5.ListTowersResponse> listTowers(
      $5.ListTowersRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listTowers, request, options: options);
  }

  $grpc.ResponseFuture<$5.Tower> getTowerInfo($5.GetTowerInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTowerInfo, request, options: options);
  }

  $grpc.ResponseFuture<$5.StatsResponse> stats($5.StatsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$stats, request, options: options);
  }

  $grpc.ResponseFuture<$5.PolicyResponse> policy($5.PolicyRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$policy, request, options: options);
  }
}

abstract class WatchtowerClientServiceBase extends $grpc.Service {
  $core.String get $name => 'wtclientrpc.WatchtowerClient';

  WatchtowerClientServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.AddTowerRequest, $5.AddTowerResponse>(
        'AddTower',
        addTower_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.AddTowerRequest.fromBuffer(value),
        ($5.AddTowerResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$5.RemoveTowerRequest, $5.RemoveTowerResponse>(
            'RemoveTower',
            removeTower_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $5.RemoveTowerRequest.fromBuffer(value),
            ($5.RemoveTowerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ListTowersRequest, $5.ListTowersResponse>(
        'ListTowers',
        listTowers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ListTowersRequest.fromBuffer(value),
        ($5.ListTowersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.GetTowerInfoRequest, $5.Tower>(
        'GetTowerInfo',
        getTowerInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.GetTowerInfoRequest.fromBuffer(value),
        ($5.Tower value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.StatsRequest, $5.StatsResponse>(
        'Stats',
        stats_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.StatsRequest.fromBuffer(value),
        ($5.StatsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.PolicyRequest, $5.PolicyResponse>(
        'Policy',
        policy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.PolicyRequest.fromBuffer(value),
        ($5.PolicyResponse value) => value.writeToBuffer()));
  }

  $async.Future<$5.AddTowerResponse> addTower_Pre(
      $grpc.ServiceCall call, $async.Future<$5.AddTowerRequest> request) async {
    return addTower(call, await request);
  }

  $async.Future<$5.RemoveTowerResponse> removeTower_Pre($grpc.ServiceCall call,
      $async.Future<$5.RemoveTowerRequest> request) async {
    return removeTower(call, await request);
  }

  $async.Future<$5.ListTowersResponse> listTowers_Pre($grpc.ServiceCall call,
      $async.Future<$5.ListTowersRequest> request) async {
    return listTowers(call, await request);
  }

  $async.Future<$5.Tower> getTowerInfo_Pre($grpc.ServiceCall call,
      $async.Future<$5.GetTowerInfoRequest> request) async {
    return getTowerInfo(call, await request);
  }

  $async.Future<$5.StatsResponse> stats_Pre(
      $grpc.ServiceCall call, $async.Future<$5.StatsRequest> request) async {
    return stats(call, await request);
  }

  $async.Future<$5.PolicyResponse> policy_Pre(
      $grpc.ServiceCall call, $async.Future<$5.PolicyRequest> request) async {
    return policy(call, await request);
  }

  $async.Future<$5.AddTowerResponse> addTower(
      $grpc.ServiceCall call, $5.AddTowerRequest request);
  $async.Future<$5.RemoveTowerResponse> removeTower(
      $grpc.ServiceCall call, $5.RemoveTowerRequest request);
  $async.Future<$5.ListTowersResponse> listTowers(
      $grpc.ServiceCall call, $5.ListTowersRequest request);
  $async.Future<$5.Tower> getTowerInfo(
      $grpc.ServiceCall call, $5.GetTowerInfoRequest request);
  $async.Future<$5.StatsResponse> stats(
      $grpc.ServiceCall call, $5.StatsRequest request);
  $async.Future<$5.PolicyResponse> policy(
      $grpc.ServiceCall call, $5.PolicyRequest request);
}
