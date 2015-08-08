
#import "MBPTableViewController.h"
#import "MBPTableViewCell.h"


@interface MBPTableViewController ()

@end

@implementation MBPTableViewController
@synthesize arrayImages, imageText;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Image-name" ofType:@"plist"];
    arrayImages = [NSArray arrayWithContentsOfFile:path];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return arrayImages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MBPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    imageText = arrayImages[indexPath.row];
    
    NSString *name = imageText[@"namePlaces"];
    NSString *imageName = imageText[@"imageName"];
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    cell.namePlacesLabel.text = name;
    cell.imagePlacesImage.image = image;
    
    return cell;
}

@end
