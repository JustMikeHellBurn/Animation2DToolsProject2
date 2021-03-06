﻿/*
 * Author Names: 
 *  Justin Hellsten  (http://justinhellsten.com/)
 *  Michael Burnie   (http://michaelburnie.com/)
 *
 * Source File Name: Jibbly.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *  Handles the main character, Jibbly. 
 *  
 * Revision History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *    
 */
 package objects {
	import citrus.objects.platformer.box2d.Hero;
	import citrus.view.starlingview.AnimationSequence;
	import citrus.core.CitrusEngine;
	import citrus.input.controllers.Keyboard;
	import citrus.objects.CitrusSprite;
	import states.PlayState;
	import states.BaseState;
	import flash.media.SoundTransform;
	import starling.core.Starling;
	import states.SplashState;
	
	public class Jibbly extends Hero {
		
		//create the primary variables
		public var health:Number;
		public var lives:int;
		private var ce:CitrusEngine;
		private var isShooting:Boolean;
		private var isTelporting:Boolean;
		private var isJumping:Boolean;
		private var gotHit:Boolean;
		
		private var startX:Number;
		private var startY:Number;
		
		public function Jibbly(name:String, params:Object=null) {
			super(name, params);
			startX = x;
			startY = y;
			health = 3;
			lives = 3;
			view = new AnimationSequence(Assets.jibblyAtlas, ["walk", "idle", "jump", "fall", "hurt", "shoot", "telein", "teleout"], "walk", 15);
			view.onAnimationComplete.add(onAnimationOver);
			canDuck = false;
			isShooting = false;
			isJumping = true;
			gotHit = false;
			// Set Keyboard Actions
			ce = CitrusEngine.getInstance();
			var kb:Keyboard = ce.input.keyboard;
			kb.addKeyAction("shoot", Keyboard.Z);
			kb.addKeyAction("tele", Keyboard.T);
			kb.addKeyAction("jump", Keyboard.SPACE);
		}
		
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);

			// Check if poort jibbly is hurt
			if (_hurt && !gotHit) {
				Assets.hurtSound.play(0, 0, new SoundTransform(0.5));
				gotHit = true;
			}
			
			if (getWalkingSpeed() != 0 && onGround) {
				_animation = "walk";
			} 
			
			if (onGround) isJumping = false; 
			
			if (!onGround && !isJumping && !gotHit && ce.input.justDid("jump")) {
				isJumping = true;
				Assets.jumpSound.play(0, 0, new SoundTransform(0.5));
			}
			
			if (getWalkingSpeed() < 0) {
				_inverted = false;
			} else if (getWalkingSpeed() > 0) {
				_inverted = true;
			} 
			
			// Shoot Bullet
			if (ce.input.justDid("shoot")) {
				isShooting = true;
				CitrusEngine.getInstance().state.add(new Bullet("bullet", {x:this.x + (_inverted ? this.width : -this.width), y:this.y, speed: _inverted ? 4 : -4}));
				Assets.shootSound.play(0, 0, new SoundTransform(0.5));
			} 

			if (isShooting) {
				_animation = "shoot";
			}

			
			// Check if jibbly has fallen to his death (this is a hack because we are assuming all maps are the same height)
			if (y + height > 1500) {
				reset();
				Assets.hurtSound.play(0, 0, new SoundTransform(0.5));
			}
			
			// Check if going through portals
			var portal:Portal = CitrusEngine.getInstance().state.getObjectByName("portal") as Portal;
			var playPortal:PlayPortal = CitrusEngine.getInstance().state.getObjectByName("playPortal") as PlayPortal;
			var exitPortal:ExitPortal = CitrusEngine.getInstance().state.getObjectByName("exitPortal") as ExitPortal;
			
			// Check if Jibbly can teleport
			if (portal != null && x + width > portal.x && y + height > portal.y && x < portal.x + portal.width && y < portal.y + portal.height && ce.input.justDid("tele")) {
				isTelporting = true;
				_controlsEnabled = false;
				Assets.teleportSound.play(0, 0, new SoundTransform(0.5));
			}
			if (playPortal != null && x + width > playPortal.x && y + height > playPortal.y && x < playPortal.x + playPortal.width && y < playPortal.y + playPortal.height && ce.input.justDid("tele")) {
				isTelporting = true;
				_controlsEnabled = false;
				(CitrusEngine.getInstance().state as BaseState).nextState = new PlayState();
				Assets.teleportSound.play(0, 0, new SoundTransform(0.5));
			}
			if (exitPortal != null && x + width > exitPortal.x && y + height > exitPortal.y && x < exitPortal.x + exitPortal.width && y < exitPortal.y + exitPortal.height && ce.input.justDid("tele")) {
				isTelporting = true;
				_controlsEnabled = false;
				(CitrusEngine.getInstance().state as BaseState).nextState = new SplashState();
				Assets.teleportSound.play(0, 0, new SoundTransform(0.5));
			}
			
			if (isTelporting) {
				_animation = "teleout";
			}
			
		}
		
		
		public function reset():void {
			// Reset Jibbly to the start of the level
			x = startX;
			y = startY;
			health = 3;
			lives -= 1;
			gotHit = false;
			if (lives == 0) CitrusEngine.getInstance().state.destroy();
		}
		
		protected function onAnimationOver(name:String):void
		{
			//check animations, when over do the following
			if (name == "hurt") {
				health -= 1;
				gotHit = false;
				_hurt = false;
			}
			if (health == 0) reset();
			if (name == "shoot") isShooting = false;
			if (name == "teleout") { 
				isTelporting = false;
				_controlsEnabled = true;
				CitrusEngine.getInstance().state.destroy();
			}
		}
		
	}
	
}
