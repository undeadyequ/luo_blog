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
- Energy mean(-0.3)
- Energy range(+0.3)
- Energy range(-0.3)
- Pitch mean(+0.3)
- Pitch mean(-0.3)
- Pitch range(+0.3)
- Pitch range(-0.3)

## Fine-conditioning on prosodic factors (Neutral = 1.0)
- Energy mean(+0.3)
- Energy mean(-0.3)
- Energy range(+0.3)
- Energy range(-0.3)
- Pitch mean(+0.3)
- Pitch mean(-0.3)
- Pitch range(+0.3)
- Pitch range(-0.3)

## Fine-conditioning on prominence (Angry)
- NOUN (+0.3)
- NOUN (-0.3)
- VERB (+0.3)
- VERB (-0.3)
- ADJ (+0.3)
- ADJ (-0.3)
- ADV (+0.3)
- ADV (-0.3)
## Fine-condtioning on prominence (Neutral)
- NOUN (+0.3)
- NOUN (-0.3)
- VERB (+0.3)
- VERB (-0.3)
- ADJ (+0.3)
- ADJ (-0.3)
- ADV (+0.3)
- ADV (-0.3)