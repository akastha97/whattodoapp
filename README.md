# Whattodo application

### App Name: 
Whattodo 

### Developer: 
Aishwarya Kasthala

### App Description: 
"Welcome to 'Whattodo,' a simple application for managing tasks with style and efficiency, to declutter your life. "Whattodo" is a classic ToDo application thoughtfully designed with a primary focus on user experience and local storage capabilities. 

### Framework and Languages:  
Flutter framework and Dart programming language. 

### App Platform: 
This app is developed in Flutter framework, generates both iOS and Android apps. 

### Installation: 
Download and install this apk file for android:
Also, you can clone this repo and run the app via Visual Studio code/ Xcode. 

### App Features: 
1.	User can add, delete a Task category. 
2.	User can, edit, remove a Task.

### App Technical Details:
1.	UI/ UX: The whole application screens have been designed using AdobeXD tool. Few Icons have been directly picked from canva.com and few are designed by the developer on canva.com.
2.	Storage: Local storage has been implemented in this application using a package called “Hive”, to store the categories and tasks. All the Crud operations are written in this file to separate out the database logic from the UI to make the code look more structured. 
3.	Animations: Default Flutter animations are also implemented for Splash Screen and the Dashboard screen.
4.	Structured code: Code has been structured and organized into separate folders and files to make the code more readable. 
5.	Custom classes: Custom UI classes are written to increase the code reusability. 
6.	Documentation: All the classes and methods in the application are properly documented. 

## App screens:
1.	Splash Screen: Displays a carousel slider.
2.	Dashboard Screen: Displays the Task categories. 
3.	Todo Screen: Displays all the Todo’s/ tasks. 

## Application Flow: 
1.	Splash Screen:  
  * At first, the user is shown the Splash Screen. This screen is displayed every time the user opens the application (not while the app is running in the background).
  * In this screen, a carousel slider is shown with a sliding animation.
3.	Dashboard Screen:
  * Once the user clicks on a button on Splash Screen, user is navigated to the Dashboard screen.
  * In this screen, a few default Task categories are shown, along with a Floating Action button to enable the user to add a new Task category. 
  * Once the user clicks on FAB, an alert box is shown with a textfield to enter the new category. Has “Add” and “Cancel” buttons. “Add” button will add the new category and updates the Hive DB. “Cancel” button closes the Alert box (without making any changes to the DB).
  * User can also delete a category, by long pressing the Category card. “Delete” icon will be displayed on long press. Once the user clicks on the delete icon, the category card is deleted from the list and Hive DB is updated.
4.	Todo Screen: 
  * In this screen, the user can add a new task, delete a task, and mark the task by clicking on the Checkbox, which indicates the completed task status. 

## Hive Manager class:
  * Hive package has been implemented to store the app data locally. Category Data and Task data are saved locally to the Hive boxes.
  * HiveManager class contains all the CRUD operations such as read, write, and put, for both categories and tasks.
  * Auto generated adapter files are also present for the category model and todo item models, which have been generated using the build_runner package. 

## Packages/ Dependencies used: 
* dependencies: hive, hive_flutter, flutter_launcher_icons
* dev_dependencies: hive_generator, build_runner

## App files/ folders: 
### Folders: 
1.	ui_components: This folder contains all the Custom UI widgets used in the application.
2.	screens: This folder contains all the screens of the application. 
3.	manager: This folder contains manager class for Hive. 
4.	assets: This folder contains all the assets including images, fonts, icons used in the application. 
5.	models: This folder contains all the model classes along with auto generated adapter files. 
### Files: 
1.	consts.dart: This file contains all the constants like strings used in the application. 

#### Fonts used in the app: 
Playpen Sans (downloaded from Google Fonts) 
#### Icons: 
Designed in canva.com

## Version Control: 
Code is available to the dev branch. Commits and pushes done via Github desktop application. 

## Testing: 
Done on multiple iOS simulators, and android phones. 

## App Screenshots: 
Screenshots taken on iPhone 14 Plus simulator. 

#### Splash screen: 
![1](https://github.com/akastha97/whattodoapp/assets/116918112/617ff7db-45c9-4de7-83b6-b366547b1d3b)
![2](https://github.com/akastha97/whattodoapp/assets/116918112/8a80ae89-cbf2-495b-91d0-65381e6dba84)
![3](https://github.com/akastha97/whattodoapp/assets/116918112/cd5f59be-8faa-4042-ac0e-8a291ed4fd4c)
![4](https://github.com/akastha97/whattodoapp/assets/116918112/c451d5c8-18c0-4cc6-9351-0352d4de1450)

#### Dashboard screen: 
![5](https://github.com/akastha97/whattodoapp/assets/116918112/e0f5c367-5b05-4cc2-a4ea-f7eedf1fc1ed)
![6](https://github.com/akastha97/whattodoapp/assets/116918112/7a29a7c3-e002-408c-8607-b047c67d2ee8)
![7](https://github.com/akastha97/whattodoapp/assets/116918112/7503185e-541a-4802-befc-292b6dd01678)

#### Todo Screen: 

![8](https://github.com/akastha97/whattodoapp/assets/116918112/ecc1015a-d932-4f69-abfd-39fc89a6157d)
![9](https://github.com/akastha97/whattodoapp/assets/116918112/fcda673d-c1a6-4a76-8ea2-b6b29b12d57f)
![10](https://github.com/akastha97/whattodoapp/assets/116918112/313d7d90-de78-427e-9ca8-a7dfe36f5d8b)
![11](https://github.com/akastha97/whattodoapp/assets/116918112/0a092404-74d6-4f67-a794-87e989355370)
![12](https://github.com/akastha97/whattodoapp/assets/116918112/b63597bb-c6e3-46e6-84de-147d8f918d01)
![13](https://github.com/akastha97/whattodoapp/assets/116918112/c21630b1-1309-4f58-b83d-00d56e112a41)
![14](https://github.com/akastha97/whattodoapp/assets/116918112/2731ccef-6c6d-46a4-8b4b-ab8499398a75)
![15](https://github.com/akastha97/whattodoapp/assets/116918112/23ef302d-68be-47c3-992c-20e5e0eee77b)







