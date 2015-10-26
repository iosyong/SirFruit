///
//  kInterface.h
//  EoopenEIM
//
//  Created by mac on 14-11-11.
//  Copyright (c) 2015年 James. All rights reserved.
//


#ifndef EoopenEIM_kInterface_h
#define EoopenEIM_kInterface_h


#pragma mark - http前缀接口

#if 1
// ***************  正式 http前缀 **************** //

#define HttpBase @"http://192.168.1.27:8088/"  //


#else
// *************** 测试 http前缀 **************** //

#define HttpBase @"http://192.168.0.108:8080/"  // 


#endif


#pragma mark - 😊 用户接口

// *** 用户接口 访问控制器 *** //
#define kInterfaceUserAppController HttpBase@"VkeManage/userAppController/"

// 注册
#define kInterfaceRegister (kInterfaceUserAppController@"register.action")

// 登录
#define kInterfaceLogin (kInterfaceUserAppController@"login.action")



#endif

