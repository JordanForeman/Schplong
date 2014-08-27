//
//  BallNode.m
//  Schplong
//
//  Created by Jordan Foreman on 8/26/14.
//  Copyright (c) 2014 Better Than Great. All rights reserved.
//

#import "BallNode.h"
#import "SchplongUtil.h"

@implementation BallNode

+ (instancetype) ballNodeAtPosition:(CGPoint)position {
	BallNode *ballNode = [self node];

	SKCropNode *ball = [[SKCropNode alloc] init];
	SKShapeNode *circleMask = [[SKShapeNode alloc ]init];
	CGMutablePathRef circle = CGPathCreateMutable();
	CGPathAddArc(circle, NULL,
				 CGRectGetMidX(ballNode.frame),
				 CGRectGetMidY(ballNode.frame),
				 (BALL_RADIUS / 2), 0, M_PI*2, YES);
	circleMask.path = circle;
	circleMask.lineWidth = BALL_RADIUS * 2;
	circleMask.strokeColor = [SKColor whiteColor];
	circleMask.name=@"circleMask";
	[ball setMaskNode:circleMask];
	ball.name = @"Ball";
	ball.position = position;
	[ballNode addChild:ball];
	
	return ballNode;
}

@end
