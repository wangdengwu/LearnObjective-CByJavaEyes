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

//测试基本的对象属性赋值以及实例方法调用
void say(){//c语言的特性先定义后调用
    WDWObject *obj=[WDWObject new];
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
    NSLog(@"%@",[p getString]);//fuck 父类了
    NSLog(@"%@",[p getName]);
    WDWObjectPrivateChild *c=[WDWObjectPrivate new];//有警告，但是可以执行
    NSLog(@"%@",[c getName]);
    [c getString];
}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
//        say();
//        niceInvok();
//        testDescription();
//        testNPE();
//        testPrivate();
        testExtend();
        //TODO  继承，类初始化，方法重载，集合类操作，协议，类别，Block
    }
    return 0;
}


