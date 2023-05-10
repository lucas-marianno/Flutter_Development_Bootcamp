//DONE: Step 1 - Add background.png to this Container as a background image.

//DONE: Step 2 - Create a new class called Story.

//DONE: Step 3 - Create 3 properties for this class:
// A. storyTitle to store the story text.
// B. choice1 to store the text for choice 1.
// C. choice2 to store the text for choice 2.

//DONE: Step 4 - Create a Constructor for this class to be able to initialise
// the properties created in step 3.

//DONE: Step 5 - Create a new class called StoryBrain.

//DONE: Step 6 - import the story.dart file into this file.

//DONE: Step 7 - Uncomment the lines below to include storyData as a private
// property in StoryBrain (ctrl+k ctrl+c to comment, ctrl+k ctrl+u to uncomment).
// Hint: You might need to change something in story.dart to make this work.

//DONE: Step 8 - Create a method called getStory() that returns the first
// storyTitle from _storyData.

//DONE: Step 9 - Create a new storyBrain object from the StoryBrain class.

//DONE: Step 10 - use the storyBrain to get the first story
// title and display it in this Text Widget.
//Choice 1 made by user.

//DONE: Step 11 - Create a method called getChoice1() that returns the text for
// the first choice1 from _storyData.

//DONE: Step 12 - Create a method called getChoice2() that returns the text for
// the first choice2 from _storyData.

//DONE: Step 13 - Use the storyBrain to get the text for choice 1.

//DONE: Step 14 - Use the storyBrain to get the text for choice 2.

//DONE: Step 15 - Run the app and see if you can see the screen update with the
// first story. Delete this TO DO if it looks as you expected.

//DONE: Step 16 - Create a property called storyNumber which starts with a value
// of 0. This will be used to track which story the user is currently viewing.

//DONE: Step 17 - Create a method called nextStory(), it should not have any
// outputs but it should have 1 input called choiceNumber which will be the
// choice number (int) made by the user.

//DONE: Step 18 - Call the nextStory() method from storyBrain
// and pass the number 1 as the choice made by the user.

//DONE: Step 19 - Call the nextStory() method from storyBrain
// and pass the number 2 as the choice made by the user.

//DONE: Step 20 - Download the story plan here:
// https://drive.google.com/uc?export=download&id=1KU6EghkO9Hf2hRM0756xFHgNaZyGCou3

//DONE: Step 21 - Using the story plan, update nextStory() to change the
// storyNumber depending on the choice made by the user. e.g. if choiceNumber
// was equal to 1 and the storyNumber is 0, the storyNumber should become 2.

//DONE: Step 22 - In nextStory() if the storyNumber is equal to 3 or 4 or 5,
// that means it's the end of the game and it should call a method called
// restart() that resets the storyNumber to 0.

//DONE: Step 23 - Use the storyNumber property inside getStory(), getChoice1()
// and getChoice2() so that it gets the updated story and choices rather than
// always just the first (0th) one.

//DONE: Step 24 - Run the app and try to figure out what code you need to add to
// this file to make the story change when you press on the choice buttons.

//DONE: Step 25 - Change the storyNumber property into a private property so that
// only story_brain.dart has access to it. You can do this by right clicking on
// the name (storyNumber) and selecting Refactor -> Rename to make the change
// across all the places where it's used.

//DONE: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.

//DONE: Step 27 - Create a method called buttonShouldBeVisible() which checks to
// see if storyNumber is 0 or 1 or 2 (when both buttons should show choices) and
// return true if that is the case, else it should return false.

//DONE: Step 28 - Set the "visible" property of the Visibility
// Widget to equal the output from the buttonShouldBeVisible()
// method in the storyBrain.
//Choice 2 made by user.

//DONE: Step 29 - Run the app and test it against the Story Outline to make sure
// you've completed all the steps. The code for the completed app can be found
// here: https://github.com/londonappbrewery/destini-challenge-completed/


