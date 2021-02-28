---
layout: post
title:  "Scene Text Recognition"
---
11/10~12/10


# Problem

## generate character-level ground truth


## 1. Detect (BaseLine=Fast R-CNN)

### Arbitrary Direction Scene Text

### No order in detected lines in Multi-Lines and tilted text

### Irregular and distorted text

### Handwrite


### Anchor-based Model: Cropping ROI degrade accuracy.
[Convolutional Character Networks](Convolutional Character Networks)
  -

### Difficult to Optimize interplay of multiple stages(candidate aggregation, word partitioning) and components
  -

[EAST](east)
  - Method:
     1. Anchor-free
     2. Predict distances to 4 edges of each abstracted pixel acquired after NN
     3.


## 2. Recognition (BseLine=CRNN+CTC)
### Distorted image
###


## 3. Cooperate detect/Recognition (Baseline=RCNN+CRNN+CTC)
### Not optimize jointly  with Detection  And  Recognition
[Convolutional Character Networks](Convolutional Character Networks)
  - Method:
    - Merged detection and Recognition in one
  - Cons:
    - ** Each brach did not shared to other? **
