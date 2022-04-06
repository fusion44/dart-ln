///
//  Generated code. Do not modify.
//  source: lncli.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'verrpc.pb.dart' as $6;

class VersionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VersionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'lnclipb'), createEmptyInstance: create)
    ..aOM<$6.Version>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lncli', subBuilder: $6.Version.create)
    ..aOM<$6.Version>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lnd', subBuilder: $6.Version.create)
    ..hasRequiredFields = false
  ;

  VersionResponse._() : super();
  factory VersionResponse({
    $6.Version? lncli,
    $6.Version? lnd,
  }) {
    final _result = create();
    if (lncli != null) {
      _result.lncli = lncli;
    }
    if (lnd != null) {
      _result.lnd = lnd;
    }
    return _result;
  }
  factory VersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VersionResponse clone() => VersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VersionResponse copyWith(void Function(VersionResponse) updates) => super.copyWith((message) => updates(message as VersionResponse)) as VersionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VersionResponse create() => VersionResponse._();
  VersionResponse createEmptyInstance() => create();
  static $pb.PbList<VersionResponse> createRepeated() => $pb.PbList<VersionResponse>();
  @$core.pragma('dart2js:noInline')
  static VersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VersionResponse>(create);
  static VersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $6.Version get lncli => $_getN(0);
  @$pb.TagNumber(1)
  set lncli($6.Version v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLncli() => $_has(0);
  @$pb.TagNumber(1)
  void clearLncli() => clearField(1);
  @$pb.TagNumber(1)
  $6.Version ensureLncli() => $_ensure(0);

  @$pb.TagNumber(2)
  $6.Version get lnd => $_getN(1);
  @$pb.TagNumber(2)
  set lnd($6.Version v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearLnd() => clearField(2);
  @$pb.TagNumber(2)
  $6.Version ensureLnd() => $_ensure(1);
}

