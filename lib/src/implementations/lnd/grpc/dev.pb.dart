///
//  Generated code. Do not modify.
//  source: dev.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ImportGraphResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImportGraphResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'devrpc'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ImportGraphResponse._() : super();
  factory ImportGraphResponse() => create();
  factory ImportGraphResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImportGraphResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImportGraphResponse clone() => ImportGraphResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImportGraphResponse copyWith(void Function(ImportGraphResponse) updates) => super.copyWith((message) => updates(message as ImportGraphResponse)) as ImportGraphResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImportGraphResponse create() => ImportGraphResponse._();
  ImportGraphResponse createEmptyInstance() => create();
  static $pb.PbList<ImportGraphResponse> createRepeated() => $pb.PbList<ImportGraphResponse>();
  @$core.pragma('dart2js:noInline')
  static ImportGraphResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImportGraphResponse>(create);
  static ImportGraphResponse? _defaultInstance;
}

