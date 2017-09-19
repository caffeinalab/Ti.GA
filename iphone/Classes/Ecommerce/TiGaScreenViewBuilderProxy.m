/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiGaScreenViewBuilderProxy.h"
#import "TiGaProductProxy.h"
#import "TiGaProductActionProxy.h"
#import "TiGaPromotionProxy.h"

@implementation TiGaScreenViewBuilderProxy

- (id)init
{
    _dictionary = [[GAIDictionaryBuilder alloc] init];
    
    return [super init];
}

#pragma mark Public APIs

- (void)addProduct:(id)arg
{
    ENSURE_UI_THREAD(addProduct, arg);
    ENSURE_ARG_COUNT(arg, 1);
    ENSURE_TYPE(arg, TiGaProductProxy);
    
    TiGaProductProxy* productProxy = arg;
    
    [_dictionary addProduct:productProxy.product];
}

- (void)addProductAction:(id)arg
{
    ENSURE_UI_THREAD(addProductAction, arg);
    ENSURE_ARG_COUNT(arg, 1);
    ENSURE_TYPE(arg, TiGaProductActionProxy);
    
    TiGaProductActionProxy* productActionProxy = arg;
    
    [_dictionary setProductAction:productActionProxy.productAction];
}

- (void)addPromotion:(id)arg
{
    ENSURE_UI_THREAD(addPromotion, arg);
    ENSURE_ARG_COUNT(arg, 1);
    ENSURE_TYPE(arg, TiGaPromotionProxy);
    
    TiGaPromotionProxy* promotionProxy = arg;
    
    [_dictionary addPromotion:promotionProxy.promotion];
}

- (void)addImpression:(id)arg
{
    ENSURE_UI_THREAD(addImpression, arg);
    ENSURE_ARG_COUNT(arg, 3);
    
    TiGaProductProxy* productProxy;
    NSString* impressionList;
    NSString* impressionSource;
    
    ENSURE_ARG_AT_INDEX(productProxy, arg, 0, TiGaProductProxy);
    ENSURE_ARG_AT_INDEX(impressionList, arg, 1, NSString);
    ENSURE_ARG_AT_INDEX(impressionSource, arg, 2, NSString);
    
    [_dictionary addProductImpression:productProxy.product impressionList:impressionList impressionSource:impressionSource];
}

#pragma mark Internals

- (GAIDictionaryBuilder*)native
{
    return _dictionary;
}

- (void)log:(NSString*)string forLevel:(NSString*)level
{
    NSLog(@"[%@] %@: %@", [level uppercaseString], NSStringFromClass([self class]), string);
}

@end
