---
layout: post
title:  "espnet2_skill"
date:   2019-7-17 12:52:48 +0900
categories: jekyll update
---
* This will becorem
{:toc}




## Embedding para_input into seq2seq model
  - Embedding as attention input
    - Attention(input + para_input, output)    -> context_v -> decoder(context_v, prenet_out)
    - Attention(con[input;para_input], output) -> ...

    ```python
    xs = torch.cat([att_c, prenet_out], dim=1)
    ```
  - Embedding as decoder input
    - Attention(input, output) -> context_v -> decoder( context_v, prenet_out, para_input )

    ```python
    xs = torch.cat([att_c, prenet_out, extra], dim=1)
    ```


## Change model from args
    - tts_class = tts_choices.get_class(args.tts)

    ```python
    tts_choices = ClassChoices(
        "tts",
        classes=dict(
            tacotron2=Tacotron2,
            transformer=Transformer,
            fastspeech=FastSpeech,
            fastspeech2=FastSpeech2,
            emocontrl=Tacotron2_controllable,
        ),
        type_check=AbsTTS,
        default="tacotron2",
    )
    ```


## Sampler
    - Fixed Length
    - Vairable Length
        - descend_descend
