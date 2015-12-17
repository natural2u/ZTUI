//
//  ZTScrollPageTopBar.m
//
//  Created by MaPengzhen on 15-8-18.
//  Copyright (c) 2015年 MaPengzhen. All rights reserved.
//

#import "ZTScrollPageTopBarCell.h"
#import "ZTScrollPageTopBar.h"

@implementation ZTScrollPageTopBarCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        double dRotation = (M_PI / 180.0) * 90.0f;
        CGFloat fRotation = (CGFloat) dRotation;
        CGAffineTransform transform = CGAffineTransformMakeRotation(fRotation);

        CGRect rect = self.contentView.frame;
        self.contentView.transform = transform;
        self.contentView.frame = rect;

        UIView *bgView = [[UIView alloc] initWithFrame:
                CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        self.selectedBackgroundView = bgView;
        self.selectedBackgroundView.transform = transform;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setObject:(NSObject *)obj {
    if (_item) {
        //CL_RELEASE_SAFELY(_item);
        _item = nil;
    }
    _item = obj;//[obj retain];
}

- (void)dealloc {

}

+ (CGFloat)pageTopBar:(UITableView *)pageTopBar columnWidthForObject:(id)object {
    return 60;
}
@end
