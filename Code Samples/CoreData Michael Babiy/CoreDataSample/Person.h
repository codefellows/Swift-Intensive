//
//  Person.h
//  CoreDataSample
//
//  Created by Michael Babiy on 6/28/14.
//  Copyright (c) 2014 Michael Babiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * email;

@end
