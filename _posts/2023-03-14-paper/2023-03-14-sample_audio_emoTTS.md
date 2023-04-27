---
layout: post
title:  "Sample audio"
toc: true
---

{% include toc.html %}

# Paper
- Emotion-controllable Speech Synthesis using Emotion Soft Label, Utterance-level Prosodic Factors, and Word-level Prominence

# First-stage controlling: conditioning on emotion soft labels
- Angry = 1.0
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_ang_eng_mean_0_3_wav1_gen.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>

- Neutral = 1.0
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_neu_eng_mean_m0_3_wav1_gen.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>

# Second-stage controlling
## Fine-conditioning on prosodic factors (Angry = 1.0)
- Energy mean(+0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_ang_eng_mean_0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Energy mean(-0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_ang_eng_mean_m0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Energy range(+0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_ang_eng_range_0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Energy range(-0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_ang_eng_range_m0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Pitch mean(+0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_ang_pitch_mean_0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Pitch mean(-0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_ang_pitch_mean_m0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Pitch range(+0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_ang_pitch_range_0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
  
- Pitch range(-0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_ang_pitch_range_m0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>

## Fine-conditioning on prosodic factors (Neutral = 1.0)
- Energy mean(+0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_neu_eng_mean_0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Energy mean(-0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_neu_eng_mean_m0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Energy range(+0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_neu_eng_range_0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Energy range(-0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_neu_eng_range_m0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Pitch mean(+0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_neu_pitch_mean_0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Pitch mean(-0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_neu_pitch_mean_m0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
- Pitch range(+0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_neu_pitch_range_0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>
  
- Pitch range(-0.3)
  <audio controls="controls">
    <source type="audio/wav" src="/luo_blog/assets/audio/emo2psd_neu_pitch_range_m0_3_wav1_gen.wav"></source>
    <p>Your browser does not support the audio element.</p>
  </audio>

## Fine-condtioning on prominence (Angry)
- NOUN (+0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/ang_eng_mean_0_NOUN_03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- NOUN (-0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/ang_eng_mean_0_NOUN_-03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- VERB (+0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/ang_eng_mean_0_VERB_03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- VERB (-0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/ang_eng_mean_0_VERB_-03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- ADJ (+0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/ang_eng_mean_0_ADJ_03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- ADJ (-0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/ang_eng_mean_0_ADJ_-03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- ADV (+0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/neu_eng_mean_0_ADV_03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- ADV (-0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/neu_eng_mean_0_ADV_-03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>


## Fine-conditioning on prominence (Neutral)
- NOUN (+0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/neu_eng_mean_0_NOUN_03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- NOUN (-0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/neu_eng_mean_0_NOUN_-03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- VERB (+0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/neu_eng_mean_0_VERB_03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- VERB (-0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/neu_eng_mean_0_VERB_-03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- ADJ (+0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/neu_eng_mean_0_ADJ_03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- ADJ (-0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/neu_eng_mean_0_ADJ_-03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- ADV (+0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/neu_eng_mean_0_ADV_03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
- ADV (-0.3)
  <audio controls="controls">
  <source type="audio/wav" src="/luo_blog/assets/promTTS/neu_eng_mean_0_ADV_-03_2.wav"></source>
  <p>Your browser does not support the audio element.</p>
  </audio>
