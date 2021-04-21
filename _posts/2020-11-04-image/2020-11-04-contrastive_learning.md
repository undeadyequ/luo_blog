---
layout: post
title:  "contrastive Leanring"
toc: true
---

{% include toc.html %}


<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_CHTML"></script>

## Method
   * Using transformed data as positive sample, and others(Different sample) as negative sample to optimize differentiate function, mostly inner product, so that different sample can represent contrastively.
$$ score(f(x), f(x^+)) >> score(f(x), f(x^-))$$


rmse_m      rmse_std   rmse_range   harm_m    harm_std      pitch_m      pitch_std   pitch_range  ang_pred    hap_pred     sad_pred     neu_pred
ang  299   0.791304   0.785686    0.950803   0.002809   0.875418    0.710234    0.505217    0.503411    0.846589    0.092709    0.059298    0.000569
hap  828   0.887959   0.267210    0.446981   0.277850   0.803623    0.737198    0.473116    0.399686    0.033406    0.735254    0.187548    0.043539
sad  1527 0.271159   0.571539    0.594984   0.167911   0.343399    0.380105    0.604650    0.626647    0.014368     0.061375   0.874237    0.049673
neu  715  0.482965    0.250825    0.264070  0.357790    0.261483    0.377063    0.280252    0.276629    0.000657    0.056280    0.135650    0.807105

EMO   rmse_m  rmse_std  rmse_range    harm_m  harm_std   pitch_m  pitch_std  pitch_range
ang      0.746662  0.740126    0.810585  0.441418  0.725736  0.708417   0.509198     0.580689
hap      0.633622  0.514699    0.587029  0.561291  0.552205  0.585950   0.501602     0.543579
sad      0.428508  0.454218    0.453034  0.495303  0.385762  0.460667   0.473085     0.508353
neu      0.423428  0.388659    0.360740  0.582310  0.312924  0.405324   0.388957     0.406828
