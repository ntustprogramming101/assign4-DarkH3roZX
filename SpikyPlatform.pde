// Practice1: finish SpikyPlatform
class SpikyPlatform extends Platform {
  SpikyPlatform(float tempX, float tempY) {
    super(tempX, tempY);
  }
  
  void interact(Player player) {
    if (!interacted) {
      player.takeDamage(1);
      interacted = true;
      player.damaged = true;
      playPlatformSound();
    }
    
    player.ySpeed = 0; // Reset the player's ySpeed
    player.y = y - player.h + player.feetOffset; // Place the player on top of the platform
    player.y -= speed; // Move the player up with the platform
  }

  void display() {
    // Use a different image for bouncy platforms
    image(spikyPlatformImage, x, y, w, h);
  }
  
  void playPlatformSound() {
    spikyPlatformSound.play(); // Play the bouncy platform sound
  }
}
