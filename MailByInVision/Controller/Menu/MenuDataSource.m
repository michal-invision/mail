//
//  MenuDataSource.m
//  MailByInVision
//
//  Created by Michal Kalis on 17/03/16.
//  Copyright © 2016 Michal Kalis. All rights reserved.
//

#import "MenuDataSource.h"
#import "MenuTableViewCell.h"
#import "UITableViewCell+ReuseIdentifier.h"
#import "UITableViewHeaderFooterView+ReuseIdentifier.h"
#import "UIImage+TemplateImage.h"
#import "UIImageView+RoundedRectangle.h"
#import "UIColor+ApplicationSpecific.h"

@import UIKit;

@interface MenuDataSource ()

@property (nonatomic, strong) NSArray *demoGroupNames;
@property (nonatomic, strong) NSArray *demoMarkedNames;
@property (nonatomic, strong) NSArray *demoMarkedColors;
@property (nonatomic, strong) NSArray *mailboxNames;

@end

@implementation MenuDataSource

// Constants
const NSInteger NumberOfRowsInGroupsSection = 4;
const NSInteger NumberOfRowsInMarkedSection = 4;


#pragma mark - Initialization

- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self = [super init]) {
        tableView.dataSource = self;
    }
    
    return self;
}

- (NSArray *)demoGroupNames {
    if (_demoGroupNames != nil) {
        return _demoGroupNames;
    }
    
    _demoGroupNames = @[@"All mail", @"Spam", @"Project Foo", @"Project Bar"];
    
    return _demoGroupNames;
}

- (NSArray *)demoMarkedNames {
    if (_demoMarkedNames != nil) {
        return _demoMarkedNames;
    }
    
    _demoMarkedNames = @[@"Important", @"Do Later", @"Urgent", @"Work"];
    
    return _demoMarkedNames;
}

- (NSArray *)demoMarkedColors {
    if (_demoMarkedColors != nil) {
        return _demoMarkedColors;
    }
    
    _demoMarkedColors = @[[UIColor applicationMenuMarked1Color], [UIColor applicationMenuMarked2Color], [UIColor applicationMenuMarked3Color], [UIColor applicationMenuMarked4Color]];
    
    return _demoMarkedColors;
}

- (NSArray *)mailboxNames {
    if (_mailboxNames != nil) {
        return _mailboxNames;
    }
    
    _mailboxNames = @[@"Inbox", @"Sent", @"Pinned", @"Drafts", @"Trash"];
    
    return _mailboxNames;
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return MenuTableSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case MenuTableSectionMailboxes:
            return TableSectionMailboxesCount;
        case MenuTableSectionGroups:
            return NumberOfRowsInGroupsSection;
        case MenuTableSectionMarked:
            return NumberOfRowsInMarkedSection;
            
        default:
            break;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MenuTableViewCell automaticReuseIdentifier] forIndexPath:indexPath];
    
    // Show separator line only for second cell in *GROUPS* section
    if (indexPath.section == MenuTableSectionGroups && indexPath.row == 1) {
        cell.separatorLine.hidden = NO;
    }
    else {
        cell.separatorLine.hidden = YES;
    }
    
    cell.separatorLine.backgroundColor = [UIColor applicationMenuSectionColor];
    
    switch (indexPath.section) {
        case MenuTableSectionMailboxes: {
            // Mailboxes section
            NSString *name = self.mailboxNames[indexPath.row];
            cell.titleLabel.text = name;
            cell.iconImageView.image = [UIImage templateImageWithName:[NSString stringWithFormat:@"menu-%@-icon", [name lowercaseString]]];
            break;
        }
        case MenuTableSectionGroups: {
            // Groups section
            cell.titleLabel.text = self.demoGroupNames[indexPath.row];
            cell.iconImageView.image = [UIImage templateImageWithName:@"menu-group-icon"];
            break;
        }
        case MenuTableSectionMarked: {
            // Marked section
            cell.titleLabel.text = self.demoMarkedNames[indexPath.row];
            cell.iconImageView.image = [cell.iconImageView roundedRectangleImageWithColor:self.demoMarkedColors[indexPath.row]];
            break;
        }
            
        default:
            break;
    }
    
    return cell;
}

@end
