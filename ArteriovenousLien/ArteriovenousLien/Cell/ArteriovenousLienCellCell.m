//
//  ArteriovenousLienCellCell.m
//  ArteriovenousLien
//
//  Created by wangwenjie on 2017/3/7.
//  Copyright © 2017年 Roo. All rights reserved.
//

#import "ArteriovenousLienCellCell.h"
#import "Masonry.h"


@interface ArteriovenousLienCellCell()<IQDropDownTextFieldDelegate>

@property (weak, nonatomic) IBOutlet IQDropDownTextField *TefALItem;
@property (weak, nonatomic) IBOutlet UIView *viwItems;
//穿刺部位
@property (nonatomic, strong) UILabel *labParacentesis;
@property (nonatomic, strong) UITextField *tefParacentesis;
@property (nonatomic, assign) CGFloat heightParacentesis;
//日期
@property (nonatomic, strong) UILabel *labDate;
@property (nonatomic, strong) IQDropDownTextField *tefDate;
@property (nonatomic, assign) CGFloat heightDate;
//型号
@property (nonatomic, strong) UILabel *labMark;
@property (nonatomic, strong) UITextField *tefMark;
@property (nonatomic, assign) CGFloat heightMark;
//置入长度
@property (nonatomic, strong) UILabel *LabInsideLength;
@property (nonatomic, strong) UITextField *tefInsideLength;
@property (nonatomic, assign) CGFloat heightInsideLength;
@property (nonatomic, assign) CGFloat topInsideLength;
//臂围
@property (nonatomic, strong) UILabel *LabArmGirth;
@property (nonatomic, strong) UITextField *tefArmGirth;
@property (nonatomic, assign) CGFloat heightArmGirth;
@property (nonatomic, assign) CGFloat topArmGirth;
//外露长度
@property (nonatomic, strong) UILabel *labLeakageLength;
@property (nonatomic, strong) UITextField *tefLeakageLength;
@property (nonatomic, assign) CGFloat heightLeakageLength;
@property (nonatomic, assign) CGFloat topLeakageLength;
//其他补充
@property (nonatomic, strong) UILabel *labOtherSupplement;
@property (nonatomic, strong) UITextField *tefOtherSupplement;
@property (nonatomic, assign) CGFloat heithOther;
@property (nonatomic, assign) CGFloat topOther;
//周围皮肤
@property (nonatomic, strong) UILabel *labSkin;
@property (nonatomic, strong) IQDropDownTextField *tefSkin;
@property (nonatomic, assign) CGFloat heightSkin;
@property (nonatomic, assign) CGFloat topSkin;
//异常情况
@property (nonatomic, strong) UILabel *labUnusual;
@property (nonatomic, strong) UITextField *tefUnusual;
@property (nonatomic, assign) CGFloat heightUnusual;
@property (nonatomic, assign) CGFloat topUnusual;

@end

@implementation ArteriovenousLienCellCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    _TefALItem.delegate = self;
    _TefALItem.dropDownMode = IQDropDownModeTextField;
    _TefALItem.itemList = @[@"外周静脉",@"动脉",@"中心静脉",@"脐静脉",@"PICC",@"输液港"];
    _TefALItem.placeholder = @"请选择";

    [self configOutsideVeinView];
    [self configView];
    [self configSubviews];
}
- (void)configView{
    //label
    UILabel *lp  = [self createLabelWith:@"穿刺部位"];
    [_viwItems addSubview:lp];
    UILabel *ld = [self createLabelWith:@"日期"];
    [_viwItems addSubview:ld];
    UILabel *lm = [self createLabelWith:@"型号"];
    [_viwItems addSubview:lm];
    UILabel *li = [self createLabelWith:@"置入长度"];
    [_viwItems addSubview:li];
    UILabel *la = [self createLabelWith:@"臂围"];
    [_viwItems addSubview:la];
    UILabel *ll = [self createLabelWith:@"外露长度"];
    [_viwItems addSubview:ll];
    UILabel *lo = [self createLabelWith:@"其他补充"];
    [_viwItems addSubview:lo];
    UILabel *ls = [self createLabelWith:@"周围皮肤"];
    [_viwItems addSubview:ls];
    UILabel *lu = [self createLabelWith:@"异常情况"];
    [_viwItems addSubview:lu];
    
    self.labParacentesis = lp;
    self.labDate = ld;
    self.labMark = lm;
    self.LabInsideLength = li;
    self.LabArmGirth = la;
    self.labLeakageLength = ll;
    self.labOtherSupplement = lo;
    self.labSkin = ls;
    self.labUnusual = lu;
    
    //textField
    UITextField *tp = [self createTextFieldWith:@""];
    [_viwItems addSubview:tp];
    IQDropDownTextField *td = [[IQDropDownTextField alloc]init];
    td.dropDownMode = IQDropDownModeTimePicker;
    td.borderStyle = UITextBorderStyleLine;
    [_viwItems addSubview:td];
    UITextField *tm = [self createTextFieldWith:@"Fr"];
    [_viwItems addSubview:tm];
    UITextField *ti = [self createTextFieldWith:@"cm"];
    [_viwItems addSubview:ti];
    UITextField *ta = [self createTextFieldWith:@"cm"];
    [_viwItems addSubview:ta];
    UITextField *tl = [self createTextFieldWith:@"cm"];
    [_viwItems addSubview:tl];
    UITextField *to = [self createTextFieldWith:@""];
    [_viwItems addSubview:to];
    
    IQDropDownTextField *ts = [[IQDropDownTextField alloc]init];
    ts.dropDownMode = IQDropDownModeTextPicker;
    ts.borderStyle = UITextBorderStyleLine;
    ts.itemList = @[@"正常",@"异常"];
    ts.delegate = self;
    ts.tag = 13007;
    ts.placeholder = @"请选择";
    [_viwItems addSubview:ts];
    
    UITextField *tu = [self createTextFieldWith:@""];
    [_viwItems addSubview:tu];
    tu.borderStyle = UITextBorderStyleLine;
    
    _tefParacentesis = tp;
    _tefDate = td;
    _tefMark = tm;
    _tefInsideLength = ti;
    _tefArmGirth = ta;
    _tefLeakageLength = tl;
    _tefOtherSupplement = to;
    _tefSkin = ts;
    _tefUnusual = tu;
}

- (UILabel *) createLabelWith:(NSString *)title  {
    UILabel *l = [[UILabel alloc]initWithFrame:CGRectZero];
    l.text = title;
    l.textColor = [UIColor blackColor];
    l.font = [UIFont fontWithName:@"PingFang SC" size:15.0];
    return  l;
}

- (UITextField *)createTextFieldWith:(NSString *)unit {
    UITextField *tf  = [UITextField new];
    tf.borderStyle = UITextBorderStyleLine;
    UILabel *lu = [self createLabelWith:unit];
    lu.frame = CGRectMake(0, 0, 60, 30);
    tf.rightView = lu;
    return tf;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

//赋值
- (void)setNodeInfo:(ObjALInfo *)nodeInfo {
    _nodeInfo = nodeInfo;
//    NSLog(@"%@",nodeInfo.nodeName);
    _TefALItem.selectedItem = nodeInfo.alType;
    [self updateView:nodeInfo.alType refresh:NO];
    [self skinState:nodeInfo.skin refresh:NO];
    self.tefSkin.selectedItem = nodeInfo.skin ? nodeInfo.skin : @"正常";
}


- (IBAction)addAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(addAction)]) {
        [self.delegate addAction];
    }
}
- (IBAction)reduceAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(reduceAction:)]) {
        [self.delegate reduceAction:self.index];
    }
}


#pragma mark - IQDropDownTextFieldDelegate
-(void)textField:(nonnull IQDropDownTextField*)textField didSelectItem:(nullable NSString*)item {
    //    [self.contentView endEditing:YES];
    [textField resignFirstResponder];
    if (textField.tag == 13007) {
        [self skinState:item refresh:YES];
    }else {
        [self updateView:item refresh:YES];
        _nodeInfo.alType = item;
    }
}
//
- (void)updateView:(NSString *)item refresh:(BOOL)isRefresh {
    if ([item isEqualToString:@"外周静脉"]){
        for (UIView *view in _viwItems.subviews) {
            [view removeFromSuperview];
        }
        [self configOutsideVeinView];
        [self configView];
        [self configSubviews];
        if (isRefresh) {
        if ([self.delegate respondsToSelector:@selector(reloadTabelCell:)]) {
            [self.delegate reloadTabelCell:self.index];
        }}
    }else if ([item isEqualToString:@"动脉"]) {
        for (UIView *view in _viwItems.subviews) {
            [view removeFromSuperview];
        }
        [self configArteryView];
        [self configView];
        [self configSubviews];
        if (isRefresh) {
        if ([self.delegate respondsToSelector:@selector(reloadTabelCell:)]) {
            [self.delegate reloadTabelCell:self.index];
        }
        }
    }else if ([item isEqualToString:@"中心静脉"]){
        for (UIView *view in _viwItems.subviews) {
            [view removeFromSuperview];
        }
        [self configCenterVeinView];
        [self configView];
        [self configSubviews];
        if (isRefresh) {
            if ([self.delegate respondsToSelector:@selector(reloadTabelCell:)]) {
                [self.delegate reloadTabelCell:self.index];
            }
        }
    }else if([item isEqualToString:@"脐静脉"]) {
        for (UIView *view in _viwItems.subviews) {
            [view removeFromSuperview];
        }
        [self configUmbilicalVeinView];
        [self configView];
        [self configSubviews];
        if (isRefresh) {
            if ([self.delegate respondsToSelector:@selector(reloadTabelCell:)]) {
                [self.delegate reloadTabelCell:self.index];
            }
        }
    }else if ([item isEqualToString:@"PICC"]) {
        for (UIView *view in _viwItems.subviews) {
            [view removeFromSuperview];
        }
        [self configPICCView];
        [self configView];
        [self configSubviews];
        if (isRefresh) {
            if ([self.delegate respondsToSelector:@selector(reloadTabelCell:)]) {
                [self.delegate reloadTabelCell:self.index];
            }
        }
    }else if ([item isEqualToString:@"输液港"]) {
        for (UIView *view in _viwItems.subviews) {
            [view removeFromSuperview];
        }
        [self configTransfusionView];
        [self configView];
        [self configSubviews];
        if (isRefresh) {
            if ([self.delegate respondsToSelector:@selector(reloadTabelCell:)]) {
                [self.delegate reloadTabelCell:self.index];
            }
        }
    }else {
        for (UIView *view in _viwItems.subviews) {
            [view removeFromSuperview];
        }
        [self configOther];
        [self configView];
        [self configSubviews];
        if (isRefresh) {
            if ([self.delegate respondsToSelector:@selector(reloadTabelCell:)]) {
                [self.delegate reloadTabelCell:self.index];
            }
        }
    }
    
}

//周围皮肤 正常 异常
- (void) skinState:(NSString *)item refresh:(BOOL)isRefresh{
    self.nodeInfo.skin = item;
//    if (isRefresh) {
//        if ([self.delegate respondsToSelector:@selector(reloadTabelCell:)]) {
//            [self.delegate reloadTabelCell:self.index];
//        }
//    }
    if ([item isEqualToString:@"异常"]){
//        //异常
//        self.cellH += 30.f;
        self.heightUnusual = 30.f;
        self.topUnusual = self.nodeInfo.cellHeight - 110.f;
//        self.topUnusual = self.cellH - 110.f;
        
        [self configSubviews];
        if (isRefresh) {
            if ([self.delegate respondsToSelector:@selector(reloadTabelCell:)]) {
                [self.delegate reloadTabelCell:self.index];
            }
        }
    }else {
//        self.cellH = _heightDate + _heightParacentesis + _heightMark + _heightInsideLength + _heightArmGirth + _heightLeakageLength + _heightSkin + 80.f;
        self.heightUnusual = 0.f;
//        self.topUnusual = self.cellH - 110.f;
        self.topUnusual = self.nodeInfo.cellHeight - 110.f;
        [self configSubviews];
        if (isRefresh) {
            if ([self.delegate respondsToSelector:@selector(reloadTabelCell:)]) {
                [self.delegate reloadTabelCell:self.index];
            }
        }
    }

}

//外周静脉
- (void)configOutsideVeinView {
    _cellH = 200.f;
    _heightParacentesis = 30.0f;
    _heightDate = 30.f;
    _heightMark = 30.f;
    _heightInsideLength = 0.0f;
    _topInsideLength = 0.0f;
    _heightArmGirth = 0.0f;
    _topArmGirth = 0.0f;
    _heightLeakageLength = 0.0f;
    _topLeakageLength = 0.0f;
    _heithOther = 0.0f;
    _topOther = 0.0f;
    _heightSkin = 30.f;
    _topSkin = 90.f;
    _heightUnusual = 0.0f;
    _heightUnusual = 0.0f;
}
//动脉
- (void)configArteryView {
    self.cellH  = 200;

    _heightParacentesis = 30.0f;
    _heightDate = 30.f;
    _heightMark = 30.f;
    _heightInsideLength = 0.0f;
    _topInsideLength = 0.0f;
    _heightArmGirth = 0.0f;
    _topArmGirth = 0.0f;
    _heightLeakageLength = 0.0f;
    _topLeakageLength = 0.0f;
    _heithOther = 0.0f;
    _topOther = 0.0f;
    _heightSkin = 30.f;
    _topSkin = 90.f;
    _heightUnusual = 0.0f;
    _heightUnusual = 0.0f;
}
//中心静脉
- (void)configCenterVeinView {
    self.cellH = 260.f;

    _heightParacentesis = 30.0f;
    _heightDate = 30.f;
    _heightMark = 30.f;
    _heightInsideLength = 30.0f;
    _topInsideLength = 90.0f;
    _heightArmGirth = 0.0f;
    _topArmGirth = 0.0f;
    _heightLeakageLength = 30.0f;
    _topLeakageLength = 120.0f;
    _heithOther = 0.0f;
    _topOther = 0.0f;
    _heightSkin = 30.f;
    _topSkin = 150.f;
    _heightUnusual = 0.0f;
    _heightUnusual = 0.0f;
}
//脐静脉
- (void) configUmbilicalVeinView {
    self.cellH  = 260.f;

    _heightParacentesis = 30.0f;
    _heightDate = 30.f;
    _heightMark = 30.f;
    _heightInsideLength = 30.0f;
    _topInsideLength = 90.0f;
    _heightArmGirth = 0.0f;
    _topArmGirth = 0.0f;
    _heightLeakageLength = 30.0f;
    _topLeakageLength = 120.0f;
    _heithOther = 0.0f;
    _topOther = 0.0f;
    _heightSkin = 30.f;
    _topSkin = 150.f;
    _heightUnusual = 0.0f;
    _heightUnusual = 0.0f;
}
//PICC
- (void) configPICCView {
    self.cellH = 290.f;

    _heightParacentesis = 30.0f;
    _heightDate = 30.f;
    _heightMark = 30.f;
    _heightInsideLength = 30.0f;
    _topInsideLength = 90.0f;
    _heightArmGirth = 30.0f;
    _topArmGirth = 120.0f;
    _heightLeakageLength = 30.0f;
    _topLeakageLength = 150.0f;
    _heithOther = 0.0f;
    _topOther = 0.0f;
    _heightSkin = 30.f;
    _topSkin = 180.f;
    _heightUnusual = 0.0f;
    _heightUnusual = 0.0f;
}
//输液港
- (void)configTransfusionView {
    self.cellH = 230.f;

    _heightParacentesis = 30.0f;
    _heightDate = 30.f;
    _heightMark = 30.f;
    _heightInsideLength = 0.0f;
    _topInsideLength = 0.0f;
    _heightArmGirth = 0.0f;
    _topArmGirth = 0.0f;
    _heightLeakageLength = 0.0f;
    _topLeakageLength = 0.0f;
    _heithOther = 30.0f;
    _topOther = 90.0f;
    _heightSkin = 30.f;
    _topSkin = 120.f;
    _heightUnusual = 0.0f;
    _heightUnusual = 0.0f;
}
- (void)configOther{
    _cellH = 80.f;
    _heightParacentesis = 0.0f;
    _heightDate = 0.0f;
    _heightMark = 0.0f;
    _heightInsideLength = 0.0f;
    _heightArmGirth = 0.0f;
    _heightLeakageLength = 0.0f;
    _heithOther = 0.0f;
    _heightSkin = 0.0f;
    _heightUnusual = 0.0f;
}

- (void) configSubviews  {
    
    //复原为0
    _labParacentesis.frame = CGRectZero;
    _tefParacentesis.frame = CGRectZero;
    _labDate.frame = CGRectZero;
    _tefDate.frame = CGRectZero;
    _labMark.frame = CGRectZero;
    _tefMark.frame = CGRectZero;
    _LabInsideLength.frame = CGRectZero;
    _tefInsideLength.frame = CGRectZero;
    _LabArmGirth.frame = CGRectZero;
    _tefArmGirth.frame = CGRectZero;
    _labLeakageLength.frame = CGRectZero;
    _tefLeakageLength.frame = CGRectZero;
    _labOtherSupplement.frame = CGRectZero;
    _tefOtherSupplement.frame = CGRectZero;
    _labSkin.frame = CGRectZero;
    _tefSkin.frame = CGRectZero;
    _labUnusual.frame = CGRectZero;
    _tefUnusual.frame = CGRectZero;
    
    //穿刺部位
    if (_heightParacentesis > 0) {
    [_labParacentesis mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_viwItems);
        make.left.equalTo(_viwItems).offset(15);
        make.height.equalTo(@(_heightParacentesis));
        make.width.equalTo(@(65));
    }];
    [_tefParacentesis mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_viwItems);
        make.left.equalTo(_viwItems).offset(95);
        make.right.equalTo(_viwItems).offset(-15);
        make.height.equalTo(@(_heightParacentesis));
    }];
    }
    //日期
    if (_heightDate > 0) {
    [_labDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_viwItems).offset(_heightParacentesis);
        make.left.equalTo(_viwItems).offset(15);
        make.height.equalTo(@(_heightDate));
        make.width.equalTo(@(65));
    }];
    [_tefDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_viwItems).offset(_heightParacentesis);
        make.left.equalTo(_labParacentesis.mas_right).offset(15);
        make.right.equalTo(_viwItems).offset(-15);
        make.height.equalTo(@(_heightDate));
    }];
    }
    //型号
    if (_heightMark > 0) {
    [_labMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_viwItems).offset(_heightParacentesis + _heightDate);
        make.left.equalTo(_viwItems).offset(15);
        make.height.equalTo(@(_heightMark));
        make.width.equalTo(@(65));
    }];
    }
    [_tefMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_viwItems).offset(_heightParacentesis + _heightDate);
        make.left.equalTo(_viwItems).offset(95);
        make.right.equalTo(_viwItems).offset(-15);
        make.height.equalTo(@(_heightMark));
    }];
    //置入长度
    if (_heightInsideLength > 0) {
        [_LabInsideLength mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topInsideLength);
            make.left.equalTo(_viwItems).offset(15);
            make.height.equalTo(@(_heightInsideLength));
            make.width.equalTo(@(65));
        }];
        [_tefInsideLength mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topInsideLength);
            make.left.equalTo(_viwItems).offset(95);
            make.right.equalTo(_viwItems).offset(-15);
            make.height.equalTo(@(_heightInsideLength));
        }];
    }
    //臂围
    if (_heightArmGirth > 0) {
        [_LabArmGirth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topArmGirth);
            make.left.equalTo(_viwItems).offset(15);
            make.height.equalTo(@(_heightArmGirth));
            make.width.equalTo(@(65));
        }];
        [_tefArmGirth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topArmGirth);
            make.left.equalTo(_viwItems).offset(95);
            make.right.equalTo(_viwItems).offset(-15);
            make.height.equalTo(@(_heightArmGirth));
        }];
    }
    //外露长度
    if (_heightLeakageLength > 0) {
        [_labLeakageLength mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topLeakageLength);
            make.left.equalTo(_viwItems).offset(15);
            make.height.equalTo(@(_heightLeakageLength));
            make.width.equalTo(@(65));
        }];
        [_tefLeakageLength mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topLeakageLength);
            make.left.equalTo(_viwItems).offset(95);
            make.right.equalTo(_viwItems).offset(-15);
            make.height.equalTo(@(_heightLeakageLength));
        }];
    }
    //其他补充
    if (_heithOther > 0) {
        [_labOtherSupplement mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topOther);
            make.left.equalTo(_viwItems).offset(15);
            make.height.equalTo(@(_heithOther));
            make.width.equalTo(@(65));
        }];
        [_tefOtherSupplement mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topOther);
            make.left.equalTo(_viwItems).offset(95);
            make.right.equalTo(_viwItems).offset(-15);
            make.height.equalTo(@(_heithOther));
        }];
    }
    //周围皮肤
    if (_heightSkin > 0) {
        [_labSkin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topSkin);
            make.left.equalTo(_viwItems).offset(15);
            make.height.equalTo(@(_heightSkin));
            make.width.equalTo(@(65));
        }];
        [_tefSkin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topSkin);
            make.left.equalTo(_viwItems).offset(95);
            make.right.equalTo(_viwItems).offset(-15);
            make.height.equalTo(@(_heightSkin));
        }];
    }
    //异常情况
    if (_heightUnusual > 0) {
        [_labUnusual mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topUnusual);
            make.left.equalTo(_viwItems).offset(15);
            make.height.equalTo(@(_heightUnusual));
            make.width.equalTo(@(65));
        }];
        [_tefUnusual mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_viwItems).offset(_topUnusual);
            make.left.equalTo(_viwItems).offset(95);
            make.right.equalTo(_viwItems).offset(-15);
            make.height.equalTo(@(_heightUnusual));
        }];
    }
}

@end
