//
//  User.h
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>

@property(strong,nonatomic)NSString *userName;
@property(strong,nonatomic)NSString *profilePictureName;
@property(strong,nonatomic)NSMutableArray *chatHistory;

- (id)initWithName:(NSString*)name AndPicName: (NSString*) picName;


@end
