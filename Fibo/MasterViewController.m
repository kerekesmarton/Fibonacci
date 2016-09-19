//
//  MasterViewController.m
//  Fibo
//
//  Created by Kerekes Jozsef-Marton on 19/09/16.
//  Copyright © 2016 mkerekes. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "FibonaciNumbers.h"

static NSInteger BATCH_SIZE = 10;               ///< Refresh size for tableview cell updates

@interface MasterViewController ()

@property(nonatomic,assign) NSInteger size;     ///< The actual size of the tableView

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.size = BATCH_SIZE;
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
       
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.size;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Calculate number corresponding to specific row.
    [FibonaciNumbers fibonaciNumber:indexPath.row completion:^(NSInteger value)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%ld %ld",(long)indexPath.row ,(unsigned long)value];
    }];
    
    if (indexPath.row == self.size - 1)
    {
        [self addNextBatch];
    }
    
    return cell;
}

/// Logic for increasing tableview size.
- (void)addNextBatch
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [self.tableView beginUpdates];
        
        NSMutableArray *indeces = [NSMutableArray arrayWithCapacity:BATCH_SIZE];
        for (NSInteger i = self.size; i < self.size + BATCH_SIZE; i ++) {
            [indeces addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        self.size += BATCH_SIZE;
        [self.tableView insertRowsAtIndexPaths:[indeces copy] withRowAnimation:UITableViewRowAnimationBottom];
        
        [self.tableView endUpdates];
    });
}


@end
