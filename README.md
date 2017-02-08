# OOP_Assignment2_Year2

My Top Down Shooter Zombie Game : For Object Orriented Programming in Processing

Video Link to Demo of Game:

[![Video](http://img.youtube.com/vi/4krfBdfA2_k/0.jpg)](https://www.youtube.com/watch?v=4krfBdfA2_k)

# Game Guide and Explanation

To run this game instal minim libraray for processing to use sounds. Run this game in FullScreen() or 1920 x 1080 for optimal scaling.

When the program launches you are presented with a simple Game menu which displays the a previous Highscore or 0 if no high score has been set yet. **This highscore is stored in an .txt file and is written to everytime the player sets a new high score.** It is then read in as the program launches and displayed in the main menu.

  - The controls are simple and displayed in the left bottom of the screen. Click Survive button to begin the game.
  - The game begins at 8 am on the game time clock and zombies begin spawning in
  - Shoot zombies to decrease their health and kill them
  - **By killing enemies the score *multiplier* will increase, improving your gun the higher it is, at 3.5 it was start to shoot more than 1 bullet**
  - Zombies come in *various sizes*, **size varies as does the health, speed and strenght associated with that size** (smaller zombies are weaker but faster, larger are slower but stronger and have more health)
  - Zombies will drop coins and sometimes power up like magnet or health. **The magnet allows u to pick up all powerups without coming close to them for a small amount of time**, if u stack magnet power ups you will have a prolonged time of automatic power up and coin collecting
  - Ammo will spawn around in brown boxes for the player to pick up
  - To use the bow press R to switch weapon, ** *the bow is very cool, depending on how far back you stretch it, the speed of the arrow will adjust* **
  - Arrows dont spawn as pickups and you must **buy these at the trader at the end of each day.**
  - The trader is where you spent all of your coins that you earned by killing
  - At *random times* in the game **Military Troops will interviene** and come in to elimnate you with weapons of their own. Kill them! and survive!
  - As the in game time progresses it will become dark and your vision will be very limited. Press T to turn on the torch, the night time is the most challengin yet most fun part of the game, thats why you should try and increase the multiplier on the right side of the screen to increase your chances of survival at night.
  - The longer you play the more **your characters speed and vision will level up** (the xp bar at the bottom) the higher level you are the faster and more long sighted your character becomes giving you an advatage
  
 
 #Parts of the Program to Note
   - This game was written using the following OOP concepts : **PolyMorphism, Inheritance and interfaces.** The GameObject class is an abstract that class that most other classes in the program extend. **Inheritence is used everywhere and interfaces are implemented. This allows for alot of code reuse and efficiency. (View Code)**
  - All of the enities in the game implement Bilogical interface, which allows all of them to bleed on projectile impact
  - The **blood effects** in the game are completley **procedural and random every time** creating a really nice and satisfying effect
  - Almost everything has bit of animation to it or a physics feel making the game feel **dyanmic** 
  - **Enemies** will not overlap but collide with eachother and **bounce of eachother**, the faster they collide the further theyll bounce
  - They will also interact in a similiar fashion when they bite the player
  - Military troops can kill the zombies and the player with their fire power, this creates fun dynamic gameplay
  - The Military Troops will follow the Player and shoot towards his direction
  - The power ups spawnning is random and dynamic
  - The **multiplier** on the right side of the screen the way it looks, and functions in gameplay is really cool! **proud of that**
  - The level and xp bar is pretty cool too
  - The torch effect and night effect looks pretty cool but is a very easy trick, a dark slightly see through rectangle with a noFill() arc on the same layer
  - The camera follows the player around and changes as the player levels up
  - The bow extends GameObject but also interfaces Weapon which allows it to Fire and Reload
  - **The bow is one of my faveourite features of the game**
  - The minim library was used to provide sound effects to the game creating a more full game experience.
  - **I/O is used to record the highscore of the player and display it from a text file**
