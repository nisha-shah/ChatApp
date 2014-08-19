//
//  FirstViewController.h
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property(strong,nonatomic)NSMutableArray *userList;
@property(strong,nonatomic)NSMutableArray *chatList;
@property (weak, nonatomic) IBOutlet UITableView *activeChatTableView;

@end
