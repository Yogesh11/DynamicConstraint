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


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableLayout;
@end

@implementation ViewController
@synthesize tableLayout;

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
    [[self view] addSubview:tableLayout];
}

-(void)updateUI{

}

-(void)callApi {
    [[ApiManager sharedInstance] jsonFeed:^(NSDictionary *response, Error *error) {
        if (error) {
            [self showAlert:error];
        } else{

        }
    }];
}

#pragma mark - AlertSpecific function
-(void)showAlert: (Error *) error{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:error.title message:error.message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [[self view] addSubview:alertView];
}

#pragma mark TableView Delegate And DataSourceSpecific functions
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [[[[DataManager sharedInstance] currentFeed] rows] count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  nil ;
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
