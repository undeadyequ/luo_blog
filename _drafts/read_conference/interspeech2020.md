---
layout: post
title:  "interspeech_2020"
---

[Interspeech_2020](https://www.isca-speech.org/archive/Interspeech_2020/)

## Speech Synthesis Paradigms and Methods I



## Speech Synthesis: Prosody Modeling

[Interactive Text-to-Speech System via Joint Style Analysis](https://www.isca-speech.org/archive/Interspeech_2020/pdfs/3069.pdf)
  - Problem
    - domain mismatch in Emotional recognition
    - Prosody transfer suffer poor performance
  - Method
    - Separated prosody model, input with style/linguistic embedding and output with F0/Duration, etc, from acoustic model, input with linguistic/prosodic_output and output with MFCC
    - Training style extraction model based on text+audio multimodal by IEMOCAP + small labeled TTS data
    - Use MFCC instead of mel spectrogram


[CopyCat: Many-to-Many Fine-Grained Prosody Transfer for Neural Text-to-Speech](https://www.isca-speech.org/archive/Interspeech_2020/pdfs/1251.pdf) **
  - Problem
    - Reference encoder suffer with source speaker leakage
    - Segmental quality of sample is bad
  - Method(1)
    - **Instance Normalization**, input with source speaker identity, Mel-spectrogram, upsampled phoneme based on the hypothesis that constant factor can be removed by mean and std
    - Conditional Variational Encoding, which get time-dependent latent prosodic representation
    - bottleneck encoder to reduce source speaker identity by constrain H size?
  - Method(2)
    - self-attention discriminator and hinge version of Adversarial loss by input with random window size of synthesized audio

[https://www.isca-speech.org/archive/Interspeech_2020/pdfs/1284.pdf](Joint detection of sentence stress and phrase boundary for prosody)
  - Problem
    - limited contextual information (?)
    - little Interaction between stress and phrase boundary (?)
  - Other
    - prosodic event detection

[Transfer learning of the expressivity using FLOW metric learning in
multispeaker text-to-speech synthesis](https://www.isca-speech.org/archive/Interspeech_2020/pdfs/1297.pdf)
 - Inverse Autoregressive flow(IAF) flexible approximate posterior distribution
 -

 [Dynamic Prosody Generation for Speech Synthesis Using Linguistics-Driven
Acoustic Embedding Selection](https://www.isca-speech.org/archive/Interspeech_2020/pdfs/1411.pdf)  **
  - Pro: poor Dynamic Variation
  - Method
    - exploit linguistic info in vae
    - Contribution of semantic and syntactic feature to Dynamic Variation

[Improving the Prosody of RNN-based English Text-To-Speech Synthesis by
Incorporating a BERT model](https://www.isca-speech.org/archive/Interspeech_2020/pdfs/1430.pdf)
  - Bert improve prosody and long sentence

[Controllable neural text-to-speech synthesis using intuitive prosodic features](https://arxiv.org/pdf/2009.06775.pdf)
[PPT](https://speakerdeck.com/beeeee/is2020du-mihui-zi-liao)
  - utterance-wise acoustic feature(showed below) used to append to text embedding is used to control speech intuitively
  - log-pitch range, log-phone duration, log-energy, and spectral tilt
