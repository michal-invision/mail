//
//  UITableViewCell+ReuseIdentifier.m
//  MailByInVision
//
//  Created by Michal Kalis on 17/03/16.
//  Copyright © 2016 Michal Kalis. All rights reserved.
//

#import "UITableViewCell+ReuseIdentifier.h"

@implementation UITableViewCell (ReuseIdentifier)

+ (NSString *)automaticReuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
