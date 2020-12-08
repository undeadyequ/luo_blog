---
layout: post
title:  "emo_tts"
---
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_CHTML"></script>

## How does prosody controllable works?
- Decoder
  - Input
    - conc(att(char_emb, decoder_out), style_emb)
    - conc(att(char_emb + style_emb, decoder))
  
- Vocoder
  -

## Problem1: Lack/Hard to label expressive info
[Expressive embedding]()
  - Method:
    - Learning style embedding by reference encoder
    - Add style embedding to text embedding as query of attention
  - Cons:
    - Learned style embedding is mixed with linguistic info

[GST]()
  - Method:
    - Learn style embedding by Multi-head attention
    - Add style embedding to text embedding as query of attention
    - Based on Tacotron2
  - Res:
    - Some Token can control specific factor, eg. energy interpretably.
    - reference Transfer learning works good.
  - Cons:
    [link_to_below]()

[VAE]()
  -

## GST cons

### Can't set emotion label
[Weight Control]()
  - Method:
    - input emotionally labeled dataset.
    - Set specific emotion weight by centroid of specific emotion cluster

[Dirichlet_VAE](/Users/rosen/paper/TTS/style_learning/Dirichlet_VAE.pdf)

  - Method:
    - make latent variable z, acquire from encoder, subject to dirichlet distribution by KL divergence?
    - Add emotion classifier to each z to overall loss

### Tokens is not disentangled
[Hierarchical generative modeling for controllable speech synthesis](https://arxiv.org/pdf/1810.07217.pdf)
  - Method:
    - Design hierarchical latent variables, categories for attribute and Gaussian for attribute configuration, to control.
    - Categories variable consist observed/latent variable
    - Gaussian latent variable of category latent variable:
      p(zl | yl) = N (μ_yl, diag(σ_yl))
      which is **Diagonal covariance Gaussian**.
  - Cons:
    - ?

### GST->Can't Learn saliently local prosodic style

[word-level empphasis](https://drive.google.com/file/d/0BwCq1DWnNN4NWlhuQ21kSzU1VTQ/view)
  - indirectly related

[EMPHASIS: An Emotional Phoneme-based Acoustic Model
for Speech Synthesis System](https://arxiv.org/pdf/1806.09276.pdf)
  - acoustic parameter model

### GST->Can't Match Text with proper Prosodic Style


### GST->Can't represent emotion correctly


### GST-> Is Multi-head itself efficiency?
  - Hyp: Seems solved unrelated info leakage problem, but also suffer with target info loss problem.
  - Eval:

  - Method: Calculate the differentiate  
  - Meth1: contrastive learning
  - Meth2: instance Normalization
    - text -> std_audio <-> ref_audio -> style_token

$$ style(text, ref) = Attent ( diff(stdT2S(text), ref) ) $$


## other
- Latex in Atom
- Multi variable Gaussian and GMM used in GST
(x-u)^T ∑ (x-u)/

- Implement VAE again
- Understand Dirichlet paper, diff from Gaussian based VAE
- linguistic/acoustic/prosodic model difference
