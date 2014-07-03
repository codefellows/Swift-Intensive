//
//  MasterViewController.m
//  SOClient
//
//  Created by John Clem on 6/29/14.
//  Copyright (c) 2014 Learn Swift. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "DataModels.h"

@interface MasterViewController ()
            
@property NSMutableArray *questions;

@end

@implementation MasterViewController
            
- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(loadSeedData)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadSeedData {
    if (!self.questions) {
        self.questions = [[NSMutableArray alloc] init];
    }
    NSError *error;
    NSData *json = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SampleData" ofType:@"json"]];
    NSDictionary *jsonParsed = [NSJSONSerialization JSONObjectWithData:json
                                                               options:NSJSONReadingMutableContainers
                                                                 error:&error];
    NSMutableArray *tempQuestions = jsonParsed[@"items"];
    for (NSDictionary *qJSON in tempQuestions) {
        Question *question = [Question modelObjectWithDictionary:qJSON];
        [self.questions addObject:question];
    }
    
    [self.tableView reloadData];
}

- (void)insertNewObject:(id)sender {
    if (!self.questions) {
        self.questions = [[NSMutableArray alloc] init];
    }
    [self.questions insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Question *question = self.questions[indexPath.row];
        [(DetailViewController *)[[segue destinationViewController] topViewController] setQuestion:question];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Question *question = self.questions[indexPath.row];
    cell.textLabel.text = question.title;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.questions removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        Question *object = self.questions[indexPath.row];
        self.detailViewController.question = object;
    }
}

@end
