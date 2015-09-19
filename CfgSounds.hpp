class CfgSFX {
	sounds[] = {};
	class sfx_mistake_music {
		name = "sfx_mistake_music";
		sounds[]={sound1};
		sound1[]={"snd\music.ogg",1,1,50,1,0,0,0};
		empty[]= {"",0,0,0,0,0,0,0};
	};
};

class CfgSounds
{
  sounds[] = {snd_radio_indo, snd_mistake_music, snd_video_intro, NoSound};

  class snd_radio_indo {
    name = "ADL_ATOL_SND_RADIO_INDO";
    sound[] = {"@GA_MIS_ATOL\audio\indo_radio.ogg", "db+1", 1};
    titles[] = {0, ""};
  };

  class snd_mistake_music {
    name = "ADL_ATOL_SND_MUSIC";
    sound[] = {"@GA_MIS_ATOL\audio\music.ogg", "db+1", 1};
    titles[] = {1, "next time more luck ;)"};
  };

  class snd_video_intro {
    name = "ADL_ATOL_SND_VIDEO_INTRO";
    sound[] = {"@GA_MIS_ATOL\audio\intro_video_ts.ogg", "db+1", 1};
    titles[] = {0, ""};
  };

	class snd_scream_man {
    name = "ADL_ATOL_SND_VIDEO_INTRO";
    sound[] = {"@GA_MIS_ATOL\audio\scream_man.ogg", "db+1", 1};
    titles[] = {0, ""};
  };


  class NoSound {
	name = "NoSound";
	sound[] = {"", 0, 1};
	titles[] = {};
  };
};
