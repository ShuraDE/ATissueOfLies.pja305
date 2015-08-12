
class CfgSounds
{
  sounds[] = {snd_radio_indo, snd_mistake_music, snd_video_intro};

  class snd_radio_indo
  {
    name = "ADL_ATOL_SND_RADIO_INDO";
    sound[] = {"snd\indo_radio.ogg", "db+1", 1};
    titles[] = {0, ""};
  };  

  class snd_mistake_music
  {
    name = "ADL_ATOL_SND_MUSIC";
    sound[] = {"\snd\music.ogg", "db+1", 1};
    titles[] = {1, "next time more luck ;)"};
  };  
  
  class snd_video_intro
  {
    name = "ADL_ATOL_SND_VIDEO_INTRO";
    sound[] = {"\media\intro_audio.ogg", "db+1", 1};
    titles[] = {0, ""};
  };
};