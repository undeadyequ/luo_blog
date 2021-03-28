

1. Data_prepare.sh
  - 4 Index files(4)
    - Create index files (Including Data Selection)
        - wav.scp, txt.scp, utt2spk, spk2utt
        - charid.scp   <= character utterance wav_id
        - wav_char.scp, txt_char.scp, utt2spk_char, spk2utt_char
        - exprid.scp   <=
    - Select Data
        - By Character Speech
        - By SER model
        python data_selection.py
            --fiction
            --index_dir
            --normalize
            --model_f

  - Mel-feature
    - Copy 4 index into dump/fbank/org/. and mels in dump/fbank/org/data
  - Psd-feature or Just Copy from out/data/. )
    - When copy: cp emofts.csv + emotxtfts.hd5 into train_nodev, dev, eval1 respectively.
    - When train:
        extract_emo_fts.py ..
        extract_txt_fts.py ..
        extract_cob_fts.py ./
  - rm. Long/Short data
    
  - Tokenize txt

2. Collect stats ? how it be used ?
    - mistach, sum sum_sqr, count
3. Train Model
    - ./run.sh  --stage 6 --stop_stage 6 --feats_type fbank
    -
4. (Inference)
    - Vocoder
- test_convert_fbank.sh
  check vocoder



python -m espnet2.bin.tokenize_txt \

  --input "${data_feats}/srctext" \
  --output "${token_list}" \
  --token_type "${}" \
  --cleaner "${}" \
  --g2p "${}"
