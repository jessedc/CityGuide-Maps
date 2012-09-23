### CityGuide app expanded to organise cities by country

Based on [Tim Roadly's Guide ][2] but using `.xibs` instead of storyboards

- Tutorial uses delegate method to navigate back to Roles view from Add/Detail view (new/edited roles are saved to managed object context from Add/Detail views); with .xibs, you can pop Add/Detail view off the `UINavigationController` stack

- The first 3 parts have only one entity; It is very worthwhile to read [part 4][1], where he adds a new version of the data model (to add a second entity, and relationships):
        
If you get the error message "The model used to open the store is incompatible with the one used to create the store" another way to fix it is to delete the app from your simulator. You might get this error even before you change the data model, if you run the app before creating any entities.

Also note his advice to regenerate your entity classes whenever you change the data model.

I could not get this working with just the Xcode template code (new master-detail project with core data) -- Country table view did not load -- replaced table view and fetched results controller methods with tutorial's Stanford CoreDataTVC-based code, and it worked. There is not much CoreData-specific code added in the view controller files. 

Tutorial's app eventually has two tabs, for Roles and Persons. This CityGuide app's main table displays countries; selecting a country displays its cities. The Countries and Cities views have Edit and Add buttons. The Add button loads another table view controller.

AppDelegate: I made no changes to these files, except after I renamed the model to Model

MasterViewController is a subclass of Stanford's `CoreDataTableViewController`. The .m file has a method to set up values for the `NSFetchedResultsController` 

    - (void)setupFetchedResultsController

This method is called in `- viewWillAppear:` [self setupFetchedResultsController];

Some of the tableView methods call the fetchedResultsController.

Because the fetched results controller setup method specifies sorting, the country names are kept in alphabetical order.

This controller passes its managed object context to AddCountryTVC and to CityTVC.

AddCountryTVC adds the new country to its managed object context before popping itself off the navigation stack. Pressing the back button cancels -- no country is added. 

CityTVC is also a subclass of CoreDataTableViewController. In the fetched results controller setup method, it specifies a predicate to fetch only cities in the selectedCountry.

AddCityTVC sets the inCountry @property of the new city before adding it to the managed object context. Behaviour is otherwise the same as AddCountryTVC.

[1]: http://timroadley.com/2012/02/19/core-data-basics-part-4-relationships
[2]: http://timroadley.com/2012/02/09/core-data-basics-part-1-storyboards-delegation/