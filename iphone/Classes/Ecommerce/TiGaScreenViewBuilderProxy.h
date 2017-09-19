/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiProxy.h"
#import "GAIDictionaryBuilder.h"

@interface TiGaScreenViewBuilderProxy : TiProxy {

}

@property (nonatomic, retain) GAIDictionaryBuilder* dictionary;

- (void)addProduct:(id)arg;
- (void)addProductAction:(id)arg;
- (void)addPromotion:(id)arg;
- (void)addImpression:(id)arg;

- (GAIDictionaryBuilder*)native;

@end
