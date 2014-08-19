//
//  SecondViewController.h
//  ChatSolution
//
//  Created by Nisha on 8/4/14.
//  Copyright (c) 2014 Nisha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,                           UISearchBarDelegate,UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UITableView *usersTableView;
@property (strong, nonatomic)NSMutableArray *filteredUserList;
@property(strong,nonatomic)NSMutableArray *userList;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
