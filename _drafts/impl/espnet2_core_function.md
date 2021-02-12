## system architect

### The overall process of training Speech data
    - Prepare all types of feed data in files with (name, data) format. (name, raw_file) is required
    - Create feed data iterator, read specific data, set by args, in batch form
        - Read each data element in key-value format
        - Organize data element in batch with specified method
        - Build batch iterator

    - Build middle-level data processing model which compute middle-value used in final model
        - Gather several middle-level data processor
        -

    - Create trainer which specify the training process
        - Build core-model
        - build other model, optimizer etc, used in core-model


### training process

```python
->main(cmd): [TTSTask=>AbsTask]        # Build All train/Eval Environment
  ->main_worker(args): [AbsTask]
    ->build_model(args): model [TTSTask]                <= Unfolded below
    ->build_optimizer(args, model=model): [AbsTask]
    ->scheduler_classes.get(name):scheduler
    ->schedulers.append(scheduler)
    ->build_iter_factory(args):train_iter_factory []
      ->build_sequence_iter_factory(args, iter_option):SequenceIterFactory [] \
        ->ESPnetDataset(iter_option.data_path_and_name_and_type, iter_option.preprocess):dataset [torch.utils.data]
        ->build_batch_sampler(iter_option.batch_type, iter_option.shape_files, batch_size):batch_sampler [samplers]
          ->NumElementsBatchSampler()
        ->SequenceIterFactory(dataset, batches, args.seeds):seqFactor []
          ->self.build_iter(epoch): Dataloader []
    ->build_iter_factory(args):valid_iter_factory []
    # Dump all args to config.yaml
    # Load Pretrained model
    ->trainer.run(model,
                  optimizers,
                  schedulers,
                  train_iter_factory,
                  valid_iter_factory,
                  seeds)            # Training Process Overlook
      ->train_one_epoch(             
              model,
              optimizers,
              schedulers,
              train_iter_factory.build_iter(iepoch),
              )                     # Training detailed control in each epoch                       
        -> model(**batch)
          ->forward(text, text_len, speech, speech_len, spkem): [Tacotron2_controllable]
      # report result
      # Save checkpoints
      # Training Error Handling
```


### build model
```python
[AbsTask] ->main():None []
->main_worker(args):None [ESPnetTTSModel]
->build_model(args):model [TTSTask]
  # feats_extract
  ->feats_extractor_choices.get_class(args.feats_extract):feats_extract_class
  ->feats_extract_class(**args.feats_extract_conf):feats_extract
  # emo_extract
  ...
  ->emofeats_extract_class():emo_extract
  ...
  ->emo_classifier_class():emo_classifier
  # Normalizer
  ...
  # TTS
  ...
  ->tts_class = tts_choices.get_class(args.tts)
  ->tts_class(idim, odim, **args.tts_conf):tts
  # Extract component
  ...
  ->pitch_extract_class(**args.pitch_extract_conf):pitch_extract

  # Conclude
  ->ESPnetTTSModel(feats_extract, emo_extract, emo_classifier, tts):model
```



### inference process
```python
-> ExpStyleTTS(model_f, model_conf, vocoder_conf, text): exp
  -> TTSTask.build_model_from_file(model_f, model_conf, device): (model, args)
    -> yaml.safe_load(model_conf): args
    -> cls.build_model(args): model
    -> model.to(device)
    -> model.load_state_dict(torch.load(model_f, map_location=device))
  # inference1
  -> exp.exp_ref_audio(ref_audio):
    -> Text2Speech(model, model_conf, vocoder_conf, forward_window=1): t2s  # text->mels mels->mags->wavs
    -> t2s.__call__(text, ref_audio=None, emo_labs=None, emo_feats=None):
      -> batch["text"] = text  # required
      -> batch["speech"] = ref_audio # option
      -> batch["emo_labs"] = emo_labs # option
      ...
      -> decode_config.update({"forward_window": forward_window}, ...) # model_specific input
      -> model(**batch, **decode_config): mels
      -> utils.grifflim.Spectrogram2wav(vocoder_conf): spectrogram2wav  # both mel and linear
      -> spectrogram2wav(mels)
        -> utils.logmel2linear(mels): mags_pred
          -> np.linalg.pinv(mels_basis, mels)
        -> utils.grifflim(mags_pred): wav

  # inference2
  -> exp.exp_emo_labs(ref_audio):
```
