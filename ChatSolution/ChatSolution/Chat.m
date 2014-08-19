//
//  Chat.m
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha. All rights reserved.
//

#import "Chat.h"
static NSString* const MESSAGE_KEY= @"message";


@implementation Chat

- (id)initWithMessage:(NSString*)chatMessage
{
    self = [super init];
    if (self) {
        _message = chatMessage;
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder*)coder
{
	[coder encodeObject:_message forKey:MESSAGE_KEY];
}


-(id)initWithCoder:(NSCoder*)aDecoder
{
	if(self=[super init])
	{
		self.message=[aDecoder decodeObjectForKey:MESSAGE_KEY];
	}
	return self;
}

@end
