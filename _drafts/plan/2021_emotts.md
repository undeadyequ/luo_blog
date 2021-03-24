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


### Pretrained model of SER
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

### Control TTS
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
    - prepare data
    - { 'ang': 0, 'hap': 1, 'exc': 2, 'sad': 3, 'fru': 4, 'fea': 5, 'sur': 6, 'neu': 7, 'xxx': 8, 'oth': 8}
    - { 'ang': 0, 'hap': 1, 'sad': 2, 'fea': 3, 'sur': 4, 'neu': 5 }

  - Blizzard13
    - filter expressive data by selecting wavs by emo_feats
      [implement](../impl/emo_contrl_tts_data.md)

  - Evaluation
    - Domain adaption

  Blizzard_log_quantile
  rmse_m   rmse_std rmse_range  harm_m  harm_std  pitch_m  pitch_std  pitch_range
  -28.5,    6.95,   37.df65,    -0.0,   52.13,    2.22,     0.05,   0.22
  -22.02,   13.19,  54.0,        0.0,    95.39,    2.32,    0.11,   0.53

  Blizzard_log_quantile
  rmse_m      rmse_std    rmse_range        harm_m      harm_std       pitch_m     pitch_std   pitch_range
  count  13060.000000  13060.000000  13060.000000  13060.000000  13060.000000  13060.000000  13060.000000  13060.000000
  mean       0.509693      0.460204      0.537154      0.522230      0.487762      0.478053      0.449045      0.419528
  std        0.381285      0.387774      0.384081      0.371655      0.381333      0.379150      0.383537      0.381082
  min        0.000000      0.000000      0.000000      0.000000      0.000000      0.000000      0.000000      0.000000
  25%        0.111089      0.060600      0.127795      0.144683      0.085849      0.089645      0.060676      0.049180
  50%        0.524048      0.392174      0.592376      0.551736      0.474266      0.446907      0.378253      0.311475
  75%        0.906372      0.886732      0.932329      0.889810      0.889111      0.874532      0.860387      0.803279
  max        1.000000      1.000000      1.000000      1.000000      1.000000      1.000000      1.000000      1.000000


  IEMOCAP_Log_quantile
  rmse_m    rmse_std   rmse_range  harm_m    harm_std   pitch_m  pitch_std   pitch_range
  -49.2,    6.9,       24.78,      -0.01,     4.29,     2.04,    0.07,        0.28
  -35.88,   10.8,      36.94,      -0.0,      20.62     2.36,    0.19,         0.66

- Log_quantile
  rmse_m      rmse_std    rmse_range        harm_m      harm_std       pitch_m     pitch_std   pitch_range
  count  10039.000000  10039.000000  10039.000000  10039.000000  10039.000000  10039.000000  10039.000000  10039.000000
  mean       0.497493      0.502523      0.505665      0.512509      0.436425      0.509742      0.474252      0.507691
  std        0.381745      0.380796      0.380126      0.380277      0.383585      0.386448      0.381175      0.385641
  min        0.000000      0.000000      0.000000      0.000000      0.000000      0.000000      0.000000      0.000000
  25%        0.101276      0.103566      0.108696      0.120499      0.052446      0.100678      0.082028      0.092105
  50%        0.487941      0.509804      0.513191      0.524346      0.353455      0.521584      0.435695      0.519737
  75%        0.903914      0.903428      0.901835      0.909323      0.831075      0.922275      0.883550      0.914474
  max        1.000000      1.000000      1.000000      1.000000      1.000000      1.000000      1.000000      1.000000


### Emo_Feature
    - Pitch, pitch range, **phone duration**, speech energy, and **spectral tilt**    
      - 3 pitch estimator, average log-pitch and log-pitch range(0.05-0.95) of voiced speech                                         X
      - force-align the text and audio               X
      - rmse: remove silence, log                    X
      - the framewise spectral tilt of voiced speech X
      - Log                                          OK
    - Sig(mean,std), rmse(mean,std), silence, harmonic, pitch(mean,std), auto_corrs(remove)
      - is used

    - Text feats
      - TF-IDF by Iemocap corpus

    - Normalization
      - Maxmin (set by Iemocap)
      - Maxmin with quantile

    => Evluation
    - Relation of emo-feature and Emo
               rmse_m  rmse_std  rmse_range    harm_m  harm_std   pitch_m  pitch_std  pitch_range
      label                                                                                      
      0      0.746662  0.740126    0.810585  0.441418  0.725736  0.708417   0.509198     0.580689
      1      0.633622  0.514699    0.587029  0.561291  0.552205  0.585950   0.501602     0.543579
      2      0.428508  0.454218    0.453034  0.495303  0.385762  0.460667   0.473085     0.508353
      3      0.423428  0.388659    0.360740  0.582310  0.312924  0.405324   0.388957     0.406828


    - Adaptive Problem: recognize emo by pre-trained SER in Blizzard13(only conversation)
                  rmse_m   rmse_std   rmse_range   harm_m    harm_std      pitch_m      pitch_std   pitch_range  ang_pred    hap_pred     sad_pred     neu_pred
      Emo count
      ang  299   0.791304   0.785686    0.950803   0.002809   0.875418    0.710234    0.505217    0.503411    0.846589    0.092709    0.059298    0.000569
      hap  828   0.887959   0.267210    0.446981   0.277850   0.803623    0.737198    0.473116    0.399686    0.033406    0.735254    0.187548    0.043539
      sad  1527  0.271159   0.571539    0.594984   0.167911   0.343399    0.380105    0.604650    0.626647    0.014368     0.061375   0.874237    0.049673
      neu  715   0.482965    0.250825    0.264070  0.357790    0.261483    0.377063    0.280252    0.276629    0.000657    0.056280    0.135650    0.807105

    - Conclude:
      - harm_m is mismatched
      - Feature is not enough to recognize Emotion
      - 


    - Should be similar
    [implement](../impl/emo_contrl_tts.md)



### Relation of emo-feature and Emo




### Model
#### SER model (Trained with Prosody Model)
  - DNN_3_256 with emo_feats
    - 8:256:256:8
  - LSTM_256 with emo_feats + tf_idf
    - 2???+8:256:8
  - Loss
    - BCE


  => Evaluation
  - f1
  - psd loss

  - Log feature + 4 emo
    |       | Audio[DNN]     | Text+Audio(LSTM) |
    | :------------- | :------------- | :- |
    | psd      | 0.097 | 0.00028 |
    | f1       | 0.41  | 0.61  |

    - Text + audio
    [[129  21  78   6]
     [ 15 224  53  24]
     [ 35  45 425  67]
     [ 13  42 174 125]]

  - no log feature + 6 emo

    |       | Audio[DNN]     | Text+Audio(LSTM) |
    | :------------- | :------------- | :- |
    | psd        |  0.008 | 0.0003  |
    | f1         |  0.47  | 0.67  |

    - Text + audio
    [[111  22  57  14   6  13]
     [  9 212  62  14   9  25]
     [ 44  39 411  22   7  73]
     [  0   0  13 214   0   0]
     [  1   8  33   8 181   8]
     [ 13  42 145  11   7 126]]


### Prosody Model
  - DNN_3_256
    - 6:256:256:6
  - VAE(Plan)
  - GLOW(Plan)
  - Loss
    - MSE
  => Test



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

  - Evalution

    |       | Audio[DNN]_140     | Text+Audio(LSTM)_epoch39 |
    | :------------- | :------------- | :- |
    | psd         | 0.004  |  0.024  |
    | BCE         |  0.007  | 0.032  |
    | MSE         |  0.125  |  0.164  |
    | L1          |  0.378  | 0.434  |
    | LOSS          |  0.514  | 0.655  |

  - Problem
    - The predicted emotion confidence for audo + text is nearly equal in 4 emos!!!
      - text fts problem?
      - audio fts problem?






epoch = 39 (LSTM)
l1_loss=0.434, mse_loss=0.164, bce_loss=0.032, psd_loss=0.024, attn_loss=0.001, loss=0.655, backward_time=1.128, optim_step_time=0.007, lr_0=1.000e-03, train_time=2.149

epoch = 140
 forward_time=0.886, l1_loss=0.378, mse_loss=0.125, bce_loss=0.007, psd_loss=0.004, attn_loss=3.287e-04, loss=0.514, backward_time=1.022, optim_step_time=0.005, lr_0=1.000e-03, train_time=1.921

epoch = 39
 forward_time=0.913, l1_loss=0.440, mse_loss=0.169, bce_loss=0.035, psd_loss=0.007, attn_loss=0.001, loss=0.651, backward_time=1.040, optim_step_time=0.006, lr_0=1.000e-03, train_time=2.017



### Training Process
  - Pre-train SER and Prosody by IEMOCAP
  - Fine-tune Prosody model and fix SER model in Tacotron2_controllable by

### Evaluation
  - SER pretrained
    - PSD loss
    - F1
  - emo ttssf
    - Attention Loss
    - BCE Loss
    - Mel MSE


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
