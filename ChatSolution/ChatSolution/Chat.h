//
//  Chat.h
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chat : NSObject<NSCoding>

@property(strong,nonatomic)NSString *message;
- (id)initWithMessage:(NSString*)chatMessage;

@end
