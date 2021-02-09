---
layout: post
title:  "asr"
---

<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_CHTML"></script>


## HSMM VS HMM
   - Q: The probability of sequence with long identical state reduce a lot which not make sense
   - M: Add p_i which represent duration probability

   - HMM
   $$ (a_{ij}, b_i, \pi_0) $$
   - HSMM
   $$ (a_{ij}, b_i, \pi_0, p_i) $$

## Probability of hmm
   - Traverse all hidden states in each observable
   - Find the optimized one by maximum probability

## Training of hmm(EM)
  - E:
    Estimate the hs(hidden state) in each step (How??)
  - M:
    maximum observable sequence
  - Math:

## Multi-variable  VS Mixture model
  - 

$$ a_i(t) $$
$$ b_i(t) $$
$$ \lambda_i(t) $$
$$ \mu_i(t) $$


##
