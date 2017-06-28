//
//  NVLPendingOperations.h
//  Exuberant
//
//  Created by TJ Barber on 6/28/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVLPendingOperations : NSObject

@property (strong, nonatomic) NSMutableDictionary *downloadsInProgress;
@property (strong, nonatomic) NSOperationQueue *downloadOperations;

@end
