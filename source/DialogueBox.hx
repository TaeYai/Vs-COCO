package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';
	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitBFhappy:FlxSprite;
	var portraitBFmeh:FlxSprite;
	var portraitBFshocked:FlxSprite;
	var portraitBFaaa:FlxSprite;
	var portraitBFconcern:FlxSprite;
	var portraitBFcurious:FlxSprite;
	var portraitCocoTalk:FlxSprite;
	var portraitCocoHappy:FlxSprite;
	var portraitCocoEhe:FlxSprite;
	var portraitCocoSweat:FlxSprite;
	var portraitSketchGrump:FlxSprite;
	var portraitSketchOK:FlxSprite;

	var handSelect:FlxSprite;
	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'mango':
				FlxG.sound.playMusic(Paths.music('breakfast'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
				
		}

		box = new FlxSprite(-20, 60);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'calm':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [4], "", 24);
				box.scale.set(5, 5);
				
			case 'joyful':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [4], "", 24);
				box.scale.set(5, 5);
				
			case 'calm-paster':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [4], "", 24);
				box.scale.set(5, 5);
	
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		
		portraitLeft = new FlxSprite(0, 210);
		portraitLeft.frames = Paths.getSparrowAtlas('port_an');
		portraitLeft.animation.addByPrefix('enter', 'portrait an', 24, false);
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;
		
		portraitCocoEhe = new FlxSprite(150, 210);
		portraitCocoEhe.frames = Paths.getSparrowAtlas('portraits/coco_ehe');
		portraitCocoEhe.animation.addByPrefix('enter', 'coco_ehe', 24, false);
		portraitCocoEhe.updateHitbox();
		portraitCocoEhe.scrollFactor.set();
		add(portraitCocoEhe);
		portraitCocoEhe.visible = false;

		portraitCocoTalk = new FlxSprite(150, 210);
		portraitCocoTalk.frames = Paths.getSparrowAtlas('portraits/coco_talk');
		portraitCocoTalk.animation.addByPrefix('enter', 'coco_talk', 24, false);
		portraitCocoTalk.updateHitbox();
		portraitCocoTalk.scrollFactor.set();
		add(portraitCocoTalk);
		portraitCocoTalk.visible = false;

		portraitCocoSweat = new FlxSprite(150, 210);
		portraitCocoSweat.frames = Paths.getSparrowAtlas('portraits/coco_sweat');
		portraitCocoSweat.animation.addByPrefix('enter', 'coco_sweat', 24, false);
		portraitCocoSweat.updateHitbox();
		portraitCocoSweat.scrollFactor.set();
		add(portraitCocoSweat);
		portraitCocoSweat.visible = false;

		portraitCocoHappy = new FlxSprite(150, 210);
		portraitCocoHappy.frames = Paths.getSparrowAtlas('portraits/coco_happy');
		portraitCocoHappy.animation.addByPrefix('enter', 'coco_happy', 24, false);
		portraitCocoHappy.updateHitbox();
		portraitCocoHappy.scrollFactor.set();
		add(portraitCocoHappy);
		portraitCocoHappy.visible = false;

		portraitSketchGrump = new FlxSprite(150, 210);
		portraitSketchGrump.frames = Paths.getSparrowAtlas('portraits/sketch_grump');
		portraitSketchGrump.animation.addByPrefix('enter', 'sketch_grump', 24, false);
		portraitSketchGrump.updateHitbox();
		portraitSketchGrump.scrollFactor.set();
		add(portraitSketchGrump);
		portraitSketchGrump.visible = false;

		portraitSketchOK = new FlxSprite(150, 210);
		portraitSketchOK.frames = Paths.getSparrowAtlas('portraits/sketch_ok');
		portraitSketchOK.animation.addByPrefix('enter', 'sketch_ok', 24, false);
		portraitSketchOK.updateHitbox();
		portraitSketchOK.scrollFactor.set();
		add(portraitSketchOK);
		portraitSketchOK.visible = false;

		portraitBFhappy = new FlxSprite(845, 224);
		portraitBFhappy.frames = Paths.getSparrowAtlas('portraits/bf_happy');
		portraitBFhappy.animation.addByPrefix('enter', 'bf_happy', 24, false);
		portraitBFhappy.updateHitbox();
		portraitBFhappy.scrollFactor.set();
		add(portraitBFhappy);
		portraitBFhappy.visible = false;

		portraitBFaaa = new FlxSprite(845, 224);
		portraitBFaaa.frames = Paths.getSparrowAtlas('portraits/bf_aaa');
		portraitBFaaa.animation.addByPrefix('enter', 'bf_aaa', 24, false);
		portraitBFaaa.updateHitbox();
		portraitBFaaa.scrollFactor.set();
		add(portraitBFaaa);
		portraitBFaaa.visible = false;

		portraitBFconcern = new FlxSprite(845, 224);
		portraitBFconcern.frames = Paths.getSparrowAtlas('portraits/bf_concern');
		portraitBFconcern.animation.addByPrefix('enter', 'bf_concern', 24, false);
		portraitBFconcern.updateHitbox();
		portraitBFconcern.scrollFactor.set();
		add(portraitBFconcern);
		portraitBFconcern.visible = false;

		portraitBFcurious = new FlxSprite(845, 224);
		portraitBFcurious.frames = Paths.getSparrowAtlas('portraits/bf_curious');
		portraitBFcurious.animation.addByPrefix('enter', 'bf_curious', 24, false);
		portraitBFcurious.updateHitbox();
		portraitBFcurious.scrollFactor.set();
		add(portraitBFcurious);
		portraitBFcurious.visible = false;

		portraitBFmeh = new FlxSprite(845, 224);
		portraitBFmeh.frames = Paths.getSparrowAtlas('portraits/bf_meh');
		portraitBFmeh.animation.addByPrefix('enter', 'bf_meh', 24, false);
		portraitBFmeh.updateHitbox();
		portraitBFmeh.scrollFactor.set();
		add(portraitBFmeh);
		portraitBFmeh.visible = false;

		portraitBFshocked = new FlxSprite(845, 224);
		portraitBFshocked.frames = Paths.getSparrowAtlas('portraits/bf_shocked');
		portraitBFshocked.animation.addByPrefix('enter', 'bf_shocked', 24, false);
		portraitBFshocked.updateHitbox();
		portraitBFshocked.scrollFactor.set();
		add(portraitBFshocked);
		portraitBFshocked.visible = false;
		
		portraitRight = new FlxSprite(845, 224);
		portraitRight.frames = Paths.getSparrowAtlas('bfport');
		portraitRight.animation.addByPrefix('enter', 'bfport', 24, false);
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;
		
		box.animation.play('normalOpen');
		box.updateHitbox();
		add(box);

		box.screenCenter(X);

		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'VCR OSD Mono';
		dropText.color = FlxColor.GRAY;

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.setFormat(Paths.font("papermario.ttf"), 36);
		swagDialogue.color = FlxColor.WHITE;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{	
			FlxG.sound.play(Paths.sound('dialogueIn'));
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'mango' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);
						
					FlxTween.tween(box, {alpha: 0}, 1.0);
					FlxTween.tween(portraitLeft, {alpha: 0}, 1.0);
					FlxTween.tween(portraitRight, {alpha: 0}, 1.0);
					FlxTween.tween(swagDialogue, {alpha: 0}, 1.0);
					FlxTween.tween(dropText, {alpha: 0}, 1.0);
					box.animation.play('close');
					FlxG.sound.play(Paths.sound('dialogueOut'));

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}

			case 'cocotalk':
				portraitBFcurious.visible = false;
				portraitBFhappy.visible = false;
				portraitBFaaa.visible = false;
				portraitBFmeh.visible = false;
				portraitBFshocked.visible = false;
				portraitBFconcern.visible = false;
				portraitCocoEhe.visible = false;
				portraitCocoHappy.visible = false;
				portraitCocoSweat.visible = false;
				portraitSketchOK.visible = false;
				portraitSketchGrump.visible = false;
				if (!portraitCocoTalk.visible)
				{
					portraitCocoTalk.visible = true;
					portraitCocoTalk.animation.play('enter');
				}
			
			case 'cocoehe':
				portraitBFcurious.visible = false;
				portraitBFhappy.visible = false;
				portraitBFaaa.visible = false;
				portraitBFmeh.visible = false;
				portraitBFshocked.visible = false;
				portraitBFconcern.visible = false;
				portraitCocoTalk.visible = false;
				portraitCocoHappy.visible = false;
				portraitCocoSweat.visible = false;
				portraitSketchOK.visible = false;
				portraitSketchGrump.visible = false;
				if (!portraitCocoEhe.visible)
				{
					portraitCocoEhe.visible = true;
					portraitCocoEhe.animation.play('enter');
				}
			
			case 'cocohappy':
				portraitBFcurious.visible = false;
				portraitBFhappy.visible = false;
				portraitBFaaa.visible = false;
				portraitBFmeh.visible = false;
				portraitBFshocked.visible = false;
				portraitBFconcern.visible = false;
				portraitCocoEhe.visible = false;
				portraitCocoTalk.visible = false;
				portraitCocoSweat.visible = false;
				portraitSketchOK.visible = false;
				portraitSketchGrump.visible = false;
				if (!portraitCocoHappy.visible)
				{
					portraitCocoHappy.visible = true;
					portraitCocoHappy.animation.play('enter');
				}
			
			case 'cocosweat':
				portraitBFcurious.visible = false;
				portraitBFhappy.visible = false;
				portraitBFaaa.visible = false;
				portraitBFmeh.visible = false;
				portraitBFshocked.visible = false;
				portraitBFconcern.visible = false;
				portraitCocoEhe.visible = false;
				portraitCocoHappy.visible = false;
				portraitCocoTalk.visible = false;
				portraitSketchOK.visible = false;
				portraitSketchGrump.visible = false;
				if (!portraitCocoSweat.visible)
				{
					portraitCocoSweat.visible = true;
					portraitCocoSweat.animation.play('enter');
				}
			
			case 'bfhappy':
				portraitBFcurious.visible = false;
				portraitBFaaa.visible = false;
				portraitBFmeh.visible = false;
				portraitBFshocked.visible = false;
				portraitBFconcern.visible = false;
				portraitCocoTalk.visible = false;
				portraitCocoEhe.visible = false;
				portraitCocoHappy.visible = false;
				portraitCocoSweat.visible = false;
				portraitSketchOK.visible = false;
				portraitSketchGrump.visible = false;
				if (!portraitBFhappy.visible)
				{
					portraitBFhappy.visible = true;
					portraitBFhappy.animation.play('enter');
				}
			
			case 'bfaaa':
				portraitBFcurious.visible = false;
				portraitBFhappy.visible = false;
				portraitBFmeh.visible = false;
				portraitBFshocked.visible = false;
				portraitBFconcern.visible = false;
				portraitCocoTalk.visible = false;
				portraitCocoEhe.visible = false;
				portraitCocoHappy.visible = false;
				portraitCocoSweat.visible = false;
				portraitSketchOK.visible = false;
				portraitSketchGrump.visible = false;
				if (!portraitBFaaa.visible)
				{
					portraitBFaaa.visible = true;
					portraitBFaaa.animation.play('enter');
				}
			
			case 'bfconcern':
				portraitBFcurious.visible = false;
				portraitBFaaa.visible = false;
				portraitBFmeh.visible = false;
				portraitBFshocked.visible = false;
				portraitBFhappy.visible = false;
				portraitCocoTalk.visible = false;
				portraitCocoEhe.visible = false;
				portraitCocoHappy.visible = false;
				portraitCocoSweat.visible = false;
				portraitSketchOK.visible = false;
				portraitSketchGrump.visible = false;
				if (!portraitBFconcern.visible)
				{
					portraitBFconcern.visible = true;
					portraitBFconcern.animation.play('enter');
				}
			
			case 'bfcurious':
				portraitBFhappy.visible = false;
				portraitBFaaa.visible = false;
				portraitBFmeh.visible = false;
				portraitBFshocked.visible = false;
				portraitBFconcern.visible = false;
				portraitCocoTalk.visible = false;
				portraitCocoEhe.visible = false;
				portraitCocoHappy.visible = false;
				portraitCocoSweat.visible = false;
				portraitSketchOK.visible = false;
				portraitSketchGrump.visible = false;
				if (!portraitBFcurious.visible)
				{
					portraitBFcurious.visible = true;
					portraitBFcurious.animation.play('enter');
				}
			

			case 'bfshocked':
				portraitBFcurious.visible = false;
				portraitBFaaa.visible = false;
				portraitBFmeh.visible = false;
				portraitBFhappy.visible = false;
				portraitBFconcern.visible = false;
				portraitCocoTalk.visible = false;
				portraitCocoEhe.visible = false;
				portraitCocoHappy.visible = false;
				portraitCocoSweat.visible = false;
				portraitSketchOK.visible = false;
				portraitSketchGrump.visible = false;
				if (!portraitBFshocked.visible)
				{
					portraitBFshocked.visible = true;
					portraitBFshocked.animation.play('enter');
				}
			
			case 'bfmeh':
				portraitBFcurious.visible = false;
				portraitBFaaa.visible = false;
				portraitBFhappy.visible = false;
				portraitBFshocked.visible = false;
				portraitBFconcern.visible = false;
				portraitCocoTalk.visible = false;
				portraitCocoEhe.visible = false;
				portraitCocoHappy.visible = false;
				portraitCocoSweat.visible = false;
				portraitSketchOK.visible = false;
				portraitSketchGrump.visible = false;
				if (!portraitBFmeh.visible)
				{
					portraitBFmeh.visible = true;
					portraitBFmeh.animation.play('enter');
				}

			case 'sketchgrump':
					portraitBFcurious.visible = false;
					portraitBFhappy.visible = false;
					portraitBFaaa.visible = false;
					portraitBFmeh.visible = false;
					portraitBFshocked.visible = false;
					portraitBFconcern.visible = false;
					portraitCocoEhe.visible = false;
					portraitCocoTalk.visible = false;
					portraitCocoSweat.visible = false;
					portraitSketchOK.visible = false;
					portraitCocoHappy.visible = false;
					if (!portraitSketchGrump.visible)
					{
						portraitSketchGrump.visible = true;
						portraitSketchGrump.animation.play('enter');
					}
			
			case 'sketchok':
				portraitBFcurious.visible = false;
				portraitBFhappy.visible = false;
				portraitBFaaa.visible = false;
				portraitBFmeh.visible = false;
				portraitBFshocked.visible = false;
				portraitBFconcern.visible = false;
				portraitCocoEhe.visible = false;
				portraitCocoTalk.visible = false;
				portraitCocoSweat.visible = false;
				portraitCocoHappy.visible = false;
				portraitSketchGrump.visible = false;
				if (!portraitSketchOK.visible)
				{
					portraitSketchOK.visible = true;
					portraitSketchOK.animation.play('enter');
				}
			
			
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();

	}
}
