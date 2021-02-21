# Emo_contrl_tts

```bash

python extract_combinedfeats_from_scp.py \
  -input_csv "${}" \
  

```

### Feature

```python
from sklearn.feature_extraction.text import TfidfTransformer, TfidfVectorizer

def extract_combinedfeats_from_scp(input_csv, input_scp, corp_csv, out_pkl, vis=ture):
  txtfeats = extract_txtfeats_from_txt(input_csv, corp_csv, out_pkl=None, method="tfidf", vis=true)
  audfeats = extract_emofeats_from_scp(input_scp, out_csv, vis=true)
  cobfeats = np.concatenate((audfeats, txtfeats), 1)

  if out_pkl is not None:
    with open(out_pkl, "wb") as f:
      pickle.dump(txtfeats, f)
  return cobfeats

def extract_emofeats_from_scp(input_scp, out_csv=None, vis=true):
  pass

def extract_txtfeats_from_txt(input_csv, corp_csv, out_pkl=None, method="tfidf", vis=true):
  corp_df = pd.read_csv(corp_csv)
  input_df = pd.read_csv(input_csv)

  tfidf = TfidfVectorizer(sublinear_tf=True, min_df=5, norm='l2', encoding='latin-1', ngram_range=(1, 2), stop_words='english')

  _ = tfidf.fit_transform(corp_df.transcription).toarray()
  fts = tfidf.transform(input_df.transcription).toarray()

  txtfeats = dict()
  txtfeats["input"] = fts
  if out_pkl is not None:  
    with open(out_pkl, "wb") as f:
      pickle.dump(txtfeats, f)
  return txtfeats


x_train_text = features_text[:x_train_text.shape[0]]
x_test_text = features_text[-x_test_text.shape[0]:]

print(features_text.shape, x_train_text.shape, x_test_text.shape)


[]  
  pass

def vis_fts_emo_relation(id_fts_pred_lab_f):
  """
  id_fts_pred_lab_f:
  id, fts1, fts2, fts3, ... pred, lab
  wav1 ..
  """
  id_fts_pred_lab_dict = dict()
  FEAT, PRED, LAB = 0, 1, 2
  ANG, HAP, SAD = 0, 1, 2
  id_fts_pred_lab_sorted_dict = sorted(id_fts_pred_lab_dict.items, key=lambda kv: kv[1][PRED][ANG])
  fts0 = [ft_pred_lab][FEAT][0] for id, ft_pred_lab in id_fts_pred_lab_sorted_dict]
  fts1 = [ft_pred_lab][FEAT][1] for id, ft_pred_lab in id_fts_pred_lab_sorted_dict]
  ang = [ft_pred_lab][PRED][0] for id, ft_pred_lab in id_fts_pred_lab_sorted_dict]

  fig = plt.figure()
  ax0 = fig.add_subplot(2, 3, 1)
  ax1 = fig.add_subplot(2, 3, 1)
  ...
  ax0.scatter(fts0, ang)
  ax0.line(fts0, ang)
  ax1.scatter(fts1, ang)
  ax1.line(fts1, ang)
  ...
  plt.savefig("fts_ang.png")

```


```bash
# psfeats.sh
${python} -m utils.extract_emofeats_from_scp
    --scp "${scp_f}" \
    --csv "${csv}" \
    --norm_f "${norm_f}"


```



### Tacotron2 Model
  - collect states
  - train

```bash
# collect_stats.sh
${train_cmd} JOB=1:"${_nj}" "${_logdir}"/stats.JOB.log \
    ${python} -m espnet2.bin.tts_train \
        --collect_stats true \
        --write_collected_feats "${write_collected_feats}" \
        --use_preprocessor true \
        --token_type "${token_type}" \
        --token_list "${token_list}" \
        --non_linguistic_symbols "${nlsyms_txt}" \
        --cleaner "${cleaner}" \
        --g2p "${g2p}" \
        --normalize none \
        --pitch_normalize none \
        --energy_normalize none \
        --train_data_path_and_name_and_type "${_train_dir}/text,text,text" \
        --train_data_path_and_name_and_type "${_train_dir}/${_scp},speech,${_type}" \
        --valid_data_path_and_name_and_type "${_valid_dir}/text,text,text" \
        --valid_data_path_and_name_and_type "${_valid_dir}/${_scp},speech,${_type}" \
        --train_shape_file "${_logdir}/train.JOB.scp" \
        --valid_shape_file "${_logdir}/valid.JOB.scp" \
        --output_dir "${_logdir}/stats.JOB" \
        ${_opts} ${train_args} || { cat "${_logdir}"/stats.1.log; exit 1; }
```

```bash
${python} -m espnet2.bin.launch \
    --cmd "${cuda_cmd} --name ${jobname}" \
    --log "${tts_exp}"/train.log \
    --ngpu "${ngpu}" \
    --num_nodes "${num_nodes}" \
    --init_file_prefix "${tts_exp}"/.dist_init_ \
    --multiprocessing_distributed true -- \
    ${python} -m espnet2.bin.tts_train \
        --use_preprocessor true \
        --token_type "${token_type}" \
        --token_list "${token_list}" \
        --non_linguistic_symbols "${nlsyms_txt}" \
        --cleaner "${cleaner}" \
        --g2p "${g2p}" \
        --normalize global_mvn \
        --normalize_conf "stats_file=${tts_stats_dir}/train/feats_stats.npz" \
        --resume true \
        --fold_length "${text_fold_length}" \
        --fold_length "${_fold_length}" \
        --output_dir "${tts_exp}" \
        ${_opts} ${train_args}

```
























































# hi2
