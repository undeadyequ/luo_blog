## args usage in big project
    - input args types:
        - yaml
            - XX_conf
                - tts_conf
        - cmd
        - .sh
    - add args name to parser in:
        - task.tts.abs_task.ABSTask
            - Abs related (grouped)
                - general
                - Distributive setting
                - Hardware
                    - cudnn
                - Dataset (where data come from)
                    - train_path_type_name, etc.
                - Batch_sampler (How to generate batch)
                    - sequence_iter_setting
                    - chunk_iter_setting
                - Pretraining ()
                    -
                - Training ( How to control training process)
                    - epoch, patience, early_stop_set, grad_clip etc.
                - Optimizer
                    -                     
            - trainer related
                - None
            - specific_task related
                - task related
                - preprocess related
                - sub-model related <= \_conf args is added by Class_choices

                    ```python
                    class_choices_list = [
                        # --feats_extractor and --feats_extractor_conf
                        feats_extractor_choices,
                        ...
                    ]
                    ...
                    for class_choices in cls.class_choices_list:
                        # Append --<name> and --<name>_conf.
                        # e.g. --encoder and --encoder_conf
                        class_choices.add_arguments(group)
                    ...
                    class Class_choices:
                        ...
                        def add_arguments(self, parser):
                            parser.add_argument(
                                f"--{self.name}",
                            )
                            parser.add_argument(
                                f"--{self.name}_conf",
                            )
                    ```
    - Use args of parser in model
        - XX_conf is packaged input into model
            - tts_clss(idim=vocab_size, odim=odim, \**args.tts_conf)


                tts_class = tts_choices.get_class(args.tts)
        tts = tts_class(idim=vocab_size, odim=odim, \**args.tts_conf)
            - Tacotron(\**xx_conf)
