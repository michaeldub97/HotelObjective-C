//
//  ServerMeneger.h
//  Hotel
//
//  Created by Михаил on 17.12.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServerManager : NSObject

+ (ServerManager*) sharedManager;


- (void) getHotelListOnSuccess:(void(^)(NSArray* friends)) success
                     onFailure:(void(^)(NSError* error)) failure;



@end

NS_ASSUME_NONNULL_END
