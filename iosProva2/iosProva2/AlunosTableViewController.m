//
//  AlunosTableViewController.m
//  iosProva2
//
//  Created by Dainf on 18/03/15.
//  Copyright (c) 2015 com.utfpr. All rights reserved.
//

#import "AlunosTableViewController.h"
#import "DetalheViewController.h"

@interface AlunosTableViewController ()

@end

@implementation AlunosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    aid = [[NSMutableArray alloc] init];
    aaluno = [[NSMutableArray alloc] init];
    amedia = [[NSMutableArray alloc] init];
    
    anota1 = [[NSMutableArray alloc] init];
    anota2 = [[NSMutableArray alloc] init];
    
    
    sqlite3 *myDatabase;
    sqlite3_stmt *startment;
    if (sqlite3_open([[self getFilePath] UTF8String], &myDatabase) == SQLITE_OK)  {
        NSString *querySQL = @"SELECT ID,ALUNO,NOTA1,NOTA2,MEDIA FROM ALUNOS";
        const char *query_stmt = [querySQL UTF8String];
        
        sqlite3_prepare_v2(myDatabase, query_stmt, -1, &startment, NULL);
        NSLog(@"SQLITE_OK");
        
        
        while (sqlite3_step(startment) == SQLITE_ROW)
        {
            NSLog(@"SQLITE_ROW");
            NSString *di = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(startment, 0)];
            NSString *aluno = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(startment, 1)];
            
            NSString *nota1 = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(startment, 2)];
            NSString *nota2 = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(startment, 3)];
            
            NSString *media = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(startment, 4)];
            
            [aid addObject:di];
            [aaluno addObject:aluno];
            [anota1 addObject:nota1];
            [anota2 addObject:nota2];
            [amedia addObject:media];
        }
         NSLog(@"SQLITE_ROW");
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [aid count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = aaluno[indexPath.row];
    //cell.detailTextLabel.text = aid[indexPath.row];
    
    NSLog(@"Cell");
    return cell;
}

-(NSString *) getFilePath
{
    NSArray *userDomainPath = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, TRUE);
    
    NSString *documentsDir = [userDomainPath objectAtIndex:0];
    
    return [documentsDir stringByAppendingString:@"mydatabase.db"];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetalheViewController * outra_view = [[DetalheViewController alloc] init];
    
    NSString *strRow = [NSString stringWithFormat:@"%d", indexPath.row];
    NSString *strResult = @"Voce clicou na linha ";
    strResult = [strResult stringByAppendingString:strRow];
    
    
    outra_view.aluno = aaluno[indexPath.row];
    outra_view.nota1 = anota1[indexPath.row];
    outra_view.nota2 = anota2[indexPath.row];
    outra_view.media = amedia[indexPath.row];
    
    
    [self presentViewController:outra_view animated:TRUE completion:nil];
    
    NSLog(@"%d", indexPath.row);
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
