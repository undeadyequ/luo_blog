## Model Architect
- STR model
  - Visual enhanced
  - Non-Visual Enchanced
    - DET
      - Character Region Awareness for Text Detection
        - 
      - Backbone
        - Mobile-net
      - Neck
        - FCN
      - Head
        - ?
    - REC
      - ?
  - Output
    - DET: [n_bbox, 4]      => Used in p/s detection
      - Extract Feature: [3, ]
    - REC: [n_word, ] => Used in Demand_C
      - Extract Feature: [n_word, tf-idf]
- Visual Model
  - ResNet50 + FN
    - Output: [v_units, ]


- Joint Model for detection
  - V+DET: [v_units + a(3), ]
    - a=3: n_bbox, aver_bbox, std_bbox
  [](../impl/)
- Joint Model for Fine-grained classification
  - Concatenate
    - V+REC: [v_units + rec_units, ]
  - ...


## Data
  - Categories: Racism, Strike, Woman March
  - UCLA data
    - Label
  - Target: Protest, Violence, 6 Attribute
  - ICDAR 2015


## Crowd-sourcing Label
  - bbox location
  - text label
  - classification

## Training Process
- Protest/Sign Detection
  - data: UCLA
  - V-DET(pretrained_by_icdar2015, fix)
  - Loss  

- Demand classification
  - Self_collected(5 categories)
  - V-DET(pretrained_by_icdar2015, 1.fix)
  - Loss

## Evaluation
  - Protest Detection
    - V-DET
  - Sign Detection
    - V-DET
  - Demand classification
    - V-DET
