//
//  drawImg.m
//  DrawPicture
//
//  Created by 李明禄 on 15/12/18.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "drawImg.h"

@implementation drawImg


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //1.画线
    [self drawline1];
    
    //2.UIBezierPath画线
    [self bezierDraw];
    
}

///bezier画线
- (void)bezierDraw {
    
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //2.1设置起点
    [path moveToPoint:CGPointMake(50, 60)];
    
    //2.2设置终点
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 100)];

    
    //3.将路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    //设置绘图状态
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineWidth(ctx, 20);
    [[UIColor redColor] set];
    
    //4.渲染到view的layer
    CGContextStrokePath(ctx);
    
}


///画线
- (void)drawline1 {

    //1.获取View相关的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2.拼接路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    //2.1设置起点
    CGPathMoveToPoint(path, NULL, 0, 0);
    
    //2.2添加一根线到某个点
    CGPathAddLineToPoint(path, NULL, 100, 200);
    
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path);
    
    //4.把上下文渲染到view的layer 上面
    CGContextStrokePath(ctx);
}


@end
