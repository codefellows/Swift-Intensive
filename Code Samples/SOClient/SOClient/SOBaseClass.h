//
//  SOBaseClass.h
//
//  Created by John Clem on 6/29/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SOBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) double quotaMax;
@property (nonatomic, assign) double quotaRemaining;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
