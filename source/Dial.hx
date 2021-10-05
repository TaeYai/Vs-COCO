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

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			FlxTween.tween(box, {alpha: 7.0}, 0);
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'pico':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('dia');
				box.animation.addByPrefix('normalOpen', 'in', 24, false);
				box.animation.addByIndices('normal', 'in', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		var portraitLeft:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('CUTscene_1'));
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;
		portraitLeft.screenCenter(Y);
		portraitLeft.screenCenter(X);
		
		var portraitLeftq:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('CUTscene_2'));
		portraitLeftq.updateHitbox();
		portraitLeftq.scrollFactor.set();
		add(portraitLeftq);
		portraitLeftq.visible = false;
		portraitLeftq.screenCenter(Y);
		portraitLeftq.screenCenter(X);
		
		var portraitLeftw:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_3'));
		portraitLeftw.updateHitbox();
		portraitLeftw.scrollFactor.set();
		add(portraitLeftw);
		portraitLeftw.visible = false;
		portraitLeftw.screenCenter(Y);
		portraitLeftw.screenCenter(X);
				
		var portraitLefte:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_3_actually'));
		portraitLefte.updateHitbox();
		portraitLefte.scrollFactor.set();
		add(portraitLefte);
		portraitLefte.visible = false;
		portraitLefte.screenCenter(Y);
		portraitLefte.screenCenter(X);

		var portraitLeftr:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_4'));
		portraitLeftr.updateHitbox();
		portraitLeftr.scrollFactor.set();
		add(portraitLeftr);
		portraitLeftr.visible = false;
		portraitLeftr.screenCenter(Y);
		portraitLeftr.screenCenter(X);
				
		var portraitLefts:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_5'));
		portraitLefts.updateHitbox();
		portraitLefts.scrollFactor.set();
		add(portraitLefts);
		portraitLefts.visible = false;
		portraitLefts.screenCenter(Y);
		portraitLefts.screenCenter(X);
		
		var portraitLeftc:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_6'));
		portraitLeftc.updateHitbox();
		portraitLeftc.scrollFactor.set();
		add(portraitLeftc);
		portraitLeftc.visible = false;
		portraitLeftc.screenCenter(Y);
		portraitLeftc.screenCenter(X);
		
		var portraitLeftqv:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_7.1'));
		portraitLeftqv.updateHitbox();
		portraitLeftqv.scrollFactor.set();
		add(portraitLeftqv);
		portraitLeftqv.visible = false;
		portraitLeftqv.screenCenter(Y);
		portraitLeftqv.screenCenter(X);
				
		var portraitLeftwb:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_7.2'));
		portraitLeftwb.updateHitbox();
		portraitLeftwb.scrollFactor.set();
		add(portraitLeftwb);
		portraitLeftwb.visible = false;
		portraitLeftwb.screenCenter(Y);
		portraitLeftwb.screenCenter(X);
				
		var portraitLeften:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_7.3'));
		portraitLeften.updateHitbox();
		portraitLeften.scrollFactor.set();
		add(portraitLeften);
		portraitLeften.visible = false;
		portraitLeften.screenCenter(Y);
		portraitLeften.screenCenter(X);
				
		var portraitLeftrm:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_8.1'));
		portraitLeftrm.updateHitbox();
		portraitLeftrm.scrollFactor.set();
		add(portraitLeftrm);
		portraitLeftrm.visible = false;
		portraitLeftrm.screenCenter(Y);
		portraitLeftrm.screenCenter(X);
				
		var portraitLeftsb:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_8.2'));
		portraitLeftsb.updateHitbox();
		portraitLeftsb.scrollFactor.set();
		add(portraitLeftsb);
		portraitLeftsb.visible = false;
		portraitLeftsb.screenCenter(Y);
		portraitLeftsb.screenCenter(X);
		
		var portraitLeftp:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_8.3'));
		portraitLeftp.updateHitbox();
		portraitLeftp.scrollFactor.set();
		add(portraitLeftp);
		portraitLeftp.visible = false;
		portraitLeftp.screenCenter(Y);
		portraitLeftp.screenCenter(X);
		
		var portraitLeftqo:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_9'));
		portraitLeftqo.updateHitbox();
		portraitLeftqo.scrollFactor.set();
		add(portraitLeftqo);
		portraitLeftqo.visible = false;
		portraitLeftqo.screenCenter(Y);
		portraitLeftqo.screenCenter(X);
		
		var portraitLeftwi:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_10.1'));
		portraitLeftwi.updateHitbox();
		portraitLeftwi.scrollFactor.set();
		add(portraitLeftwi);
		portraitLeftwi.visible = false;
		portraitLeftwi.screenCenter(Y);
		portraitLeftwi.screenCenter(X);
		
		var portraitLefteu:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_10.2'));
		portraitLefteu.updateHitbox();
		portraitLefteu.scrollFactor.set();
		add(portraitLefteu);
		portraitLefteu.visible = false;
		portraitLefteu.screenCenter(Y);
		portraitLefteu.screenCenter(X);
		
		var portraitLeftry:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_10.3'));
		portraitLeftry.updateHitbox();
		portraitLeftry.scrollFactor.set();
		add(portraitLeftry);
		portraitLeftry.visible = false;
		portraitLeftry.screenCenter(Y);
		portraitLeftry.screenCenter(X);
		
		var portraitLeftst:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_11.1'));
		portraitLeftst.updateHitbox();
		portraitLeftst.scrollFactor.set();
		add(portraitLeftst);
		portraitLeftst.visible = false;
		portraitLeftst.screenCenter(Y);
		portraitLeftst.screenCenter(X);

		var portraitLeftcr:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_11.2'));
		portraitLeftcr.updateHitbox();
		portraitLeftcr.scrollFactor.set();
		add(portraitLeftcr);
		portraitLeftcr.visible = false;
		portraitLeftcr.screenCenter(Y);
		portraitLeftcr.screenCenter(X);

		var portraitLeftqvr:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_11.3'));
		portraitLeftqvr.updateHitbox();
		portraitLeftqvr.scrollFactor.set();
		add(portraitLeftqvr);
		portraitLeftqvr.visible = false;
		portraitLeftqvr.screenCenter(Y);
		portraitLeftqvr.screenCenter(X);
				
		var portraitLeftwbr:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_7.2'));
		portraitLeftwbr.updateHitbox();
		portraitLeftwbr.scrollFactor.set();
		add(portraitLeftwbr);
		portraitLeftwbr.visible = false;
		portraitLeftwbr.screenCenter(Y);
		portraitLeftwbr.screenCenter(X);
		
		var portraitLeftene:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_12'));
		portraitLeftene.updateHitbox();
		portraitLeftene.scrollFactor.set();
		add(portraitLeftene);
		portraitLeftene.visible = false;
		portraitLeftene.screenCenter(Y);
		portraitLeftene.screenCenter(X);
		
		var portraitLeftrmw:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_14'));
		portraitLeftrmw.updateHitbox();
		portraitLeftrmw.scrollFactor.set();
		add(portraitLeftrmw);
		portraitLeftrmw.visible = false;
		portraitLeftrmw.screenCenter(Y);
		portraitLeftrmw.screenCenter(X);
				
		var portraitLeftsbw:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('scene_14_i_swear'));
		portraitLeftsbw.frames = Paths.getSparrowAtlas('scene_14_i_swear');
		portraitLeftsbw.updateHitbox();
		portraitLeftsbw.scrollFactor.set();
		add(portraitLeftsbw);
		portraitLeftsbw.visible = false;
		portraitLeftsbw.screenCenter(Y);
		portraitLeftsbw.screenCenter(X);
		
		var portraitLeftsbwq:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('last_cutscene1'));
		portraitLeftsbwq.updateHitbox();
		portraitLeftsbwq.scrollFactor.set();
		add(portraitLeftsbwq);
		portraitLeftsbwq.visible = false;
		portraitLeftsbwq.screenCenter(Y);
		portraitLeftsbwq.screenCenter(X);
		
		portraitRight = new FlxSprite(0, 40);
		portraitRight.frames = Paths.getSparrowAtlas('bfport');
		portraitRight.animation.addByPrefix('enter', 'bfport', 24, false);
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;
		
		box.animation.play('normalOpen');
		box.updateHitbox();
		add(box);
		box.screenCenter(Y);

		box.screenCenter(X);
		portraitLeft.screenCenter(X);

		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'VCR OSD Mono';
		dropText.color = FlxColor.GRAY;

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.setFormat(Paths.font("papermario.ttf"), 36);
		swagDialogue.color = 0xFF1E1A19;
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
		if (PlayState.SONG.song.toLowerCase() == 'pico')
			portraitLeft.visible = false;
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

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					FlxTween.tween(box, {alpha: 0}, 1.0);
					FlxTween.tween(bgFade, {alpha: 0}, 1.0);
					FlxTween.tween(portraitLeft, {alpha: 0}, 1.0);
					FlxTween.tween(portraitRight, {alpha: 0}, 1.0);
					FlxTween.tween(swagDialogue, {alpha: 0}, 1.0);
					FlxTween.tween(dropText, {alpha: 0}, 1.0);
					box.animation.play('close');

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
			case '1':
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
				}
				
			case 'bf':
				portraitLeft.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
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
