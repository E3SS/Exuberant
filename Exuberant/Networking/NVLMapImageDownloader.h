//
//  NVLMapImageDownloader.h
//  Exuberant
//
//  Created by TJ Barber on 6/28/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVLMapImageDownloader : NSOperation

- (id)initWithMapId:(NSString *)mapId;
@property (strong, nonatomic) NSString *mapId;

@end
