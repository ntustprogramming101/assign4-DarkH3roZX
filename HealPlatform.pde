// Practice3: finish HealPlatform
class HealPlatform extends Platform {
  float potionW = 20, potionH = 20;
  boolean healed = false;

  HealPlatform(float tempX, float tempY) {
    super(tempX, tempY);
  }
  
  void interact(Player player) {
    if (!interacted) {
      interacted = true;
      playPlatformSound();
    }
    
    if (!healed) {
      player.health++;
      healed = true;
    }
    
    player.ySpeed = 0; // Reset the player's ySpeed
    player.y = y - player.h + player.feetOffset; // Place the player on top of the platform
    player.y -= speed; // Move the player up with the platform
  }

  void display() {
    // Use a different image for bouncy platforms
    float potionX = x - (potionW / 2) + (w / 2);
    float potionY = y - potionH - 5 - 10 * sin(TWO_PI * (frameCount / 60.0));
    
    if (!healed) {
      image(healPotionImage, potionX, potionY, potionW, potionH);
    }
    
    image(platformImage, x, y, w, h);
  }
  
  void playPlatformSound() {
    healSound.play(); // Play the bouncy platform sound
  }
}
