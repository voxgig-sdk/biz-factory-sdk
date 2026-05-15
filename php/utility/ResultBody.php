<?php
declare(strict_types=1);

// BizFactory SDK utility: result_body

class BizFactoryResultBody
{
    public static function call(BizFactoryContext $ctx): ?BizFactoryResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
