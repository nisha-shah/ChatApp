//
//  SecondViewController.m
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
#import "User.h"
#import "ChatViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    _userList=[(AppDelegate*)[[UIApplication sharedApplication] delegate] userList];
    self.filteredUserList = [NSMutableArray arrayWithCapacity:[_userList count]];
    UIBarButtonItem *addButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd     target:self action:@selector(addNewUser:)];
    self.navigationItem.rightBarButtonItem= addButton;
    
}

- (void) addNewUser:(id) sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Add New User"
                                                    message:@"Enter user name"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Add User", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Button index is %d",buttonIndex);
    if(buttonIndex == 0){
        return;
    }
    NSString *newName = [[alertView textFieldAtIndex:0] text] ;
    if ([newName isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cannot create User"
                                                        message:@"User name cannot be empty."
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    for (User *u in _userList)
    {
        if ([u.userName isEqualToString:newName])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cannot create User"
                                                            message:@"User with same name exists."
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
            [alert show];
            return;
        }
    }
    
    User *newUser = [[User alloc]initWithName:newName AndPicName:@"5.jpg"];
    [_userList addObject:newUser];
    [self.usersTableView reloadData];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"User successfully Created"
                                                    message:@""
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [self.filteredUserList count];
    }else{
        return [self.userList count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    User *u = nil;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        u = [self.filteredUserList objectAtIndex:indexPath.row];
    }else{
        u = [self.userList objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = u.userName;
    cell.imageView.image = [UIImage imageNamed:u.profilePictureName];
    return cell;
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredUserList removeAllObjects];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.userName contains[c] %@",searchText];
    self.filteredUserList = [NSMutableArray arrayWithArray:[_userList filteredArrayUsingPredicate:predicate]];
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
    [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    return YES;
}


#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    User *user=nil;
    ChatViewController *chatVC = [[ChatViewController alloc]init];
    if (tableView == self.searchDisplayController.searchResultsTableView){
        user = [self.filteredUserList objectAtIndex:indexPath.row];
    }else{
        user=[self.userList objectAtIndex:indexPath.row];
    }
    chatVC.user = user;
    [self.navigationController pushViewController:chatVC animated:YES];
}

@end
