//
//  SchplongUtil.m
//  Schplong
//
//  Created by Jordan Foreman on 8/26/14.
//  Copyright (c) 2014 Better Than Great. All rights reserved.
//

#import "SchplongUtil.h"

@implementation SchplongUtil

+(SKShapeNode *)getFullColorBackground:(UIColor *)color forFrame:(CGRect)frame {
	
	SKShapeNode *background = [SKShapeNode node];
	CGRect bgRect = CGRectMake(0, 0,
							   frame.size.width,
							   frame.size.height);
	CGPathRef bgPath = CGPathCreateWithRect(bgRect, nil);
	[background setPath:bgPath];
	[background setFillColor:color];
	[background setStrokeColor:color];
	background.position = CGPointMake(0, 0);
	
	return background;
}

@end
