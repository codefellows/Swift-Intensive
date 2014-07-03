//
//  SOOwner.m
//
//  Created by John Clem on 6/29/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Owner.h"


NSString *const kSOOwnerAcceptRate = @"accept_rate";
NSString *const kSOOwnerUserType = @"user_type";
NSString *const kSOOwnerLink = @"link";
NSString *const kSOOwnerUserId = @"user_id";
NSString *const kSOOwnerDisplayName = @"display_name";
NSString *const kSOOwnerReputation = @"reputation";
NSString *const kSOOwnerProfileImage = @"profile_image";


@interface Owner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Owner

@synthesize acceptRate = _acceptRate;
@synthesize userType = _userType;
@synthesize link = _link;
@synthesize userId = _userId;
@synthesize displayName = _displayName;
@synthesize reputation = _reputation;
@synthesize profileImage = _profileImage;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.acceptRate = [[self objectOrNilForKey:kSOOwnerAcceptRate fromDictionary:dict] doubleValue];
            self.userType = [self objectOrNilForKey:kSOOwnerUserType fromDictionary:dict];
            self.link = [self objectOrNilForKey:kSOOwnerLink fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kSOOwnerUserId fromDictionary:dict] doubleValue];
            self.displayName = [self objectOrNilForKey:kSOOwnerDisplayName fromDictionary:dict];
            self.reputation = [[self objectOrNilForKey:kSOOwnerReputation fromDictionary:dict] doubleValue];
            self.profileImage = [self objectOrNilForKey:kSOOwnerProfileImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.acceptRate] forKey:kSOOwnerAcceptRate];
    [mutableDict setValue:self.userType forKey:kSOOwnerUserType];
    [mutableDict setValue:self.link forKey:kSOOwnerLink];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kSOOwnerUserId];
    [mutableDict setValue:self.displayName forKey:kSOOwnerDisplayName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reputation] forKey:kSOOwnerReputation];
    [mutableDict setValue:self.profileImage forKey:kSOOwnerProfileImage];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.acceptRate = [aDecoder decodeDoubleForKey:kSOOwnerAcceptRate];
    self.userType = [aDecoder decodeObjectForKey:kSOOwnerUserType];
    self.link = [aDecoder decodeObjectForKey:kSOOwnerLink];
    self.userId = [aDecoder decodeDoubleForKey:kSOOwnerUserId];
    self.displayName = [aDecoder decodeObjectForKey:kSOOwnerDisplayName];
    self.reputation = [aDecoder decodeDoubleForKey:kSOOwnerReputation];
    self.profileImage = [aDecoder decodeObjectForKey:kSOOwnerProfileImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_acceptRate forKey:kSOOwnerAcceptRate];
    [aCoder encodeObject:_userType forKey:kSOOwnerUserType];
    [aCoder encodeObject:_link forKey:kSOOwnerLink];
    [aCoder encodeDouble:_userId forKey:kSOOwnerUserId];
    [aCoder encodeObject:_displayName forKey:kSOOwnerDisplayName];
    [aCoder encodeDouble:_reputation forKey:kSOOwnerReputation];
    [aCoder encodeObject:_profileImage forKey:kSOOwnerProfileImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    Owner *copy = [[Owner alloc] init];
    
    if (copy) {

        copy.acceptRate = self.acceptRate;
        copy.userType = [self.userType copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.userId = self.userId;
        copy.displayName = [self.displayName copyWithZone:zone];
        copy.reputation = self.reputation;
        copy.profileImage = [self.profileImage copyWithZone:zone];
    }
    
    return copy;
}


@end
