//
//  PaddleNode.h
//  Schplong
//
//  Created by Jordan Foreman on 8/26/14.
//  Copyright (c) 2014 Better Than Great. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface PaddleNode : SKNode

@property (nonatomic) BOOL isMoving;
@property (nonatomic) CGPoint targetDestination;

+ (instancetype) paddleNodeAtPosition:(CGPoint)position;

- (void) startMovingTowardsPosition:(CGPoint)position;
- (void) moveTowardsTarget;
@end
