
## espnet2


### Train (write in tts.sh)

1. Data preparation
  - create wav.scp ...
2. Extract feature or raw
  - Extract to *.n.ark, *.n.scp
  - By kaldi's make_fbank
3. Remove long/short sentence ( min/max frame_num)
  - 

4. Feature in air (only when type = raw)
    -

5. TTS collect statsStage TTS collect stats:
  - ?
    => main_function/collect_stats(model, train_iter, valid_iter, ...) => espmodel.collect_stats

6. Train
  - Create batch by merging each type of input data
  - build model by args.tts and initialize it by args.tts_conf
  - Preprocess batch to meet model'need and feed to model
  - Set other training related model
  - Evaluate



### Inference (Text2Speech)

- text, model_path, vocoder_conf

- inference mels by model inference function from text
- Vocoding wav by grifflim or WaveGan
