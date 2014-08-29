//
//  GamePlayScene.h
//  Schplong
//
//  Created by Jordan Foreman on 8/26/14.
//  Copyright (c) 2014 Better Than Great. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BallNode.h"

@interface GamePlayScene : SKScene <SKPhysicsContactDelegate>

- (BOOL)isPointOnRightEdge:(CGPoint)point;
- (BOOL)isPointOnLeftEdge:(CGPoint)point;
- (BallNode *)getBall;

@end
