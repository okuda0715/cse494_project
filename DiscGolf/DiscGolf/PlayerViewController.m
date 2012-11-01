//
//  PlayerViewController.m
//  DiscGolf
//
//  Created by Austin Rowley on 10/18/12.
//  Copyright (c) 2012 aorowley. All rights reserved.
//

#import "PlayerViewController.h"


@interface PlayerViewController ()

@end

@implementation PlayerViewController

/*::::::::::::::::::::::::::::::::::Default Template::::::::::::::::::::::::::::::::::
 * These methods come with the default template when the view controller is created.
 *::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Make the navigation bar visible
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


/*::::::::::::::::::::::::::::::::::Self Created Methods::::::::::::::::::::::::::::::::::
 * These are methods I've created, mainly for IBAction
 *::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/

//Method for when the add button is pressed
- (IBAction)addButtonPressed
{
    //Dismiss keyboard
    [self.myTextfield resignFirstResponder];
    
    //Getting my data instance,then adding the string object to my array
    DataInfo *names = [DataInfo sharedDataInfo];
    [names.playerNames addObject:self.myTextfield.text];
    _myTextfield.clearsOnBeginEditing=YES;

    //Reload the UITableView
    [self.tableView reloadData];
}



/*::::::::::::::::::::::::::::::::::UITableView::::::::::::::::::::::::::::::::::
 * These methods have more to do with setting up the UITableView and UITableViewCells
 *:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/

//Method to return number of sections in a UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//Method to return the number of rows needed for tableview, in this case, its the length of player names array
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    DataInfo *names = [DataInfo sharedDataInfo];
    return [names.playerNames count];
}

//Method for loading the object into the cell at specific row
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"playerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //Getting my data instance, then getting my playerNames array at an index and setting that to the cell in TableView
    DataInfo *names = [DataInfo sharedDataInfo];
    cell.textLabel.text = [names.playerNames objectAtIndex:indexPath.row];
    
    return cell;
}


/*::::::::::::::::::::::::::::::::::Swipe To Delete::::::::::::::::::::::::::::::::::
 * These methods allows the TableView to be editable and remove a cell along with its data
 *:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/

//Method for editing the UITableView
- (BOOL)tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return YES if you want the specified item to be editable.
    return YES;
}

//Method implemented for 'swiple to delete' feature
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //Getting my data instance, then removing the object at that specific row
        DataInfo *names = [DataInfo sharedDataInfo];
        [names.playerNames removeObjectAtIndex:indexPath.row];
        
        //Creating a new NSIndexPath object and NSArray object
        NSIndexPath *newIndexPath = [[NSIndexPath alloc] init];
        //The newIndexPath is the row that's being editted
        newIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        NSArray *indexPathArray = [[NSArray alloc] init];
        indexPathArray = [NSArray arrayWithObject:newIndexPath];
        //Deleting the specified row
        [tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:YES];
        //Refresh the table
        [tableView reloadData];
    }
}

/*::::::::::::::::::::::::::::::::::Other::::::::::::::::::::::::::::::::::
 * These methods are other methods used in this ViewController
 *:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/

//Method for dismissing the keyboard after the return key is hit
- (BOOL)textFieldShouldReturn:(UITextField *)textfield
{
    if(textfield == self.myTextfield)
        [textfield resignFirstResponder];
    
    else
        [textfield resignFirstResponder];
    
    return YES;
}

//This keeps track of which cells were selected and not selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    DataInfo *selectedNames = [DataInfo sharedDataInfo];
    
    if ([selectedCell accessoryType] == UITableViewCellAccessoryNone)
    {
        //Add the checkmark accessory to the cell
        [selectedCell setAccessoryType:UITableViewCellAccessoryCheckmark];
        //Add the selected player to an array of selected players
        [selectedNames.selectedPlayers addObject:selectedCell];
        
        for (int i = 0; i < [selectedNames.selectedPlayers count]; i++)
        {
            NSLog(@" %@", [selectedNames.selectedPlayers objectAtIndex:i]);
                  
        }
    }
    else
    {
        //Remove the checkmark accessory from the cell
        [selectedCell setAccessoryType:UITableViewCellAccessoryNone];
        //Remove the selected player from the selected player array
        [selectedNames.selectedPlayers removeObject:selectedCell];
        
        for (int i = 0; i < [selectedNames.selectedPlayers count]; i++)
        {
            NSLog(@" %@", [selectedNames.selectedPlayers objectAtIndex:i]);
            
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(BOOL)textFieldShouldClear:(UITextField*)textField
{
    return YES;
}


@end
