```bash
./run.sh --preprocess_dir /home/Data/blizzard2013_part_preprocess  --stage 6 --stop_stage 6 --feats_type fbank
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


```yaml
# train.yaml
tts: emocontrltts
tts_config:
  psd_encoder: InverSER_LSTM
```

```python

# ser/__init__.py
from ser_A import SERA
...
# ser/ser_A.py

# abs_tts.py
import inspect
import espnet.tts.ser as ser

if args.tts_config[psd_encoder] is in inspect.getmembers(ser)
  psd_encoder = eval(args.tts_config[psd_encoder])
else:
  psd_encoder = eval(ser)

self.tts = tts(args.tts_config[psd_encoder], ...)

if args.resume:
  pass



# emo_contrl_tts.py
from espnet.tts.ser import *

Class EmocontrlTTS():
  def __init__(, ..psd_encoder, psd_encoder_config ..):
    self.psd_encoder = build_psd_encoder(psd_encoder, psd_encoder_config)
    ...
  def forward(text, emofeats):
    # emopsd encoder
    if self.psd_encoder.__class__.__name__ is in []:
      emo_pred, psd_pred = self.psd_encoder(text, emofeats)
    # psd encoder
    else:
      psd_pred = self.psd_encoder(text)

      ..., psd_loss = loss(..., psd_pred, emo_feats, ...)

  def inference(text, emofeats. emolabs):
    if emolabs is not None:
      psd_pred = self.psd_encoder(emolabs=emolabs)
    elif emofeats is not None:
      psd_pred = emofeats
    else:
      #psd_pred = self.psd_encoder(text)
    ...
    self.decoder(text_enc, psd_pred)
```


```python
# REVLSTMClassifier
class REVLSTMClassifier(nn.Module):
  def __init__()

```
