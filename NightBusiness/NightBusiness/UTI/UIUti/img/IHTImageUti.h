//
//  *******************************************
//  
//  IHTImageUti.h
//  Htime
//
//  Created by Noah_Shan on 2020/2/21.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IHTImageUti : NSObject

/// 根据文字创建水印图片
+ (UIImage *)getWaterMarkImage: (UIImage *)originalImage andTitle: (NSString *)title andMarkFont: (UIFont *)markFont ;

/// 根据名字生成图片
+ (NSString *)getAvatarByText:(NSString *)text hd: (BOOL) ishdImg;

@end

NS_ASSUME_NONNULL_END
