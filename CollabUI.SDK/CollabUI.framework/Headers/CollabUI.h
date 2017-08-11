#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CollabUI : NSObject {
    NSString* _apiKey;    
}

+ (CollabUI*)sharedInstance;

@property (readonly, getter=getApiKey) NSString* apiKey;

- (void)initializeWithApiKey:(NSString*)apiKey;

- (BOOL)openURL:(NSURL*)url;

- (NSString*)getApiKey;

@end
