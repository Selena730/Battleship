# Written reflection:
In your README reflect on the following:
1. Iteration 3 did not provide an interaction pattern. How did you approach designing this iteration? If you did not get to Iteration 3, reflect on how you think you would’ve approached the design and problem solving process.
    We started by creating a sudo code pattern to follow. After that we created methods to excute functionality of the game process. Finally we went through and created the tests for said functionality.


2. If you had one more day to work on this project, what would you work on?
    We would start by creating more tests for our game class. Then we would go thruogh and refactor as much as possible to create DRY-er code.

3. Describe the pairing techniques you used while working on this project.
    We started with driver and navigator and found good success. However, we primarily used seperate branches and discussed any merge conflicts as they came up.


4. Describe how feedback was shared over the course of this project.
    Primarily we used slack and zoom meetings. However, towards the later iterations we began to use github to share feedback.






1. [ ] Demonstration of functional completeness
        play game 

Run your runner file, and demonstrate how the game is played in the terminal. If you’ve considered edge cases, make sure you demonstrate that functionality in your demo.

2. [ ] Technical quality and organization of the code

At a high level (not line by line), describe how you broke out this game. What classes did you create? What is the responsibility of each class? Why did you choose to design your code in this way?
Is there a design decision that you made that you’re particularly proud of?
    Selena and I created a total of 4 classes. These classes consist of a Ship, a Cell, a Board, and a Game.  

        Ship
          In the Ship class we established what a ship was(ship name and length) and how the ship can get hit and/or sink with no remaining health.
        
        Cell
          In this class we explain what a individual cell(coordinate) is and how to know wether it has been fired upon with a miss, hit, or sunk ship.

        Board
          This class takes our two previous classes and helps them work together by creating boards with cells of rows(A..D) and columns(1..4). Then allows us the player to place our ships onto the board. This class also determains what is considered to be a vaild and invalid placement on said board.

        Game
          This class is were a big majority of the logic in our battleship game takes place. Here we created a welcome message that greets the player and ask if you would like to play or quit. After the player chooses to play we display their board and request them to place there ships. Next we allow the computer to randomly place their ships. Then the game begins and asks you to select your coordinates to fire on. The game will then go back and forth until a winner is identified by sinking all the oppsing teams ships. After a winner is identified it will tell the player wether they won or lost against the compter.
    
    
    
    Selena and I started by creating a Cell and Ship classes. In the Ship class we established what a ship was(ship name and length) and how the ship can get hit and/or sink with no remaining health. Next we establish the Cell class. In this class we explain what a individual cell(coordinate) is and how to know wether it has been fired upon with a miss, hit, or sunk ship. After that we created our Board class. This class takes our two previous classes and helps them work together by creating boards with cells of rows(A..D) and columns(1..4). Then allows us the player to place our ships onto the board. This class also determains what is considered to be a vaild and invalid placement on said board. Lastly we have our Game class. This class is were a big majority of the logic in our battleship game takes place. Here we created a welcome message that greets the player and ask if you would like to play or quit. After the player chooses to play we display their board and request them to place there ships. Next we allow the computer to randomly place their ships. Then the game begins and asks you to select your coordinates to fire on. The game will then go back and forth until a winner is identified by sinking all the oppsing teams ships. After a winner is identified it will tell the player wether they won or lost against the compter.

3. Identify a piece of code that you’d like to refactor. How would you update that code? 
In the valid_placement? method, where it says coordinations.each, I want to use .any? or .all? and the render method to make it without all the nesting.

4. Are there any parts of your code that you’re unsure/hesitant about? Why? 
    I think we were both a little hesitant about Game class because of all the various methods that it contains and how there are so many ways to do each method. Although we did try to play with it and now it works well but a little debugging would make it look cleaner.

5. Show examples of a unit and an integration test that you wrote. 
    A unit test would be the test for hit method in ship class, n this test, we create a new Ship instance and call the hit method on it. We then check if the ship's health is reduced, which is the expected behavior.    For the integration test an example would be the place_ship method in this test, it’s checking the interaction between the Board and Ship classes.

6. Run your test suite and open coverage report (if you were able to implement simplecov). 
    Test coverage will automatically generate when you run rspec spec in the terminal.

7. How did you all work together? Did you use a particular pairing technique? 
    We used driver and navigator at first and then we worked on our own on different branches and we would make pull requests and solve any merge conflicts after we discuss what we want to do.

8. Walk us through your GitHub insights. How many pull requests did you make? How many commits did you make? 
    We made almost 22 PRs and around 68 commits.

9. Can you identify a PR that was made that demonstrates good commenting/partner review workflow? 
    Main menu(start) we decided not to merge it and it has the review and it shows why we decided not to merge it.
