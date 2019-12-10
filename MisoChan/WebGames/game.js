window.onload = function() {
  // 00 AUTO try WEBGL 1st, fallback CANVAS
  var game = new Phaser.Game(window.innerWidth-16, window.innerHeight, Phaser.AUTO, 'chang-main', { preload, create, update });
  function preload () {
    game.load.image('logo', 'phaser.png');
  }
  function create () {
    const logo = game.add.sprite(game.world.centerX, game.world.centerY, 'logo');
    logo.anchor.setTo(0.5, 0.5);
  }
  function update () {
    
  }
};
