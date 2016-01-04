//
//  ListTableViewController.m
//  iOSDemo
//
//  Created by Netease on 15/12/28.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "ListTableViewController.h"
#import "PhotoOperations.h"
#import "ImageDownloader.h"

@interface ListTableViewController ()

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Classic Photos";
    self.dataSourceURL = [NSURL URLWithString:@"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist"];
    self.photos = [[NSMutableArray alloc] init];
    self.pendingOperations = [[PendingOperations alloc] init];
    
    [self fetchPhotoDetails];
}
-(void)viewDidDisappear:(BOOL)animated{
    [self.photos removeAllObjects];
}

-(void)fetchPhotoDetails{
    NSURLRequest *request = [NSURLRequest requestWithURL:self.dataSourceURL];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (data != nil) {
            NSDictionary *datasourceDictionary = [NSPropertyListSerialization propertyListWithData:data options:0 format:nil error:nil];
            
            for (NSString* key in datasourceDictionary.allKeys) {
                NSURL *url = [NSURL URLWithString:[datasourceDictionary objectForKey:key]];
                
                PhotoRecord *photoRecord = [[PhotoRecord alloc] init:key url:url];
                [self.photos addObject:photoRecord];
            }
        }
        [self.tableView reloadData];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    if (cell.accessoryView == nil) {
        cell.accessoryView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    
    //UIActivityIndicatorView* indicator = cell.accessoryView;
    if ([self.photos count] == 0) {
        return cell;
    }
    
    PhotoRecord* photo = [self.photos objectAtIndex:indexPath.row];

    cell.textLabel.text = photo.name;
    cell.imageView.image = photo.image;
    
    NSLog(@"cell for table");
    switch (photo.state) {
        case Filtered:
            //[indicator stopAnimating];
            break;
        case Failed:
            //[indicator stopAnimating];
            cell.textLabel.text = @"Failed to load";
            break;
        case New:
        case Downloaded:
            //[indicator startAnimating];
            if (!tableView.dragging && !tableView.decelerating) {
                [self startOperationsForPhotoRecord:photo indexPath:indexPath];
            }
            break;
        default:
            break;
    }
    
    return cell;
}

-(void)startFilterForRecord:(PhotoRecord *)photo indexPath: (NSIndexPath *)path{
    ImageFiltration *filterOperation = [self.pendingOperations.filtrationsInProgress objectForKey:path];
    if (filterOperation != nil) {
        return;
    }
    ImageFiltration *filter = [[ImageFiltration alloc] init:photo];
    __weak ImageFiltration* weakRefrence = filter;
    filter.completionBlock = ^{
        if ([self.photos count] == 0) {
            return;
        }
        if (weakRefrence.isCancelled) {
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.pendingOperations.filtrationsInProgress removeObjectForKey:path];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:path, nil] withRowAnimation:UITableViewRowAnimationFade];
        });
    };
    [self.pendingOperations.filtrationsInProgress setObject:filter forKey:path];
    [self.pendingOperations.filtrationQueue addOperation:filter];
}

-(void)startDownloadForRecord:(PhotoRecord *)photo indexPath: (NSIndexPath *)path{
    ImageDownloader *downloadOperation = [self.pendingOperations.downloadsInProgress objectForKey:path];
    if (downloadOperation != nil) {
        return;
    }
    
    ImageDownloader *downloader = [[ImageDownloader alloc] init:photo];
    __weak ImageDownloader* weakRefrence = downloader;
    downloader.completionBlock = ^{
        if (weakRefrence.cancelled) {
            return;
        }
        if ([self.photos count] == 0) {
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.pendingOperations.downloadsInProgress removeObjectForKey:path];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:path, nil] withRowAnimation:UITableViewRowAnimationFade];
        });
    };
    [self.pendingOperations.downloadsInProgress setObject:downloader forKey:path];
    [self.pendingOperations.downloadQueue addOperation:downloader];
}


-(void)startOperationsForPhotoRecord:(PhotoRecord *)photo indexPath: (NSIndexPath *)path{
    switch (photo.state) {
        case New:
            [self startDownloadForRecord:photo indexPath:path];
            break;
        case Downloaded:
            [self startFilterForRecord:photo indexPath:path];
            break;
        default:
            break;
    }
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self suspendAllOperations];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (!decelerate) {
        [self loadImageForOnscreenCells];
        [self resumeAllOperations];
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self loadImageForOnscreenCells];
    [self resumeAllOperations];
}

-(void)suspendAllOperations{
    self.pendingOperations.downloadQueue.suspended = YES;
    self.pendingOperations.filtrationQueue.suspended = YES;
}
-(void)resumeAllOperations{
    self.pendingOperations.downloadQueue.suspended = FALSE;
    self.pendingOperations.filtrationQueue.suspended = FALSE;
}
-(void)loadImageForOnscreenCells{
    NSArray *pathsArray = [self.tableView indexPathsForVisibleRows];
    if (pathsArray == nil) {
        return;
    }
    
    NSMutableSet *allPendingOperations = [NSMutableSet setWithArray:self.pendingOperations.downloadsInProgress.allKeys];
    [allPendingOperations unionSet:[NSSet setWithArray:self.pendingOperations.filtrationsInProgress.allKeys]];
    
    NSMutableSet *toBeCancelled = [NSMutableSet setWithSet:allPendingOperations];
    NSMutableSet *visiblePath = [NSMutableSet setWithArray:pathsArray];
    [toBeCancelled minusSet:visiblePath];
    
    NSMutableSet *toBeStarted =[NSMutableSet setWithSet:visiblePath];
    [toBeStarted minusSet:allPendingOperations];
    
    for (NSIndexPath *path in toBeCancelled) {
        id pendingDownload = [self.pendingOperations.downloadsInProgress objectForKey:path];
        if (pendingDownload != nil) {
            [pendingDownload cancel];
        }
        [self.pendingOperations.downloadsInProgress removeObjectForKey:path];
        
        id pendingFilter = [self.pendingOperations.filtrationsInProgress objectForKey:path];
        if (pendingFilter != nil) {
            [pendingFilter cancel];
        }
        [self.pendingOperations.filtrationsInProgress removeObjectForKey:path];
    }
    
    for (NSIndexPath *indexPath in toBeStarted) {
        id recordToProcess = [self.photos objectAtIndex:indexPath.row];
        [self startOperationsForPhotoRecord:recordToProcess indexPath:indexPath];
        
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
