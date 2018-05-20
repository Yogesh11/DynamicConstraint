    //
//  ViewController.m
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "ViewController.h"
#import "ApiManager.h"
#import "DataManager.h"
#import "Error.h"
#import "Row.h"
#import "FeedCell.h"
#import <SVProgressHUD.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView      *tableLayout   ;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation ViewController
@synthesize tableLayout;
@synthesize refreshControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareUI];
    [self callApi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareUI{
    tableLayout = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableLayout.delegate    = self;
    tableLayout.dataSource  = self;
    tableLayout.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    tableLayout.rowHeight        = UITableViewAutomaticDimension;
    tableLayout.separatorStyle   = UITableViewCellSeparatorStyleNone;
    tableLayout.backgroundColor  = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    tableLayout.tableFooterView  = [[UIView alloc] initWithFrame:CGRectZero];
    [[self view] addSubview:tableLayout];
    [self addRefreshView];
}

-(void)addRefreshView{
    refreshControl = [[UIRefreshControl alloc]init];
    [tableLayout addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
}

-(void)refreshTable{
    [refreshControl endRefreshing];
    [self callApi];
}

-(void)updateUI{
    [tableLayout reloadData];
    self.navigationItem.title = [[DataManager sharedInstance] currentFeed].title;
}

-(void)callApi {
    [SVProgressHUD show];
    [[ApiManager sharedInstance] jsonFeed:^(NSDictionary *response, Error *error) {
        if (error) {
            [self showAlert:error];
        } else{
            [self updateUI];
        }
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - AlertSpecific function
-(void)showAlert: (Error *) error{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:error.title message:error.message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertView show];
}

#pragma mark TableView Delegate And DataSourceSpecific functions
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [[[[DataManager sharedInstance] currentFeed] rows] count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[FeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
     Row *row = [[[[DataManager sharedInstance] currentFeed] rows] objectAtIndex:indexPath.row];
    [cell updateFeed:row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell ;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     Row *row = [[[[DataManager sharedInstance] currentFeed] rows] objectAtIndex:indexPath.row];
    if ([row isAValidObject] == false) {
        return 0;
    }
    return UITableViewAutomaticDimension;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
