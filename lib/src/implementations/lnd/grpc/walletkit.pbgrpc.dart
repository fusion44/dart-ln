///
//  Generated code. Do not modify.
//  source: walletkit.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'walletkit.pb.dart' as $3;
import 'signer.pb.dart' as $2;
export 'walletkit.pb.dart';

class WalletKitClient extends $grpc.Client {
  static final _$listUnspent =
      $grpc.ClientMethod<$3.ListUnspentRequest, $3.ListUnspentResponse>(
          '/walletrpc.WalletKit/ListUnspent',
          ($3.ListUnspentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListUnspentResponse.fromBuffer(value));
  static final _$leaseOutput =
      $grpc.ClientMethod<$3.LeaseOutputRequest, $3.LeaseOutputResponse>(
          '/walletrpc.WalletKit/LeaseOutput',
          ($3.LeaseOutputRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.LeaseOutputResponse.fromBuffer(value));
  static final _$releaseOutput =
      $grpc.ClientMethod<$3.ReleaseOutputRequest, $3.ReleaseOutputResponse>(
          '/walletrpc.WalletKit/ReleaseOutput',
          ($3.ReleaseOutputRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ReleaseOutputResponse.fromBuffer(value));
  static final _$listLeases =
      $grpc.ClientMethod<$3.ListLeasesRequest, $3.ListLeasesResponse>(
          '/walletrpc.WalletKit/ListLeases',
          ($3.ListLeasesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListLeasesResponse.fromBuffer(value));
  static final _$deriveNextKey =
      $grpc.ClientMethod<$3.KeyReq, $2.KeyDescriptor>(
          '/walletrpc.WalletKit/DeriveNextKey',
          ($3.KeyReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.KeyDescriptor.fromBuffer(value));
  static final _$deriveKey =
      $grpc.ClientMethod<$2.KeyLocator, $2.KeyDescriptor>(
          '/walletrpc.WalletKit/DeriveKey',
          ($2.KeyLocator value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.KeyDescriptor.fromBuffer(value));
  static final _$nextAddr = $grpc.ClientMethod<$3.AddrRequest, $3.AddrResponse>(
      '/walletrpc.WalletKit/NextAddr',
      ($3.AddrRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.AddrResponse.fromBuffer(value));
  static final _$listAccounts =
      $grpc.ClientMethod<$3.ListAccountsRequest, $3.ListAccountsResponse>(
          '/walletrpc.WalletKit/ListAccounts',
          ($3.ListAccountsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListAccountsResponse.fromBuffer(value));
  static final _$importAccount =
      $grpc.ClientMethod<$3.ImportAccountRequest, $3.ImportAccountResponse>(
          '/walletrpc.WalletKit/ImportAccount',
          ($3.ImportAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ImportAccountResponse.fromBuffer(value));
  static final _$importPublicKey =
      $grpc.ClientMethod<$3.ImportPublicKeyRequest, $3.ImportPublicKeyResponse>(
          '/walletrpc.WalletKit/ImportPublicKey',
          ($3.ImportPublicKeyRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ImportPublicKeyResponse.fromBuffer(value));
  static final _$publishTransaction =
      $grpc.ClientMethod<$3.Transaction, $3.PublishResponse>(
          '/walletrpc.WalletKit/PublishTransaction',
          ($3.Transaction value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.PublishResponse.fromBuffer(value));
  static final _$sendOutputs =
      $grpc.ClientMethod<$3.SendOutputsRequest, $3.SendOutputsResponse>(
          '/walletrpc.WalletKit/SendOutputs',
          ($3.SendOutputsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.SendOutputsResponse.fromBuffer(value));
  static final _$estimateFee =
      $grpc.ClientMethod<$3.EstimateFeeRequest, $3.EstimateFeeResponse>(
          '/walletrpc.WalletKit/EstimateFee',
          ($3.EstimateFeeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.EstimateFeeResponse.fromBuffer(value));
  static final _$pendingSweeps =
      $grpc.ClientMethod<$3.PendingSweepsRequest, $3.PendingSweepsResponse>(
          '/walletrpc.WalletKit/PendingSweeps',
          ($3.PendingSweepsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.PendingSweepsResponse.fromBuffer(value));
  static final _$bumpFee =
      $grpc.ClientMethod<$3.BumpFeeRequest, $3.BumpFeeResponse>(
          '/walletrpc.WalletKit/BumpFee',
          ($3.BumpFeeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.BumpFeeResponse.fromBuffer(value));
  static final _$listSweeps =
      $grpc.ClientMethod<$3.ListSweepsRequest, $3.ListSweepsResponse>(
          '/walletrpc.WalletKit/ListSweeps',
          ($3.ListSweepsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListSweepsResponse.fromBuffer(value));
  static final _$labelTransaction = $grpc.ClientMethod<
          $3.LabelTransactionRequest, $3.LabelTransactionResponse>(
      '/walletrpc.WalletKit/LabelTransaction',
      ($3.LabelTransactionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $3.LabelTransactionResponse.fromBuffer(value));
  static final _$fundPsbt =
      $grpc.ClientMethod<$3.FundPsbtRequest, $3.FundPsbtResponse>(
          '/walletrpc.WalletKit/FundPsbt',
          ($3.FundPsbtRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.FundPsbtResponse.fromBuffer(value));
  static final _$signPsbt =
      $grpc.ClientMethod<$3.SignPsbtRequest, $3.SignPsbtResponse>(
          '/walletrpc.WalletKit/SignPsbt',
          ($3.SignPsbtRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.SignPsbtResponse.fromBuffer(value));
  static final _$finalizePsbt =
      $grpc.ClientMethod<$3.FinalizePsbtRequest, $3.FinalizePsbtResponse>(
          '/walletrpc.WalletKit/FinalizePsbt',
          ($3.FinalizePsbtRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.FinalizePsbtResponse.fromBuffer(value));

  WalletKitClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.ListUnspentResponse> listUnspent(
      $3.ListUnspentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listUnspent, request, options: options);
  }

  $grpc.ResponseFuture<$3.LeaseOutputResponse> leaseOutput(
      $3.LeaseOutputRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leaseOutput, request, options: options);
  }

  $grpc.ResponseFuture<$3.ReleaseOutputResponse> releaseOutput(
      $3.ReleaseOutputRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$releaseOutput, request, options: options);
  }

  $grpc.ResponseFuture<$3.ListLeasesResponse> listLeases(
      $3.ListLeasesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listLeases, request, options: options);
  }

  $grpc.ResponseFuture<$2.KeyDescriptor> deriveNextKey($3.KeyReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deriveNextKey, request, options: options);
  }

  $grpc.ResponseFuture<$2.KeyDescriptor> deriveKey($2.KeyLocator request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deriveKey, request, options: options);
  }

  $grpc.ResponseFuture<$3.AddrResponse> nextAddr($3.AddrRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$nextAddr, request, options: options);
  }

  $grpc.ResponseFuture<$3.ListAccountsResponse> listAccounts(
      $3.ListAccountsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listAccounts, request, options: options);
  }

  $grpc.ResponseFuture<$3.ImportAccountResponse> importAccount(
      $3.ImportAccountRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$importAccount, request, options: options);
  }

  $grpc.ResponseFuture<$3.ImportPublicKeyResponse> importPublicKey(
      $3.ImportPublicKeyRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$importPublicKey, request, options: options);
  }

  $grpc.ResponseFuture<$3.PublishResponse> publishTransaction(
      $3.Transaction request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$publishTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$3.SendOutputsResponse> sendOutputs(
      $3.SendOutputsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendOutputs, request, options: options);
  }

  $grpc.ResponseFuture<$3.EstimateFeeResponse> estimateFee(
      $3.EstimateFeeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$estimateFee, request, options: options);
  }

  $grpc.ResponseFuture<$3.PendingSweepsResponse> pendingSweeps(
      $3.PendingSweepsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$pendingSweeps, request, options: options);
  }

  $grpc.ResponseFuture<$3.BumpFeeResponse> bumpFee($3.BumpFeeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$bumpFee, request, options: options);
  }

  $grpc.ResponseFuture<$3.ListSweepsResponse> listSweeps(
      $3.ListSweepsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listSweeps, request, options: options);
  }

  $grpc.ResponseFuture<$3.LabelTransactionResponse> labelTransaction(
      $3.LabelTransactionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$labelTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$3.FundPsbtResponse> fundPsbt($3.FundPsbtRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fundPsbt, request, options: options);
  }

  $grpc.ResponseFuture<$3.SignPsbtResponse> signPsbt($3.SignPsbtRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signPsbt, request, options: options);
  }

  $grpc.ResponseFuture<$3.FinalizePsbtResponse> finalizePsbt(
      $3.FinalizePsbtRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$finalizePsbt, request, options: options);
  }
}

abstract class WalletKitServiceBase extends $grpc.Service {
  $core.String get $name => 'walletrpc.WalletKit';

  WalletKitServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$3.ListUnspentRequest, $3.ListUnspentResponse>(
            'ListUnspent',
            listUnspent_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.ListUnspentRequest.fromBuffer(value),
            ($3.ListUnspentResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.LeaseOutputRequest, $3.LeaseOutputResponse>(
            'LeaseOutput',
            leaseOutput_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.LeaseOutputRequest.fromBuffer(value),
            ($3.LeaseOutputResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.ReleaseOutputRequest, $3.ReleaseOutputResponse>(
            'ReleaseOutput',
            releaseOutput_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.ReleaseOutputRequest.fromBuffer(value),
            ($3.ReleaseOutputResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ListLeasesRequest, $3.ListLeasesResponse>(
        'ListLeases',
        listLeases_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ListLeasesRequest.fromBuffer(value),
        ($3.ListLeasesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.KeyReq, $2.KeyDescriptor>(
        'DeriveNextKey',
        deriveNextKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.KeyReq.fromBuffer(value),
        ($2.KeyDescriptor value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.KeyLocator, $2.KeyDescriptor>(
        'DeriveKey',
        deriveKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.KeyLocator.fromBuffer(value),
        ($2.KeyDescriptor value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.AddrRequest, $3.AddrResponse>(
        'NextAddr',
        nextAddr_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.AddrRequest.fromBuffer(value),
        ($3.AddrResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.ListAccountsRequest, $3.ListAccountsResponse>(
            'ListAccounts',
            listAccounts_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.ListAccountsRequest.fromBuffer(value),
            ($3.ListAccountsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.ImportAccountRequest, $3.ImportAccountResponse>(
            'ImportAccount',
            importAccount_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.ImportAccountRequest.fromBuffer(value),
            ($3.ImportAccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ImportPublicKeyRequest,
            $3.ImportPublicKeyResponse>(
        'ImportPublicKey',
        importPublicKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.ImportPublicKeyRequest.fromBuffer(value),
        ($3.ImportPublicKeyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.Transaction, $3.PublishResponse>(
        'PublishTransaction',
        publishTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.Transaction.fromBuffer(value),
        ($3.PublishResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.SendOutputsRequest, $3.SendOutputsResponse>(
            'SendOutputs',
            sendOutputs_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.SendOutputsRequest.fromBuffer(value),
            ($3.SendOutputsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.EstimateFeeRequest, $3.EstimateFeeResponse>(
            'EstimateFee',
            estimateFee_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.EstimateFeeRequest.fromBuffer(value),
            ($3.EstimateFeeResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.PendingSweepsRequest, $3.PendingSweepsResponse>(
            'PendingSweeps',
            pendingSweeps_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.PendingSweepsRequest.fromBuffer(value),
            ($3.PendingSweepsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.BumpFeeRequest, $3.BumpFeeResponse>(
        'BumpFee',
        bumpFee_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.BumpFeeRequest.fromBuffer(value),
        ($3.BumpFeeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ListSweepsRequest, $3.ListSweepsResponse>(
        'ListSweeps',
        listSweeps_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ListSweepsRequest.fromBuffer(value),
        ($3.ListSweepsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.LabelTransactionRequest,
            $3.LabelTransactionResponse>(
        'LabelTransaction',
        labelTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.LabelTransactionRequest.fromBuffer(value),
        ($3.LabelTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.FundPsbtRequest, $3.FundPsbtResponse>(
        'FundPsbt',
        fundPsbt_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.FundPsbtRequest.fromBuffer(value),
        ($3.FundPsbtResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.SignPsbtRequest, $3.SignPsbtResponse>(
        'SignPsbt',
        signPsbt_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.SignPsbtRequest.fromBuffer(value),
        ($3.SignPsbtResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.FinalizePsbtRequest, $3.FinalizePsbtResponse>(
            'FinalizePsbt',
            finalizePsbt_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.FinalizePsbtRequest.fromBuffer(value),
            ($3.FinalizePsbtResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.ListUnspentResponse> listUnspent_Pre($grpc.ServiceCall call,
      $async.Future<$3.ListUnspentRequest> request) async {
    return listUnspent(call, await request);
  }

  $async.Future<$3.LeaseOutputResponse> leaseOutput_Pre($grpc.ServiceCall call,
      $async.Future<$3.LeaseOutputRequest> request) async {
    return leaseOutput(call, await request);
  }

  $async.Future<$3.ReleaseOutputResponse> releaseOutput_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.ReleaseOutputRequest> request) async {
    return releaseOutput(call, await request);
  }

  $async.Future<$3.ListLeasesResponse> listLeases_Pre($grpc.ServiceCall call,
      $async.Future<$3.ListLeasesRequest> request) async {
    return listLeases(call, await request);
  }

  $async.Future<$2.KeyDescriptor> deriveNextKey_Pre(
      $grpc.ServiceCall call, $async.Future<$3.KeyReq> request) async {
    return deriveNextKey(call, await request);
  }

  $async.Future<$2.KeyDescriptor> deriveKey_Pre(
      $grpc.ServiceCall call, $async.Future<$2.KeyLocator> request) async {
    return deriveKey(call, await request);
  }

  $async.Future<$3.AddrResponse> nextAddr_Pre(
      $grpc.ServiceCall call, $async.Future<$3.AddrRequest> request) async {
    return nextAddr(call, await request);
  }

  $async.Future<$3.ListAccountsResponse> listAccounts_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.ListAccountsRequest> request) async {
    return listAccounts(call, await request);
  }

  $async.Future<$3.ImportAccountResponse> importAccount_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.ImportAccountRequest> request) async {
    return importAccount(call, await request);
  }

  $async.Future<$3.ImportPublicKeyResponse> importPublicKey_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.ImportPublicKeyRequest> request) async {
    return importPublicKey(call, await request);
  }

  $async.Future<$3.PublishResponse> publishTransaction_Pre(
      $grpc.ServiceCall call, $async.Future<$3.Transaction> request) async {
    return publishTransaction(call, await request);
  }

  $async.Future<$3.SendOutputsResponse> sendOutputs_Pre($grpc.ServiceCall call,
      $async.Future<$3.SendOutputsRequest> request) async {
    return sendOutputs(call, await request);
  }

  $async.Future<$3.EstimateFeeResponse> estimateFee_Pre($grpc.ServiceCall call,
      $async.Future<$3.EstimateFeeRequest> request) async {
    return estimateFee(call, await request);
  }

  $async.Future<$3.PendingSweepsResponse> pendingSweeps_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.PendingSweepsRequest> request) async {
    return pendingSweeps(call, await request);
  }

  $async.Future<$3.BumpFeeResponse> bumpFee_Pre(
      $grpc.ServiceCall call, $async.Future<$3.BumpFeeRequest> request) async {
    return bumpFee(call, await request);
  }

  $async.Future<$3.ListSweepsResponse> listSweeps_Pre($grpc.ServiceCall call,
      $async.Future<$3.ListSweepsRequest> request) async {
    return listSweeps(call, await request);
  }

  $async.Future<$3.LabelTransactionResponse> labelTransaction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.LabelTransactionRequest> request) async {
    return labelTransaction(call, await request);
  }

  $async.Future<$3.FundPsbtResponse> fundPsbt_Pre(
      $grpc.ServiceCall call, $async.Future<$3.FundPsbtRequest> request) async {
    return fundPsbt(call, await request);
  }

  $async.Future<$3.SignPsbtResponse> signPsbt_Pre(
      $grpc.ServiceCall call, $async.Future<$3.SignPsbtRequest> request) async {
    return signPsbt(call, await request);
  }

  $async.Future<$3.FinalizePsbtResponse> finalizePsbt_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.FinalizePsbtRequest> request) async {
    return finalizePsbt(call, await request);
  }

  $async.Future<$3.ListUnspentResponse> listUnspent(
      $grpc.ServiceCall call, $3.ListUnspentRequest request);
  $async.Future<$3.LeaseOutputResponse> leaseOutput(
      $grpc.ServiceCall call, $3.LeaseOutputRequest request);
  $async.Future<$3.ReleaseOutputResponse> releaseOutput(
      $grpc.ServiceCall call, $3.ReleaseOutputRequest request);
  $async.Future<$3.ListLeasesResponse> listLeases(
      $grpc.ServiceCall call, $3.ListLeasesRequest request);
  $async.Future<$2.KeyDescriptor> deriveNextKey(
      $grpc.ServiceCall call, $3.KeyReq request);
  $async.Future<$2.KeyDescriptor> deriveKey(
      $grpc.ServiceCall call, $2.KeyLocator request);
  $async.Future<$3.AddrResponse> nextAddr(
      $grpc.ServiceCall call, $3.AddrRequest request);
  $async.Future<$3.ListAccountsResponse> listAccounts(
      $grpc.ServiceCall call, $3.ListAccountsRequest request);
  $async.Future<$3.ImportAccountResponse> importAccount(
      $grpc.ServiceCall call, $3.ImportAccountRequest request);
  $async.Future<$3.ImportPublicKeyResponse> importPublicKey(
      $grpc.ServiceCall call, $3.ImportPublicKeyRequest request);
  $async.Future<$3.PublishResponse> publishTransaction(
      $grpc.ServiceCall call, $3.Transaction request);
  $async.Future<$3.SendOutputsResponse> sendOutputs(
      $grpc.ServiceCall call, $3.SendOutputsRequest request);
  $async.Future<$3.EstimateFeeResponse> estimateFee(
      $grpc.ServiceCall call, $3.EstimateFeeRequest request);
  $async.Future<$3.PendingSweepsResponse> pendingSweeps(
      $grpc.ServiceCall call, $3.PendingSweepsRequest request);
  $async.Future<$3.BumpFeeResponse> bumpFee(
      $grpc.ServiceCall call, $3.BumpFeeRequest request);
  $async.Future<$3.ListSweepsResponse> listSweeps(
      $grpc.ServiceCall call, $3.ListSweepsRequest request);
  $async.Future<$3.LabelTransactionResponse> labelTransaction(
      $grpc.ServiceCall call, $3.LabelTransactionRequest request);
  $async.Future<$3.FundPsbtResponse> fundPsbt(
      $grpc.ServiceCall call, $3.FundPsbtRequest request);
  $async.Future<$3.SignPsbtResponse> signPsbt(
      $grpc.ServiceCall call, $3.SignPsbtRequest request);
  $async.Future<$3.FinalizePsbtResponse> finalizePsbt(
      $grpc.ServiceCall call, $3.FinalizePsbtRequest request);
}
