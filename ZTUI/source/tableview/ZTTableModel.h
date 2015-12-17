//
//  ZTTableModel.h
//  Pods
//
//  Created by 马成林 on 15/8/19.
//
//

#import "ZTBaseModel.h"
#import <ZTCore/ZTError.h>

@interface ZTTableModel : ZTBaseModel
/**
 *  items[i] tableViewCell对应的数据
 */
@property (nonatomic,strong) NSMutableArray *items;

/**
 *  列表当前页数
 */
@property (nonatomic,assign) int currentPageNumber;

/**
 *  加载列表数据，子类重写
 *
 *  @param params     请求参数，参数相关逻辑最好在model中实现
 *  @param completion 请求完成执行的block
 */
- (void)loadItems:(NSDictionary *)params completion:(ZT_COMPLETION_BLOCK)completion;
@end
