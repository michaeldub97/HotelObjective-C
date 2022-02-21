//
//  ServerMeneger.m
//  Hotel
//
//  Created by Михаил on 17.12.2021.
//

#import "ServerManager.h"
#import <AFNetworking/AFNetworking.h>
#import "Hotel.h"

@interface ServerManager ()

@property (strong, nonatomic) AFHTTPSessionManager* sessionManager;
@end


@implementation ServerManager : NSObject


+ (ServerManager*) sharedManager {
    
    static ServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ServerManager alloc] init];
    });
    
    return manager;
}

- (id)init
{
    self = [super init];
    if (self) {
        
        NSURL* url = [NSURL URLWithString:@"https://raw.githubusercontent.com/Sinweaver/HotelsJson/master/"];
        
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
        self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}


- (void) getHotelListOnSuccess:(void(^)(NSArray* hotels)) success
                    onFailure:(void(^)(NSError* error)) failure {

    [self.sessionManager
     GET:@"hotelsList.json"
     parameters:nil
     headers: nil
     progress:nil
     success:^(NSURLSessionTask *operation, NSData* responseObject) {

        NSError *jsonError;
        NSArray* dictsArray = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&jsonError];
        
        NSMutableArray* objectsArray = [NSMutableArray array];

        for (NSDictionary* dict in dictsArray) {
             Hotel* hotel = [[Hotel alloc] initWithServerResponse:dict];
             [objectsArray addObject:hotel];
         }

         if (success) {
             success(objectsArray);
         }

    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);

        if (failure) {
            failure(error);
        }
    }];
    
}


@end
