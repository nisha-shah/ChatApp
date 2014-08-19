//
//  User.m
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha. All rights reserved.
//

#import "User.h"
 
static NSString* const USERNAME_KEY= @"userName";
static NSString* const PROFILEPICNAME_KEY = @"profilePictureName";
static NSString* const CHATHISTORY_KEY = @"chatHistory";

@implementation User

- (id)initWithName:(NSString*)name AndPicName: (NSString*) picName
{
    self = [super init];
    if (self) {
        // All initializations, for example:
        _userName = name;
        _profilePictureName  =  picName;
        _chatHistory = [[NSMutableArray alloc]init];
    }
    return self;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"\nUser Name: %@ \nUser picureName: %@\n", self.userName,self.profilePictureName];
}

-(void)encodeWithCoder:(NSCoder*)coder
{
	[coder encodeObject:_userName forKey:USERNAME_KEY];
	[coder encodeObject:_profilePictureName forKey:PROFILEPICNAME_KEY];
	[coder encodeObject:_chatHistory forKey:CHATHISTORY_KEY];
}


-(id)initWithCoder:(NSCoder*)aDecoder
{
	if(self=[super init])
	{
		self.userName=[aDecoder decodeObjectForKey:USERNAME_KEY];
		self.profilePictureName=[aDecoder decodeObjectForKey:PROFILEPICNAME_KEY];
		self.chatHistory=[aDecoder decodeObjectForKey:CHATHISTORY_KEY];
	}
	return self;
}


@end
