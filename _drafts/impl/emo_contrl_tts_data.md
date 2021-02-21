
### Data(Including data prepare)
  - create index_dir(4 files)
    ```bash
    # 0. create 4 files set.
    local/data_prep.sh \
        --train_set "${train_set}" \
        --dev_set "${dev_set}" \
        --eval_set "${eval_set}" \
        --save_dir "${data}" \
        "${db_root}"

    ```
  - filter out expr_dir from index_dir

    ```bash
    # filter_expr.sh
    python prepare_expressive_index.py \
      - fiction_f "${fiction_f}" \
      - index_dir "${index_dir}" \
      - clf_f "${}" \
      - clf_n "${model_name}" \
      - clf_c ""


    # 1. filter character sentences (by quotation marks)
    # 2. filter expressive sentences (by ser prediction)

    ## Predict and Ranking the accuracy

    ## Anotate the top 20 for each category
    ## Evaluate by F-score / Precision and Recall

    ```

    ```python
    temp_dir = "temp"
    def prepare_expressive_index(fiction_f, index_dir, clf_f, clf_n, clf_c):              # ck
      """
      create index dir of expressive wav inside the original index dir
      """
      if not os.path.isdir(temp_dir):
        os.path.mkdir(temp_dir)
      # 1. filter character sentences (by quotation marks)
      id_txt_f = os.path.join(index_dir, "text.txt")
      cindex_dir = os.path.mkdir(index_dir, "cindex")   # character index dir
      eindex_dir = os.path.mkdir(index_dir, "eindex")  # expressive index dir

      char_ids = filter_char_sents(fiction_f, id_txt_f)  # filter by text
      #filter_index_dir(index_dir, cindex_dir, char_filter_names)

      # 2. filter expressive sentences (by ser prediction)
      expr_ids = filter_expr_sents(char_ids, id_wav_f, clf_f, clf_n, clf_c) # filter by wav
      filter_index_dir(index_dir, eindex_dir, expr_ids)


    def filter_char_sents(fiction_f, id_txt_f, save=False):
      """
      return char_ids
      """
      char_ids = []
      char_txts= []
      id_txt_dic = {}
      # get char_sents list
      temp_char_sents = os.path.join(temp_dir, "char_sents.txt")
      os.system("grep -iRo \"“.*”\" {} > {}".format(fiction_f, temp_char_sents)
      with open(temp_char_sents, "r") as f:
        for l in f:
          char_txts.append(l)

      with open(id_txt_f, "r") as f:
        for l in f:
          id, txt = l.split(" ", 1)
          id_txt_dic[id] = txt

      # character_names
      for s in char_ids:
          if s in id_txt_dic.keys():
              char_ids.append(id_txt_dic[s])
      char_ids = sorted(char_ids)

      if save:
        with open("char_id.txt", "w") as f:
            for i in char_ids:
                f.write(i+"\n")
      return char_ids


    def filter_expr_sents(char_ids, id_wav_f, clf_f, clf_n, clf_c, expr_num=1000*4, expr_types=4):
      """
      return expr_ids
      """
      expr_ids = []

      # extract emo_feats
      temp_emo_feats = os.path.join(temp_dir, "emo_feats.csv")
      extract_emofeats_from_scp(id_wav_f, temp_emo_feats)

      # inference emo by audio_ser model
      temp_emo_feats_pred = os.path.join(temp_dir, "emo_feats_pred.csv")
      id_ft_pred_dict = infer_emo_from_fts(temp_emo_feats, temp_emo_feats_pred, clf_f, clf_n, clf_c)

      # filter expressive audio
      ang_ids = []
      hap_ids = []
      sad_ids = []
      neu_ids = []
      n = expr_num / expr_types

      FEAT, PRED, LAB = 0, 1, 2
      ANG, HAP, SAD = 0, 1, 2
      ang_dict = sorted(id_ft_pred_dict.items, key=lambda kv: kv[1][PRED][ANG])
      ang_ids = [id for id, ft_pred in ang_dict][:max(n, ang_ids)]

      ...

      expr_ids = ang_ids + hap_ids + sad_ids
      return expr_ids


    def infer_emo_from_fts(fts_f, fts_preds_f, clf_f, clf_n, clf_c):

      id_ft_dict = dict{}
      with open(fts_f, "r") as f:
        for row in f:
          id, ft = f.split(" ", 1)
          id_ft_dict[id] = ft
      model = build_model(clf_f, clf_n, clf_c)

      id_ft_pred_dict = dict{}
      for k, v in id_ft_dict.items():
        v_gpu = v.to(device)
        emo_pred_gpu, _ = model(v_gpu)
        emo_pred = emo_pred_gpu.cpu().detach().numpy()
        emo_lab = np.argmax(emo_pred, 1)
        id_ft_pred_dict[k] = np.arrray(v, emo_pred, emo_lab)

      with open(fts_preds_f, "w") as f:
        for k, v in id_ft_pred_dict.items():
          f.write(k, v)
      return id_ft_pred_dict


    def build_model(clf_f, clf_n, clf_c):
      if clf_n not exist in ["clf_a", "clf_b"]:
        raise Exception("")
      else:
        model = eval(clf_n)(**clf_config)
        model.load_state_dict(torch.load(clf_f))
        model.eval()
      return model

    def filter_index_dir(index_dir_s, index_dir_d, filter_ids):
      id_wav_f_s = os.path.join(index_dir_s, "wav.scp")
      id_wav_f_d = os.path.join(index_dir_d, "wav.scp")
      ...

      os.system("cp {} {}".format(id_wav_f_s, id_wav_f_d))

      id_wav_f_d_dict = dict()
      with open(id_wav_f_s, "r") as f:
        for l in f:
          id, txt = l.split(" ", 1)
          if id is in filter_ids:
            id_wav_f_d_dict[id] = txt
      with open(id_wav_f_d, "w") as f:
        for id, wav in id_wav_f_d_dict.items():
          f.write(id + " " + wav + "\n" )

    ```


  - extracdt mel_feats
    ```bash
    # data_prepare.sh

    # 1. Copy datadir
    for dset in "${train_set}" "${valid_set}" ${test_sets}; do
      utils/copy_data_dir.sh ${data}/"${dset}" "${data_feats}${_suf}/${dset}"
      # 2. Feature extract
      scripts/feats/make_"${feats_type}".sh --cmd "${train_cmd}" --nj "${_nj}" \
          --fs "${fs}" \
          --n_fft "${n_fft}" \
          --n_shift "${n_shift}" \
          --win_length "${win_length}" \
          ${_opts} \
          "${data_feats}${_suf}/${dset}"
      utils/fix_data_dir.sh "${data_feats}${_suf}/${dset}"   # ck

      # 3. Derive the the frame length and feature dimension
      scripts/feats/feat_to_shape.sh --nj "${_nj}" --cmd "${train_cmd}" \
          "${data_feats}${_suf}/${dset}/feats.scp" "${data_feats}${_suf}/${dset}/feats_shape"

      # 4. Write feats_dim
      head -n 1 "${data_feats}${_suf}/${dset}/feats_shape" | awk '{ print $2 }' \
          | cut -d, -f2 > ${data_feats}${_suf}/${dset}/feats_dim

      # 5. Write feats_type
      echo "${feats_type}" > "${data_feats}${_suf}/${dset}/feats_type"
    done

    ```

  - filter data
    - set Normal/Expressive rate (1:5)
      - select character wav file
      - recognize emos and select nums of them
    - filter out long/short

      ```bash


      # filtdata.sh
      # filter long
      removelong.sh


      ```


- token list
  ```bash
  # gen_token_list.sh

  ```
