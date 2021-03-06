//
//  DetailViewController.m
//  SOClient
//
//  Created by John Clem on 6/29/14.
//  Copyright (c) 2014 Learn Swift. All rights reserved.
//

#import "DetailViewController.h"
#import "DataModels.h"

@interface DetailViewController ()
            
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@end

@implementation DetailViewController
            
#pragma mark - Managing the detail item

- (void)setQuestion:(Question *)question {
    if (_question != question) {
        _question = question;
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.question) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_question.link]];
        [self.webView loadRequest:request];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
    return YES;
}

@end
