//
//  Mapper.h
//  MailByInVision
//
//  Created by Michal Kalis on 23/03/16.
//  Copyright © 2016 Michal Kalis. All rights reserved.
//

@import UIKit;

extern NSString *kIsNonFatalKey;

@protocol Mapper <NSObject>

- (id)objectFromSourceObject:(id)jsonObject error:(__autoreleasing NSError **)error;

@end
