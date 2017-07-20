//
//  DataManageCenter.m
//  test
//
//  Created by SpawNmHt7nOthing on 2016/11/28.
//  Copyright © 2016Year SpawNmHt7nOthing. All rights reserved.
//

#import "DataManageCenter.h"

static DataManageCenter *center=nil;

@implementation DataManageCenter

+(instancetype)manageCenter{
    
    static dispatch_once_t perdicate;
    dispatch_once(&perdicate,^{
        center=(DataManageCenter*)@"DataManageCenter";
        center=[[DataManageCenter alloc]init];
        center.dictionary= [NSMutableDictionary dictionary];
    });
    
    //防止继承 子类使用
    NSString *classString = NSStringFromClass([self class]);
    if ([classString isEqualToString:@"DataManageCenter"] == NO) {
        NSParameterAssert(nil);
    }
    
    return center;
}

//重写init方法 确保实例对象只出现一个
-(instancetype)init{
    NSString *string=(NSString*)center;
    if ([string isKindOfClass:[NSString class]]==YES && [string isEqualToString:@"DataManageCenter"]){
        self=[super init];
        if (self) {
            //防止继承 子类使用
            NSString *classString = NSStringFromClass([self class]);
            if ([classString isEqualToString:@"DataManageCenter"] == NO) {
                NSParameterAssert(nil);
            }
        }
    }else{
        self=nil;
    }
        
    return self;
}
@end
