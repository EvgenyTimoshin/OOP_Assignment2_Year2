@SuppressWarnings( "deprecation" )
class Audio
{ 
  AudioSnippet gunShot;
  AudioSnippet death;
  AudioSnippet levelUp;
  AudioSnippet playerShot;
  AudioPlayer nightSong;
  AudioSnippet heartBeat;
  AudioSnippet bowFired;
  AudioSnippet zombieSpotted;
  AudioPlayer forestAmbience;
  AudioSnippet coin;
  AudioSnippet bite;
  
  Audio()
  {
    bite = minim.loadSnippet("bite.mp3");
    coin = minim.loadSnippet("coin.mp3");
    gunShot = minim.loadSnippet("gunShot.mp3");
    death = minim.loadSnippet("death.mp3");
    levelUp = minim.loadSnippet("levelUp.mp3");
    playerShot = minim.loadSnippet("playerShot.mp3");
    forestAmbience = minim.loadFile("forestAmbience.mp3");
    nightSong = minim.loadFile("nightSong.mp3");
    heartBeat = minim.loadSnippet("heartBeat.mp3");
    bowFired = minim.loadSnippet("bow.mp3");
    zombieSpotted = minim.loadSnippet("zombieSpotted.mp3");
  }
}