///
//  Generated code. Do not modify.
//  source: invoices.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'invoices.pb.dart' as $8;
import 'lightning.pb.dart' as $0;
export 'invoices.pb.dart';

class InvoicesClient extends $grpc.Client {
  static final _$subscribeSingleInvoice =
      $grpc.ClientMethod<$8.SubscribeSingleInvoiceRequest, $0.Invoice>(
          '/invoicesrpc.Invoices/SubscribeSingleInvoice',
          ($8.SubscribeSingleInvoiceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Invoice.fromBuffer(value));
  static final _$cancelInvoice =
      $grpc.ClientMethod<$8.CancelInvoiceMsg, $8.CancelInvoiceResp>(
          '/invoicesrpc.Invoices/CancelInvoice',
          ($8.CancelInvoiceMsg value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $8.CancelInvoiceResp.fromBuffer(value));
  static final _$addHoldInvoice =
      $grpc.ClientMethod<$8.AddHoldInvoiceRequest, $8.AddHoldInvoiceResp>(
          '/invoicesrpc.Invoices/AddHoldInvoice',
          ($8.AddHoldInvoiceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $8.AddHoldInvoiceResp.fromBuffer(value));
  static final _$settleInvoice =
      $grpc.ClientMethod<$8.SettleInvoiceMsg, $8.SettleInvoiceResp>(
          '/invoicesrpc.Invoices/SettleInvoice',
          ($8.SettleInvoiceMsg value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $8.SettleInvoiceResp.fromBuffer(value));
  static final _$lookupInvoiceV2 =
      $grpc.ClientMethod<$8.LookupInvoiceMsg, $0.Invoice>(
          '/invoicesrpc.Invoices/LookupInvoiceV2',
          ($8.LookupInvoiceMsg value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Invoice.fromBuffer(value));

  InvoicesClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.Invoice> subscribeSingleInvoice(
      $8.SubscribeSingleInvoiceRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$subscribeSingleInvoice, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$8.CancelInvoiceResp> cancelInvoice(
      $8.CancelInvoiceMsg request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancelInvoice, request, options: options);
  }

  $grpc.ResponseFuture<$8.AddHoldInvoiceResp> addHoldInvoice(
      $8.AddHoldInvoiceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addHoldInvoice, request, options: options);
  }

  $grpc.ResponseFuture<$8.SettleInvoiceResp> settleInvoice(
      $8.SettleInvoiceMsg request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$settleInvoice, request, options: options);
  }

  $grpc.ResponseFuture<$0.Invoice> lookupInvoiceV2($8.LookupInvoiceMsg request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lookupInvoiceV2, request, options: options);
  }
}

abstract class InvoicesServiceBase extends $grpc.Service {
  $core.String get $name => 'invoicesrpc.Invoices';

  InvoicesServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$8.SubscribeSingleInvoiceRequest, $0.Invoice>(
            'SubscribeSingleInvoice',
            subscribeSingleInvoice_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $8.SubscribeSingleInvoiceRequest.fromBuffer(value),
            ($0.Invoice value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.CancelInvoiceMsg, $8.CancelInvoiceResp>(
        'CancelInvoice',
        cancelInvoice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.CancelInvoiceMsg.fromBuffer(value),
        ($8.CancelInvoiceResp value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$8.AddHoldInvoiceRequest, $8.AddHoldInvoiceResp>(
            'AddHoldInvoice',
            addHoldInvoice_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $8.AddHoldInvoiceRequest.fromBuffer(value),
            ($8.AddHoldInvoiceResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.SettleInvoiceMsg, $8.SettleInvoiceResp>(
        'SettleInvoice',
        settleInvoice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.SettleInvoiceMsg.fromBuffer(value),
        ($8.SettleInvoiceResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.LookupInvoiceMsg, $0.Invoice>(
        'LookupInvoiceV2',
        lookupInvoiceV2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.LookupInvoiceMsg.fromBuffer(value),
        ($0.Invoice value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Invoice> subscribeSingleInvoice_Pre($grpc.ServiceCall call,
      $async.Future<$8.SubscribeSingleInvoiceRequest> request) async* {
    yield* subscribeSingleInvoice(call, await request);
  }

  $async.Future<$8.CancelInvoiceResp> cancelInvoice_Pre($grpc.ServiceCall call,
      $async.Future<$8.CancelInvoiceMsg> request) async {
    return cancelInvoice(call, await request);
  }

  $async.Future<$8.AddHoldInvoiceResp> addHoldInvoice_Pre(
      $grpc.ServiceCall call,
      $async.Future<$8.AddHoldInvoiceRequest> request) async {
    return addHoldInvoice(call, await request);
  }

  $async.Future<$8.SettleInvoiceResp> settleInvoice_Pre($grpc.ServiceCall call,
      $async.Future<$8.SettleInvoiceMsg> request) async {
    return settleInvoice(call, await request);
  }

  $async.Future<$0.Invoice> lookupInvoiceV2_Pre($grpc.ServiceCall call,
      $async.Future<$8.LookupInvoiceMsg> request) async {
    return lookupInvoiceV2(call, await request);
  }

  $async.Stream<$0.Invoice> subscribeSingleInvoice(
      $grpc.ServiceCall call, $8.SubscribeSingleInvoiceRequest request);
  $async.Future<$8.CancelInvoiceResp> cancelInvoice(
      $grpc.ServiceCall call, $8.CancelInvoiceMsg request);
  $async.Future<$8.AddHoldInvoiceResp> addHoldInvoice(
      $grpc.ServiceCall call, $8.AddHoldInvoiceRequest request);
  $async.Future<$8.SettleInvoiceResp> settleInvoice(
      $grpc.ServiceCall call, $8.SettleInvoiceMsg request);
  $async.Future<$0.Invoice> lookupInvoiceV2(
      $grpc.ServiceCall call, $8.LookupInvoiceMsg request);
}
