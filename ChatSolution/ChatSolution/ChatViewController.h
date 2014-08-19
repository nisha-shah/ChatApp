//
//  ChatViewController.h
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ChatViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) IBOutlet UITextField *messageText;
- (IBAction)sendButtonPressed:(id)sender;

@end
