//
//  SOOwner.h
//
//  Created by John Clem on 6/29/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Owner : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double acceptRate;
@property (nonatomic, strong) NSString *userType;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, assign) double userId;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, assign) double reputation;
@property (nonatomic, strong) NSString *profileImage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
