// Practice2: finish FragilePlatform
final int FRAGILE_PLATFORM_DURATION = 50; // Duration before the platform breaks

class FragilePlatform extends Platform {
  boolean broken = false;
  int duration = FRAGILE_PLATFORM_DURATION;
  
  FragilePlatform(float tempX, float tempY) {
    super(tempX, tempY);
  }
  
  void update() {
    y -= speed; // Move the platform up
    if (y < -h) {
      recycleFlag = true; // Mark the platform for recycling
    }
    
    if (interacted) {
      duration--;
    }
    
    if (duration < 0) {
      if (!broken) {
        playPlatformSound(1);
      }
      
      broken = true;
    }
  }
  
  void interact(Player player) {
    if (!broken) {
      player.ySpeed = 0; // Reset the player's ySpeed
      player.y = y - player.h + player.feetOffset; // Place the player on top of the platform
      player.y -= speed; // Move the player up with the platform
      
      // Practice4: Avoid sound being repeatedly played
      if (!interacted) {
        playPlatformSound(0);
        interacted = true;
      }
    }
  }

  void display() {
    // Use a different image for bouncy platforms
    if (broken) {
      image(fragilePlatformBrokenImage, x, y, w, h);
    }
    else {
      image(fragilePlatformImage, x, y, w, h);
    }
  }
  
  void playPlatformSound(int mode) {
    if (mode == 0) {
      fragilePlatformSound.play(); // Play the bouncy platform sound
    }
    else if (mode == 1) {
      fragilePlatformBrokenSound.play();
    }
  }
}
