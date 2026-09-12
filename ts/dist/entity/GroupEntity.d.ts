import { BizFactoryEntityBase } from '../BizFactoryEntityBase';
import type { BizFactorySDK } from '../BizFactorySDK';
import type { Control } from '../types';
import type { Group, GroupListMatch } from '../BizFactoryTypes';
declare class GroupEntity extends BizFactoryEntityBase<Group> {
    constructor(client: BizFactorySDK, entopts: any);
    make(this: GroupEntity): GroupEntity;
    list(this: any, reqmatch?: GroupListMatch, ctrl?: Control): Promise<GroupEntity[]>;
}
export { GroupEntity };
