//
//  ChatViewController.m
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha. All rights reserved.
//

#import "ChatViewController.h"
#import "User.h"
#import "Chat.h"

@interface ChatViewController ()

@property (strong, nonatomic) IBOutlet UITableView *chatTableView;

@end

@implementation ChatViewController

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
    NSString *formattedTitle = [NSString stringWithFormat:@"Chat with %@", self.user.userName];
    self.title = formattedTitle;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                         selector:@selector(receivedNotification:)
                                          name:@"Message Sent"
                                          object:nil];
}

- (void)receivedNotification:(NSNotification *) notification {
    if ([[notification name] isEqualToString:@"Message Sent"])
    {
        NSString *receivedMessage = notification.object;
        /* UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Message Received"
                                                            message:receivedMessage delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
        [alertView show];*/
        NSString *formattedString = [NSString stringWithFormat:@"Echo : %@",receivedMessage];
        Chat* chat = [[Chat alloc]initWithMessage:formattedString];
        [self.user.chatHistory addObject:chat];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)sendButtonPressed:(id)sender {
    [self.messageText resignFirstResponder];
    if (![self.messageText.text isEqualToString:@""])
    {
        Chat* chat = [[Chat alloc]initWithMessage:self.messageText.text];
        [self.user.chatHistory addObject:chat];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Message Sent"
                                                        object:[self.messageText text]];
        [_chatTableView reloadData];
        self.messageText.text = @"";
    }
    
 }


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ([[self.user chatHistory] count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.user.chatHistory[indexPath.row] message];
    if (indexPath.row % 2 == 1)
    {
        cell.textLabel.textAlignment = NSTextAlignmentRight;
    }
    return cell;
}

#pragma mark - UITextField Delegate method implementation

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

@end
