//
//  DataBaseManager.m
//  Hotel
//
//  Created by Михаил on 24.01.2022.
//

#import "DataBaseManager.h"
#import <CoreData/CoreData.h>
#import "ModelHotel.h"
#import "Hotel.h"

@implementation DataBaseManager

+ (DataBaseManager*) sharedManager {
    
    static DataBaseManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DataBaseManager alloc] init];
    });
    
    return manager;
}

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (ModelHotel*)createEntityFrom: (Hotel*) hotel {
    ModelHotel* entity = [NSEntityDescription insertNewObjectForEntityForName:@"ModelHotel" inManagedObjectContext:self.managedObjectContext];
    
    
    entity.lastName = hotel.lastName;
    entity.hotelAddress = hotel.hotelAddress;
    entity.descriptionHotel = hotel.descriptionHotel;
    entity.phoneNumber = hotel.phoneNumber;
    entity.starsNumber = hotel.starsNumber;
    entity.imageURL = hotel.imageURL.absoluteString;
    
    return entity;
}

- (Hotel*)createHotelFrom: (ModelHotel*) entity {
    Hotel* hotel =  [Hotel new];
    hotel.lastName = entity.lastName;
    hotel.hotelAddress = entity.hotelAddress;
    hotel.descriptionHotel = entity.descriptionHotel;
    hotel.phoneNumber = entity.phoneNumber;
    hotel.starsNumber = entity.starsNumber;
    hotel.imageURL =  [[NSURL alloc] initWithString:entity.imageURL];
    return hotel;
}

- (void)saveAllHotels:(NSArray*) hotels{
    for (Hotel* hotel in hotels){
        [self save:hotel];
    }
}

- (void)save: (Hotel*) hotel {
    NSError* error = nil;
    [self createEntityFrom:hotel];
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
}

- (NSArray*)getAllHotels {
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description =
    [NSEntityDescription entityForName:@"ModelHotel"
                inManagedObjectContext:self.managedObjectContext];
    
    [request setEntity:description];
    
    NSError* requestError = nil;
    NSArray* resultArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
    if (requestError) {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    NSMutableArray* result = [NSMutableArray new];
    for (ModelHotel* object in resultArray) {
        Hotel* newHotel = [self createHotelFrom:object];
        [result addObject:newHotel];
    }
    return result;
}

- (void)saveContext{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (NSManagedObjectContext *)managedObjectContext{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }

    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"HotelModel" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }

    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"TestSection.sqlite"];

    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {

        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    return _persistentStoreCoordinator;
}

 #pragma mark - Application's Documents directory

- (NSURL *)applicationDocumentsDirectory{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
