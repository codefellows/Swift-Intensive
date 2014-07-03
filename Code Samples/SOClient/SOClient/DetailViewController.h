//
//  DetailViewController.h
//  SOClient
//
//  Created by John Clem on 6/29/14.
//  Copyright (c) 2014 Learn Swift. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) Question *question;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

