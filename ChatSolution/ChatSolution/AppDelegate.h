//
//  AppDelegate.h
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property(strong,nonatomic)UITabBarController *mainTab;
@property(strong,nonatomic)NSArray *tabsArray;
@property (strong,nonatomic)NSMutableArray *userList;

- (NSMutableArray*)loadDataFromDisk;
- (void)saveDataToDisk;


@end
