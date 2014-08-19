//
//  FirstViewController.m
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "User.h"
#import "ChatViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.chatList = [[NSMutableArray alloc]init];
    self.userList = [(AppDelegate*)[[UIApplication sharedApplication] delegate] userList];
    for (User* u in _userList)
    {
        if ([u.chatHistory count] != 0)
        {
            [self.chatList addObject:u];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    self.chatList = [[NSMutableArray alloc]init];
    for (User* u in _userList)
    {
        if ([u.chatHistory count] != 0)
        {
            [_chatList addObject:u];
        }
    }
    [self.activeChatTableView reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.chatList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle                                                                           reuseIdentifier:@"MyIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    User *u = [self.chatList objectAtIndex:indexPath.row];
    cell.textLabel.text = u.userName;
    cell.detailTextLabel.text = [[u.chatHistory lastObject] message];
    cell.imageView.image = [UIImage imageNamed:u.profilePictureName];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatViewController *chatVC = [[ChatViewController alloc]init];
    chatVC.user = [self.chatList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:chatVC animated:YES];
}


@end
