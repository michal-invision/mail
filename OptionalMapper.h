//
//  OptionalMapper.h
//  MailByInVision
//
//  Created by Michal Kalis on 23/03/16.
//  Copyright © 2016 Michal Kalis. All rights reserved.
//

#import "Mapper.h"

@interface OptionalMapper: NSObject <Mapper>

- (instancetype)initWithMapper:(id<Mapper>)mapper;

@end
