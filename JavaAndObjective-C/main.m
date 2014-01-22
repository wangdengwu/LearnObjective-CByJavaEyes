//
//  main.m
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-15.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDWObject.h"//通过import引用头文件，没有包的概念，只有前缀WDW
#import "WDWObjectPrivate.h"
#import "WDWObjectPrivate+WDWOther.h"
#import "WDWProtocol.h"
#import "WDWParent.h"
#import "WDWThread.h"
#import "WDWKVC.h"

//测试基本的对象属性赋值以及实例方法调用
void say(){//c语言的特性先定义后调用
    WDWObject *obj=[WDWObject new];//
    obj.age=20;
    obj.man=YES;
    obj.name=@"object-c";//字符串常量
    [obj sayHello];
    [obj sayHello:@"world"];
}
//测试类属性和类方法
void niceInvok(){
    WDWObject *obj=[WDWObject new];
    obj.age=20;
    obj.man=YES;
    obj.name=@"andor";//字符串常量
    NSLog(@"%@",classProperty);
    NSLog(@"%@",WOMAN);
    [WDWObject areYou:obj Old:YES Man:YES];//如果是Java则是这样WDWObject.areYouOldMan(obj,true,true);what is true,true???
}
//测试description
void testDescription(){
    WDWObject *obj=[WDWObject new];
    obj.age=20;
    obj.man=YES;
    obj.name=@"andor";//字符串常量
    NSLog(@"%@",obj);//测试自描述，和Object.toString类似
}
//测试NPE
void testNPE(){
    WDWObject *obj=nil;
    [obj sayHello];
}
//测试私有属性和方法
void testPrivate(){
    WDWObjectPrivate *private=[WDWObjectPrivate new];
//    private->private=@"out";不可访问
    private->package=@"out";//可以访问
    private->public=@"public";//也可以
//    private->protected=@"protected";//不可以访问
    NSLog(@"%@",private);
    //
}
//测试继承
void testExtend(){
    WDWObjectPrivate *p=[WDWObjectPrivateChild new];
//    NSLog(@"%@",[p getString]);//fuck 父类了
    NSLog(@"%@",[p getName]);
//    WDWObjectPrivateChild *c=(WDWObjectPrivateChild*)[WDWObjectPrivate new];//有警告，但是可以执行
//    NSLog(@"%@",[c getName]);
//    NSLog(@"%@",[c getString]);
//    [c test];//fuck too;
}
//测试类别
void testCategory(){
    WDWObjectPrivate *p=[WDWObjectPrivate new];
    [p testCategory];
}
//测试集合类，并发要求不高，没有专门的并发集合类
void testCollection(){
    NSArray *array1=[NSArray arrayWithObjects:@"1",@"2",@"3",nil];
    NSMutableArray *array2=[[NSMutableArray alloc]initWithCapacity:3];
    for (NSString *s in array1) {
        NSLog(@"%@",s);
        [array2 addObject:s];
    }
    
//    [array2 addObject:nil];//crash......不可以插入nil
//    [array2 addObject:[NSNull null]];//可以插入NSNull来代替不存在
    
    
    NSDictionary *map=[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1],@"1",[NSNumber numberWithInt:2],@"2",[NSNumber numberWithInt:3],@"3",nil];
    
    NSMutableDictionary *map2=[[NSMutableDictionary alloc]initWithCapacity:3];
    
    [map enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
        NSLog(@"%@ is %@ and need stop? %s",key,obj,stop);
        [map2 setObject:obj forKey:key];
    }];
    
//    [map2 setObject:nil forKey:@"nil"];//同样不能把nil作为key或id
//    [map2 setObject:@"nil" forKey:nil];
    [map2 setObject:[NSNull null] forKey:@"nil"];
    
}

void testDelegate(){
    WDWProtocolDidDo *did=[WDWProtocolDidDo new];
    WDWProtocol *protocol=[[WDWProtocol alloc]initWithDelegate:did];
    [protocol doWhateverYouLike];
    [protocol doWhateverYouLove];
}

void testChildMethod(){
    WDWChild *child=[WDWChild new];
    [child viewDidLoad];
    WDWParent *p=[WDWParent new];
    [p viewDidLoad];
}

void testThread(){
    WDWThread *t1=[WDWThread new];
    [t1 addFrom:1 to:1000000];
}
void testKVC(){
    WDWKVC *kvc=[WDWKVC new];
//    NSString *name=[kvc valueForKeyPath:@"obj1.obj2.obj3.objs[2].name"];
//    NSLog(@"name:%@",name);
    NSLog(@"index sum=%@",[kvc valueForKeyPath:@"obj1.obj2.obj3.objs.@sum.index"]);
    NSLog(@"index avg=%@",[kvc valueForKeyPath:@"obj1.obj2.obj3.objs.@avg.index"]);
    NSLog(@"index max=%@",[kvc valueForKeyPath:@"obj1.obj2.obj3.objs.@max.index"]);
}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
//        say();
//        niceInvok();
//        testDescription();
//        testNPE();
//        testPrivate();
//        testExtend();
//        testChildMethod();
//        testCollection();
//        testCategory();
//        testDelegate();
//        testThread();
//        testKVC();
    }
    return 0;
}


