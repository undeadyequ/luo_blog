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

# Emo_contrl_tts
### Discription
  - Capable to condition audio on emotional label
  - Capable to condition audio on emotional label with scale
  - Capable to condition audio on each prosody attribute

### Data
  - IEMOCAP
  - Blizzard13
    - filter expressive Data
      [implement](../impl/emo_contrl_tts_data.md)


### Emo_Feature
  - Extract Emo_feats
    - Sentence-level emo_feats
      - pitch, pitch range, **phone duration**, speech energy, and **spectral tilt**
      - 8
      => Test
      - Box Plot of max, min, aver, std of Emo_feats by IEMOCAP and Blizzard13
      - Should be similar

    - text feats


    - Normalization
      - Apply MaxMin of IEMOCAP to Blizzard13
      - If Blizzard13 is out of range, then set it to 0 or 1
    [implement](../impl/emo_contrl_tts.md)

### Model
#### SER model (Trained with Prosody Model)
  - DNN_3_256 with emo_feats
    - 8:256:256:8
  - LSTM_256 with emo_feats + tf_idf
    - 2???+8:256:8
  - Loss
    - BCE
  => Test by IEMOCAP evaluate data
  - f1
  - t-sne/PCR
  - confusion matrix
### Prosody Model
  - DNN_3_256
    - 6:256:256:6
  - VAE(Plan)
  - GLOW(Plan)
  - Loss
    - MSE
  => Test
  1. loss_all


### Tacotron2 Model
  - Train
    - Acoustic Model
      - Encoderd
      - Decoder with prosody input
    - Loss
  - Inference
    - Vocoder model (inference)
      - Mel -> Linear by invers_mel_basis matrix
      - Linear -> WAV by griffin_lim

### Training Process
  - Pre-train SER and Prosody by IEMOCAP
  - Fine-tune Prosody model and fix SER model in Tacotron2_controllable by




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
