//
//  DataBaseManager.h
//  Hotel
//
//  Created by Михаил on 24.01.2022.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataBaseManager : NSObject

+ (DataBaseManager*) sharedManager;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

 - (NSURL *)applicationDocumentsDirectory;
- (void)saveAllHotels:(NSArray*) hotels;
- (NSArray*)getAllHotels;

@end

NS_ASSUME_NONNULL_END
