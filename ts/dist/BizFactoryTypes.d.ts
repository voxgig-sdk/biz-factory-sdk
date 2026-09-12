export interface Group {
    description?: string;
    groupName?: string;
    inviteLink?: string;
    memberCount?: number;
    resources?: any[];
}
export interface GroupListMatch {
    description?: string;
    groupName?: string;
    inviteLink?: string;
    memberCount?: number;
    resources?: any[];
    $action?: string;
    [action: string]: any;
}
