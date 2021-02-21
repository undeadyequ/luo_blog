## Model Architect
- STR model
  - Visual enhanced
  - Non-Visual Enchanced
    - DET
      - Backbone
        - Mobile-net
      - Neck
        - FCN
      - Head
        - ?
    - REC
      - ?
- Visual Model
  - ResNet50 + FN


- Out of V and STR
  - V: [v_units, ]
  - STR
    - DET: [n_bbox, 4]      => Used in p/s detection
      - Extract Feature: [3, ]
    - REC: [n_word, ] => Used in Demand_C
      - Extract Feature: [n_word, tf-idf]

- Merge[STR; V]
  - Concatenate
    - V+REC: [v_units + rec_units, ]
    - V+DET: [v_units + a(3), ]
      - a=3: n_bbox, aver_bbox, std_bbox
  - ...


## Data Preparation
  - Categories: Racism, Strike, Woman March,


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
