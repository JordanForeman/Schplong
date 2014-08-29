//
//  BallNode.h
//  Schplong
//
//  Created by Jordan Foreman on 8/26/14.
//  Copyright (c) 2014 Better Than Great. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BallNode : SKNode

@property (nonatomic) CGPoint ballPosition;
@property (nonatomic) BOOL needsServed;

+ (instancetype) ballNodeAtPosition:(CGPoint)position;
- (void) setVelocityWithRadians:(float)radians Magnitude:(float)magnitude;
- (void) serveTowardsLeft;
- (void) serveTowardsRight;
- (void)reflectVerticalVelocity;

@end
