---
layout: post
title:  "Attention Summary"
toc: true
---

{% include toc.html %}

### Attention Mechanism

-	Description: Concentrate corresponding specific encoding part to decode, in sequential decoding by previous decoded part and attention weight
￼
![Attention Problem](/luo_blog/assets/attention-9bec68cb.png)

####	Problem
-	Different Situation in ASR from machine translation and handwriting synthesis
-	Longer input sequence which incur the Challenge of distinguishing similar speech fragments
-	The main limitation of such scheme is that identical or very similar elements of h are scored equally regardless of their position in the sequence[1]
-	BiRNN and deeper convolutional network are helpful to learn contextual info of h, but the size of h is limited
-	Location-awarness and content awarness[1]
-	Input sequence is much noisier and does not have as clear structure

### Text summarization

![](/luo_blog/assets/attention-7bb753e7.png)

	-	Inaccurately reproducing factual details, an inability to deal with out-of-vocabulary (OOV) words, repeating themselves
￼
	-	Summary
	-	At the i-th step an ARSG generates an output yi by focusing on the relevant elements of h
	-	 location-based, content-based and hybrid attention mechanisms

￼￼![](/luo_blog/assets/attention-ddff82c7.png)
![](/luo_blog/assets/attention-44c84ca3.png)
![](/luo_blog/assets/attention-29f1bdb9.png)￼

￼
	-	Question
￼
![](/luo_blog/assets/attention-7c70f1ad.png)


### Localization-aware attention
	-	Challenge to distinguishing similar speech fragments
### Pointer-generator
	-	The ability to produce OOV words is one of the primary advantages of pointer-generator models
	-	pgen is used as a soft switch to choose between generating a word from the vocabulary by sampling from Pvocab, or copying a word from the input sequence by sampling from the attention distribution a t .
￼
![](/luo_blog/assets/attention-ef9e3513.png)
![](/luo_blog/assets/attention-7dcdb1fc.png)
￼
	•	Coverage mechanism
	-	Repetition is a common problem for sequence- to-sequence models

![](/luo_blog/assets/attention-8a7d3c9f.png)
![](/luo_blog/assets/attention-84713608.png)
￼
	-	This ensures that the attention mechanism’s current decision (choosing where to attend next) is informed by a reminder of its previous decisions (summarized in c t ). This should make it easier for the attention mechanism to avoid repeatedly attending to the same locations, and thus avoid generating repetitive text.
￼
￼![](/luo_blog/assets/attention-84713608.png)
![](/luo_blog/assets/attention-512fbd87.png)
Forward attention
	-	Only the alignment paths that satisfy the monotonic condition are taken into consideration at each decoder timestep
	-	transition agent
	-


### Multi-head Attention
	-	Problem:
	-	Incorrect separation of query cause hard-to-disentangle problem.
	-	Automatically separate query by calculating correlative score or clustering method
	-	curriculum learning method
	-	Data Augmentation by altering single factor
	-	1 head query searching 1 head token will cause hard-to-disentangle problem when 1 head query is entangle info
	-	1 to N
	-	Semi-supervised learning by discriminate each token to specify target
	-	Summary:
	-	Separate bits of hidden vector into several head making interplay calculation easily.  
	-	Learning interplay of bits of multi hidden vector in fixed number of bits, result of units number dividing heads number.
	-	Interplay: Why does Direct multiplication of linear-transformed heads  work so well ??
	-	The order of tokens is meaningful, the front tokens shows related key of front separation key, back tokens show back separation.

![](/luo_blog/assets/attention-30289985.png)

	•	Transformer
￼                                    ￼
![](/luo_blog/assets/attention-6119fa54.png)
![](/luo_blog/assets/attention-0b94240f.png)

	•	Attention showed in EPSNET
	-	Location-aware attention module
	-	Forward
	-	Forward transmission
	-	GuidedAttentionLoss
	-


### Attention Score Computation

Content base
	-	Confine
Additive
Concatenate
	-	V_a^t * Tanh * ( W_a * [s_t; h_i] )
Dot Product
	-	Scaled Dot Product
General
	-	Score = s_t ^T * W *  h_i
Location base
	-	Score = W * s_t

![](/luo_blog/assets/attention-09e5cb51.png)￼
