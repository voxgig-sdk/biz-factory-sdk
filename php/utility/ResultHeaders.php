<?php
declare(strict_types=1);

// BizFactory SDK utility: result_headers

class BizFactoryResultHeaders
{
    public static function call(BizFactoryContext $ctx): ?BizFactoryResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
