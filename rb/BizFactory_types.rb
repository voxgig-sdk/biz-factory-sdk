# frozen_string_literal: true

# Typed models for the BizFactory SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Group entity data model.
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] group_name
#   @return [String, nil]
#
# @!attribute [rw] invite_link
#   @return [String, nil]
#
# @!attribute [rw] member_count
#   @return [Integer, nil]
#
# @!attribute [rw] resource
#   @return [Array, nil]
Group = Struct.new(
  :description,
  :group_name,
  :invite_link,
  :member_count,
  :resource,
  keyword_init: true
)

# Match filter for Group#list (any subset of Group fields).
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] group_name
#   @return [String, nil]
#
# @!attribute [rw] invite_link
#   @return [String, nil]
#
# @!attribute [rw] member_count
#   @return [Integer, nil]
#
# @!attribute [rw] resource
#   @return [Array, nil]
GroupListMatch = Struct.new(
  :description,
  :group_name,
  :invite_link,
  :member_count,
  :resource,
  keyword_init: true
)

