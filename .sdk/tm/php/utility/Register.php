<?php
declare(strict_types=1);

// BizFactory SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

BizFactoryUtility::setRegistrar(function (BizFactoryUtility $u): void {
    $u->clean = [BizFactoryClean::class, 'call'];
    $u->done = [BizFactoryDone::class, 'call'];
    $u->make_error = [BizFactoryMakeError::class, 'call'];
    $u->feature_add = [BizFactoryFeatureAdd::class, 'call'];
    $u->feature_hook = [BizFactoryFeatureHook::class, 'call'];
    $u->feature_init = [BizFactoryFeatureInit::class, 'call'];
    $u->fetcher = [BizFactoryFetcher::class, 'call'];
    $u->make_fetch_def = [BizFactoryMakeFetchDef::class, 'call'];
    $u->make_context = [BizFactoryMakeContext::class, 'call'];
    $u->make_options = [BizFactoryMakeOptions::class, 'call'];
    $u->make_request = [BizFactoryMakeRequest::class, 'call'];
    $u->make_response = [BizFactoryMakeResponse::class, 'call'];
    $u->make_result = [BizFactoryMakeResult::class, 'call'];
    $u->make_point = [BizFactoryMakePoint::class, 'call'];
    $u->make_spec = [BizFactoryMakeSpec::class, 'call'];
    $u->make_url = [BizFactoryMakeUrl::class, 'call'];
    $u->param = [BizFactoryParam::class, 'call'];
    $u->prepare_auth = [BizFactoryPrepareAuth::class, 'call'];
    $u->prepare_body = [BizFactoryPrepareBody::class, 'call'];
    $u->prepare_headers = [BizFactoryPrepareHeaders::class, 'call'];
    $u->prepare_method = [BizFactoryPrepareMethod::class, 'call'];
    $u->prepare_params = [BizFactoryPrepareParams::class, 'call'];
    $u->prepare_path = [BizFactoryPreparePath::class, 'call'];
    $u->prepare_query = [BizFactoryPrepareQuery::class, 'call'];
    $u->result_basic = [BizFactoryResultBasic::class, 'call'];
    $u->result_body = [BizFactoryResultBody::class, 'call'];
    $u->result_headers = [BizFactoryResultHeaders::class, 'call'];
    $u->transform_request = [BizFactoryTransformRequest::class, 'call'];
    $u->transform_response = [BizFactoryTransformResponse::class, 'call'];
});
