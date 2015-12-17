//
//  ZTTableViewCell.m
//  Pods
//
//  Created by 马成林 on 15/8/19.
//
//

#import "ZTTableViewCell.h"

@implementation ZTTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString *)nibName{
    return nil;
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object{
    return 44.0f;
}

+ (NSString *)cellIdentifier{
    return nil;
}

- (void)setItem:(id)item{
    
}

- (void)prepareForReuse {
    self.item = nil;
    [super prepareForReuse];
}
@end
