//
//  DataProcessing.m
//  test
//
//  Created by SpawNmHt7nOthing on 2016/11/28.
//  Copyright © 2016Year SpawNmHt7nOthing. All rights reserved.
//

#import "DataProcessing.h"
#import "DataManageCenter.h"

static DataProcessing *center=nil;

@implementation DataProcessing

+(instancetype)manageCenter{
    
    static dispatch_once_t dispatch;
    dispatch_once(&dispatch,^{
        center=(DataProcessing*)@"DataProcessing";
        center=[[DataProcessing alloc]init];
    });
    
    //防止继承 子类使用
    NSString *classString = NSStringFromClass([self class]);
    if ([classString isEqualToString:@"DataProcessing"] == NO) {
        NSParameterAssert(nil);
    }
    
    return center;
}
//重写init方法 确保实例对象只出现一个
-(instancetype)init{
    NSString *string=(NSString*)center;
    if ([string isKindOfClass:[NSString class]]==YES && [string isEqualToString:@"DataProcessing"]){
        self=[super init];
        if (self) {
            //防止继承 子类使用
            NSString *classString = NSStringFromClass([self class]);
            if ([classString isEqualToString:@"DataProcessing"] == NO) {
                NSParameterAssert(nil);
            }
        }
    }else{
        self=nil;
    }
    
    return self;
}



//取值
- (NSString*)objectForKey:(NSString *)aKey{
    DataManageCenter *data=[DataManageCenter manageCenter];
    if ([data.dictionary objectForKey:aKey]!=NULL) {
        return [data.dictionary objectForKey:aKey];
    }else{
        return NULL;
    }
}

//存值
- (void)setObject:(NSString *)anObject forKey:(NSString *) aKey{
    
    DataManageCenter *data=[DataManageCenter manageCenter];
    [data.dictionary setObject:anObject forKey:aKey];
    
}
@end
