//
//  BBCNewsMappingModel.m
//  BBCNewsApi
//
//  Created by Alexander Gvardian on 06.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import "BBCNewsMappingModel.h"

@implementation BBCNewsMappingModel


+ (FEMMapping*)defaultMapping {
    
    FEMMapping* mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];
    
    [mapping addAttributeWithProperty:@"authorModel" keyPath:@"author"];
    [mapping addAttributeWithProperty:@"titleModel" keyPath:@"title"];
    [mapping addAttributeWithProperty:@"descriptionModel" keyPath:@"description"];
    [mapping addAttributeWithProperty:@"urlModel" keyPath:@"url"];
    [mapping addAttributeWithProperty:@"urlToImageModel" keyPath:@"urlToImage"];
    [mapping addAttributeWithProperty:@"publishedAtModel" keyPath:@"publishedAt"];
    
    
    
    return mapping;
}
@end
