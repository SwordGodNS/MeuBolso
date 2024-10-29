// Autogenerated from Pigeon (v22.6.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "Pigeon.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray<id> *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static id GetNullableObjectAtIndex(NSArray<id> *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface UserDetails ()
+ (UserDetails *)fromList:(NSArray<id> *)list;
+ (nullable UserDetails *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@implementation UserDetails
+ (instancetype)makeWithName:(nullable NSString *)name
    email:(nullable NSString *)email {
  UserDetails* pigeonResult = [[UserDetails alloc] init];
  pigeonResult.name = name;
  pigeonResult.email = email;
  return pigeonResult;
}
+ (UserDetails *)fromList:(NSArray<id> *)list {
  UserDetails *pigeonResult = [[UserDetails alloc] init];
  pigeonResult.name = GetNullableObjectAtIndex(list, 0);
  pigeonResult.email = GetNullableObjectAtIndex(list, 1);
  return pigeonResult;
}
+ (nullable UserDetails *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [UserDetails fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.name ?: [NSNull null],
    self.email ?: [NSNull null],
  ];
}
@end

@interface nullPigeonPigeonCodecReader : FlutterStandardReader
@end
@implementation nullPigeonPigeonCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 129: 
      return [UserDetails fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface nullPigeonPigeonCodecWriter : FlutterStandardWriter
@end
@implementation nullPigeonPigeonCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[UserDetails class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface nullPigeonPigeonCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation nullPigeonPigeonCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[nullPigeonPigeonCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[nullPigeonPigeonCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *nullGetPigeonCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    nullPigeonPigeonCodecReaderWriter *readerWriter = [[nullPigeonPigeonCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}
void SetUpUserApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<UserApi> *api) {
  SetUpUserApiWithSuffix(binaryMessenger, api, @"");
}

void SetUpUserApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<UserApi> *api, NSString *messageChannelSuffix) {
  messageChannelSuffix = messageChannelSuffix.length > 0 ? [NSString stringWithFormat: @".%@", messageChannelSuffix] : @"";
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.meubolso.UserApi.getUserDetails", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:nullGetPigeonCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getUserDetailsWithError:)], @"UserApi api (%@) doesn't respond to @selector(getUserDetailsWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        UserDetails *output = [api getUserDetailsWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
