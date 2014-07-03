//
//  SOBaseClass.m
//
//  Created by John Clem on 6/29/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "SOBaseClass.h"
#import "Question.h"


NSString *const kSOBaseClassHasMore = @"has_more";
NSString *const kSOBaseClassItems = @"items";
NSString *const kSOBaseClassQuotaMax = @"quota_max";
NSString *const kSOBaseClassQuotaRemaining = @"quota_remaining";


@interface SOBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SOBaseClass

@synthesize hasMore = _hasMore;
@synthesize items = _items;
@synthesize quotaMax = _quotaMax;
@synthesize quotaRemaining = _quotaRemaining;


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
            self.hasMore = [[self objectOrNilForKey:kSOBaseClassHasMore fromDictionary:dict] boolValue];
    NSObject *receivedSOItems = [dict objectForKey:kSOBaseClassItems];
    NSMutableArray *parsedSOItems = [NSMutableArray array];
    if ([receivedSOItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSOItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSOItems addObject:[Question modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSOItems isKindOfClass:[NSDictionary class]]) {
       [parsedSOItems addObject:[Question modelObjectWithDictionary:(NSDictionary *)receivedSOItems]];
    }

    self.items = [NSArray arrayWithArray:parsedSOItems];
            self.quotaMax = [[self objectOrNilForKey:kSOBaseClassQuotaMax fromDictionary:dict] doubleValue];
            self.quotaRemaining = [[self objectOrNilForKey:kSOBaseClassQuotaRemaining fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kSOBaseClassHasMore];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kSOBaseClassItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quotaMax] forKey:kSOBaseClassQuotaMax];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quotaRemaining] forKey:kSOBaseClassQuotaRemaining];

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

    self.hasMore = [aDecoder decodeBoolForKey:kSOBaseClassHasMore];
    self.items = [aDecoder decodeObjectForKey:kSOBaseClassItems];
    self.quotaMax = [aDecoder decodeDoubleForKey:kSOBaseClassQuotaMax];
    self.quotaRemaining = [aDecoder decodeDoubleForKey:kSOBaseClassQuotaRemaining];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasMore forKey:kSOBaseClassHasMore];
    [aCoder encodeObject:_items forKey:kSOBaseClassItems];
    [aCoder encodeDouble:_quotaMax forKey:kSOBaseClassQuotaMax];
    [aCoder encodeDouble:_quotaRemaining forKey:kSOBaseClassQuotaRemaining];
}

- (id)copyWithZone:(NSZone *)zone
{
    SOBaseClass *copy = [[SOBaseClass alloc] init];
    
    if (copy) {

        copy.hasMore = self.hasMore;
        copy.items = [self.items copyWithZone:zone];
        copy.quotaMax = self.quotaMax;
        copy.quotaRemaining = self.quotaRemaining;
    }
    
    return copy;
}


@end
