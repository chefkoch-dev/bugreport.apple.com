#import "WorkaroundViewController.h"

@implementation WorkaroundViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Workaround:
    segue.destinationViewController.view.translatesAutoresizingMaskIntoConstraints = false;
}

@end
