# Main Question
1. Is the proposed model prosody-controllable indeed with prosodic feature input? <= contrl_tts YES
  - Do Experiment as follow
  | Pitch     | Measured Pitch     |
  | :----------- | :---------- |
  | -1      |  -1      |
  | 0       |    0       |
  | 1       |   1       |

2. If 1 is yes, then how to generate emotion-specific prosody feature? <= emo_contrl_tts
  - Criterion
    - Correctness                     <=  Prosody model
      - Loss(gd_psd - pred_psd)
    - Computable
      - emo up => synthesized emo also up
        - f(emo_distribution) ~ f(emo_MOS_distribution)
        - 3_level/emo in MOS

  - NN, VAE, GLOW


### Pretrained model of SER  OK
  - Target
    1. emo_feats => 5 emos (Categories)       <=
    2. emo_feats => 2 axises (Continues)
  - Model
    - RF      <=
    - NN
  - Metric
    - F-score and Prosody_Loss
  - Data
    - Iemocap

### contrl_tts
  - Prosody Encoder (OK)
    - Linear Regression
  - Controller (Feature Extract)
    - Sentence-level
      - pitch, pitch range, **phone duration**, speech energy, and **spectral tilt**

  - Model Arch
    - Model selection
      - with emo lab
      - without emo lab  <= T
    - Minimize Error of Sentence Feature and Prosody  TD1
      - Add prosody loss into LOSS
    - inference
      - Vocoder
  - Experiment
    - ref_audios
      -
    - emo_labs
      -
    - emo_feats
      - teacher-forcing by emo_feats instead of encoded emo_feats (1_0.5h)
      -

### emo_contrl_tts
  - Prosody Model
    - Non-Rev NN
      - feats ->(RF) emos ->(NN) feats(prosody)   T   
      - feats ->(NN) emos ->(NN) feats(prosody)  <= NO VAE   (2_2h/2_20h: eval_A/eval_B)
      - feats ->(NN) emos ->(NN) feats(prosody)  <= VAE (3_?)
    - REV-NN(Reversible Neural Network)
      - feats ->(Glow) emos ->(NN) feats(prosody) <= (4_?)
    - Evaluate
      A. Loss(gd_psd - pred_psd)
      B. f(emo_distribution) ~ f(emo_MOS_distribution)


  - Training Process
      - pre-train (REV-NN) by emo_feats of IEMOCAP
        - Showed above
      - Fine-tune REV-NN along with Tacotron2 by Blizzard13
         - Fine tune or load pre-trained?
      -
    - feats ->
  3.1. Extract Emo_feats and feats
    - wav.scp -> emo_feats.csv 1h  OK
      - Use RF ?
      - multi-process to speed up ?
      - feature used ( no sig ?)
  3.2. modify contrl emoTTS model
    - Add emo_feats.csv to path_name_type args
    - input text, mels, emo_feats into model
      - prosody encoder with encoded text VS with encoded text and emo_distribution
    - emo_feats and emo_lab


Experiment
1. Model Selection
  - Basic(tacotron2)? VS Controllable TTS VS emo_controllable TTS  <= emo_ctrl Only firstly !
    - Exp Set in Control TTS paper?  controllability/MOE
    - Emo_controlling experiment set
2. Data
  - Jane_eyre
    - 22050 HZ
    - 2.7GB
    - Hours = 2.7GB/22050*2 = 17H
    - Expressive data
3. No expressive data VS Expressive Data
