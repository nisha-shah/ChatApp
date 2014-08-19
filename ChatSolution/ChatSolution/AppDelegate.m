//
//  AppDelegate.m
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha Shah. All rights reserved.
//

#import "AppDelegate.h"
#import "User.h"
static NSString* const FILENAME= @"Documents/NishaShah.plist";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.userList = [self loadDataFromDisk];
    
    if(_userList!=nil){
         NSLog(@"Data received");
	}else{
        NSLog(@"No previous data");
        _userList = [[NSMutableArray alloc]init];
        User *u1=[[User alloc]initWithName:@"Nisha" AndPicName:@"1.jpg"];
        User *u2=[[User alloc]initWithName:@"Swati" AndPicName:@"2.jpg"];
        User *u3=[[User alloc]initWithName:@"Hardik" AndPicName:@"3.jpg"];
        [_userList addObject:u1];
        [_userList addObject:u2];
        [_userList addObject:u3];
    }
    
    self.mainTab =[[UITabBarController alloc]init];
    
    FirstViewController *firstViewController = [[FirstViewController alloc]init];
    firstViewController.title = @"Chats";
    [[firstViewController tabBarItem] setImage:[[UIImage imageNamed:@"chat_icon.gif"]              imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    SecondViewController *secondViewController = [[SecondViewController alloc]init];
    secondViewController.title = @"Users";
    [[secondViewController tabBarItem] setImage:[[UIImage imageNamed:@"users-icon-small.gif"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UINavigationController *nav1= [[UINavigationController alloc]initWithRootViewController:firstViewController];
    UINavigationController *nav2= [[UINavigationController alloc]initWithRootViewController:secondViewController];
    
    self.tabsArray =[[NSArray alloc]initWithObjects:nav1,nav2,nil];
    self.mainTab.viewControllers = self.tabsArray;
    self.window.rootViewController = self.mainTab;
    
    [self.window addSubview:self.mainTab.view];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self saveDataToDisk];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self saveDataToDisk];
}

- (NSMutableArray*)loadDataFromDisk
{
    NSLog(@"load from disk called");
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:FILENAME];
    self.userList =[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return self.userList;
}

- (void)saveDataToDisk
{
    NSLog(@"save to disk called");
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:FILENAME];
    [NSKeyedArchiver archiveRootObject:self.userList toFile: path];
}

@end
