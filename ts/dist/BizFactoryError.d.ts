import { Context } from './Context';
declare class BizFactoryError extends Error {
    isBizFactoryError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { BizFactoryError };
