//
//  *******************************************
//
//  IHTImageUti.m
//  Htime
//
//  Created by Noah_Shan on 2020/2/21.
//  Copyright © 2018 Inpur. All rights reserved.
//
//  *******************************************
//


#import "IHTImageUti.h"
#import "NightBusiness-Swift.h"
#import <UIImage+MultiFormat.h>
@implementation IHTImageUti


/**
 根据目标图片制作一个盖水印的图片

 @param originalImage 源图片
 @param title 水印文字
 @param markFont 水印文字font(如果不传默认为23)
 @param markColor 水印文字颜色(如果不传递默认为源图片的对比色)
 @return 返回盖水印的图片
 **/
+ (UIImage *)getWaterMarkImage: (UIImage *)originalImage andTitle: (NSString *)title andMarkFont: (UIFont *)markFont {
    UIFont *font = markFont;
    if (font == nil) {
        font = [UIFont boldSystemFontOfSize:23];
    }
    UIColor *color = IHTUIConfig.bgDarkLightBlackColor;
    //原始image的宽高
    CGFloat viewWidth = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    CGFloat viewHeight = CGRectGetHeight([[UIScreen mainScreen] bounds]);
    //为了防止图片失真，绘制区域宽高和原始图片宽高一样
    UIGraphicsBeginImageContext(CGSizeMake(viewWidth, viewHeight));
    //先将原始image绘制上
    [originalImage drawInRect:CGRectMake(0, 0, viewWidth, viewHeight)];
    //sqrtLength：原始image的对角线length。在水印旋转矩阵中只要矩阵的宽高是原始image的对角线长度，无论旋转多少度都不会有空白。
    CGFloat sqrtLength = sqrt(viewWidth*viewWidth + viewHeight*viewHeight);
    //文字的属性
    NSDictionary *attr = @{
                           //设置字体大小
                           NSFontAttributeName: font,
                           //设置文字颜色
                           NSForegroundColorAttributeName :color,
                           };
    NSString* mark = title;
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:mark attributes:attr];
    //绘制文字的宽高
    CGFloat strWidth = attrStr.size.width;
    CGFloat strHeight = attrStr.size.height;
    //开始旋转上下文矩阵，绘制水印文字
    CGContextRef context = UIGraphicsGetCurrentContext();
    //将绘制原点（0，0）调整到源image的中心
    CGContextConcatCTM(context, CGAffineTransformMakeTranslation(viewWidth/2, viewHeight/2));
    //以绘制原点为中心旋转
    CGContextConcatCTM(context, CGAffineTransformMakeRotation(-(M_PI_2 / 3)));
    //将绘制原点恢复初始值，保证当前context中心和源image的中心处在一个点(当前context已经旋转，所以绘制出的任何layer都是倾斜的)
    CGContextConcatCTM(context, CGAffineTransformMakeTranslation(-viewWidth/2, -viewHeight/2));
    //计算需要绘制的列数和行数
    int horCount = sqrtLength / (strWidth + 150) + 1;
    int verCount = sqrtLength / (strHeight + 100) + 1;
    //此处计算出需要绘制水印文字的起始点，由于水印区域要大于图片区域所以起点在原有基础上移
    CGFloat orignX = -(sqrtLength-viewWidth)/2;
    CGFloat orignY = -(sqrtLength-viewHeight)/2;
    //在每列绘制时X坐标叠加
    CGFloat tempOrignX = orignX;
    //在每行绘制时Y坐标叠加
    CGFloat tempOrignY = orignY;
    for (int i = 0; i < horCount * verCount; i++) {
        [mark drawInRect:CGRectMake(tempOrignX, tempOrignY, strWidth, strHeight) withAttributes:attr];
        if (i % horCount == 0 && i != 0) {
            tempOrignX = orignX;
            tempOrignY += (strHeight + 150);
        }
        else{
            tempOrignX += (strWidth + 100);
        }
    }
    //根据上下文制作成图片
    UIImage *finalImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGContextRestoreGState(context);
    return finalImg;
}

/**
 绘制带名字最后一个字的图片
 @param text 文字，利用正则获取匹配的数据，然后再取最后一个字
 @return 图片本地路径地址
 */
+ (NSString *)getAvatarByText:(NSString *)text hd: (BOOL) ishdImg {
    NSString *lastWord;
    NSString *filePath;
    if(text.length > 0){
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(\\(|（)[^（\\(\\)）]*?(\\)|）)|\\d*$" options:NSRegularExpressionCaseInsensitive error:nil];
        NSString *str = [regex stringByReplacingMatchesInString:text options:0 range:NSMakeRange(0, [text length]) withTemplate:@""];
        if (str.length > 0) {
            //取一个字
            lastWord = [str substringToIndex:1];

            //lastWord = [str substringFromIndex:0];
        }
        else {
            lastWord = @"";
        }
    }
    else {
        lastWord = @"";
    }
    //检查有没有缓存，有就直接读本地
    filePath = [[self getAvatarSavePath:ishdImg] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg",lastWord]];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return filePath;
    }
    CGSize size;
    if (ishdImg) {
        size = CGSizeMake(IHTUIConfig.aWeight / 2, IHTUIConfig.aHeight / 2);
    } else {
        size = CGSizeMake(180, 180);
    }
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *color = [UIColor colorWithRed:54/255.0 green:165/255.0 blue:246/255.0 alpha:1];
    //Color
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:104], NSFontAttributeName, nil];
    CGSize textSize = [lastWord sizeWithAttributes:textAttributes];
    [lastWord drawInRect:CGRectMake((size.width - textSize.width) / 2, (size.height - textSize.height) / 2, textSize.width, textSize.height) withAttributes:textAttributes];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //生成完之后，储存本地
    if(text.length > 0){
        [UIImageJPEGRepresentation(image, 0.8) writeToFile:filePath atomically:YES];
    }
    return filePath;
}

+ (NSString *)getAvatarSavePath: (BOOL) hdimg {
    //头像生成路径无需区分用户、企业
    NSString *path;
    if (hdimg) {
        path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"AvatarFolderHD"];
    } else {
        path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"AvatarFolder"];
    }

    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isDirExist = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if(!(isDirExist && isDir)) {
        BOOL bCreateDir = [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        if(!bCreateDir) {
            NSLog(@"创建文件夹失败！%@",path);
        }
    }
    return path;
}


@end
