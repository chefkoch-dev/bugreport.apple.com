#import "WorksViewController.h"

@interface WorksViewController()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIStackView *contentStackView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UILabel *middleContentLabel;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UILabel *descriptionLabel;
@end

@implementation WorksViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentStackView];
    [self.contentStackView addArrangedSubview:self.topView];
    [self.contentStackView addArrangedSubview:self.middleContentLabel];
    [self.contentStackView addArrangedSubview:self.bottomView];
    [self.view addSubview:self.descriptionLabel];

    UILayoutGuide *frameGuide = self.scrollView.frameLayoutGuide;
    UILayoutGuide *contentGuide = self.scrollView.contentLayoutGuide;

    [NSLayoutConstraint activateConstraints:(@[
                                               [frameGuide.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
                                               [frameGuide.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
                                               [frameGuide.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
                                               [frameGuide.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
                                               [contentGuide.leadingAnchor constraintEqualToAnchor:self.contentStackView.leadingAnchor],
                                               [contentGuide.topAnchor constraintEqualToAnchor:self.contentStackView.topAnchor],
                                               [contentGuide.trailingAnchor constraintEqualToAnchor:self.contentStackView.trailingAnchor],
                                               [contentGuide.bottomAnchor constraintEqualToAnchor:self.contentStackView.bottomAnchor],
                                               [contentGuide.widthAnchor constraintEqualToAnchor:frameGuide.widthAnchor],
                                               [self.descriptionLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
                                               [self.descriptionLabel.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
                                               [self.descriptionLabel.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
                                             ])];
}

#pragma mark - Class Extension

- (UIScrollView *)scrollView {
    if (_scrollView) {
        return _scrollView;
    }

    _scrollView = [[UIScrollView alloc] init];
    _scrollView.translatesAutoresizingMaskIntoConstraints = NO;

    return _scrollView;
}

- (UIStackView *)contentStackView {
    if (_contentStackView) {
        return _contentStackView;
    }

    _contentStackView = [[UIStackView alloc] init];
    _contentStackView.translatesAutoresizingMaskIntoConstraints = NO;
    _contentStackView.axis = UILayoutConstraintAxisVertical;
    _contentStackView.alignment = UIStackViewAlignmentFill;
    _contentStackView.spacing = (CGFloat)10.0f;
    _contentStackView.distribution = UIStackViewAlignmentFill;

    return _contentStackView;
}

- (UIView *)topView {
    if (_topView) {
        return _topView;
    }

    _topView = [[UIView alloc] init];
    _topView.backgroundColor = [UIColor greenColor];
    _topView.translatesAutoresizingMaskIntoConstraints = NO;
    // This view doesn't has an intrinisc content size, so we simulate one.
    [[_topView.heightAnchor constraintEqualToConstant:(CGFloat)200.0f] setActive:YES];

    return _topView;
}

- (UILabel *)middleContentLabel {
    if (_middleContentLabel) {
        return _middleContentLabel;
    }

    _middleContentLabel = [[UILabel alloc] init];
    // This label has an intrinsic content size.
    _middleContentLabel.text = @"DIY etsy distillery tousled shoreditch af vice, tattooed skateboard godard woke. Health goth brunch DIY ethical vexillologist green juice, pinterest shaman affogato tumblr meggings hammock seitan stumptown tofu. Locavore drinking vinegar taiyaki, meditation mixtape echo park roof party brooklyn pour-over snackwave tbh iPhone photo booth. Cornhole glossier portland vaporware green juice. Hammock tbh fingerstache ugh, ennui pok pok affogato single-origin coffee dreamcatcher art party letterpress roof party 90's pop-up.";
    _middleContentLabel.numberOfLines = 0;

    return _middleContentLabel;
}

- (UIView *)bottomView {
    if (_bottomView) {
        return _bottomView;
    }

    _bottomView = [[UIView alloc] init];
    _bottomView.backgroundColor = [UIColor orangeColor];
    _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    // This view doesn't has an intrinisc content size, so we simulate one.
    [[_bottomView.heightAnchor constraintEqualToConstant:(CGFloat)400.0f] setActive:YES];

    return _bottomView;
}

- (UILabel *)descriptionLabel {
    if (_descriptionLabel) {
        return _descriptionLabel;
    }

    _descriptionLabel = [[UILabel alloc] init];
    _descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _descriptionLabel.text = @"Configuration of UIScrollView, UIStackView, and Content in `WorksViewController.m`.";
    _descriptionLabel.textAlignment = NSTextAlignmentCenter;
    _descriptionLabel.numberOfLines = 0;

    return _descriptionLabel;
}

@end
