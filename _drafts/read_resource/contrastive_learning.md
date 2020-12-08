---
layout: post
title:  "contrastive_learning"
categories: jekyll update
---

<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_CHTML"></script>

## Method
   * Using transformed data as positive sample, and others(Different sample) as negative sample to optimize differentiate function, mostly inner product, so that different sample can represent contrastively.
$$ score(f(x), f(x^+)) >> score(f(x), f(x^-))$$
