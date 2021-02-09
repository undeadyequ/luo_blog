```python
class espnet_model2(
  emofeatsExtract=emofeature_extract,
  emofeatsNormal=emofeatsNormal,
  emoDiscriminator=emoDiscriminator
  ...
  ):
  """ prepare required input in various tts model, such as mel spectrum, pitch, energy for tts model
  """
  def __init__():
    pass
  def forward(text, speech):
    if self.tts_model == "emocontrl":
      self.ser = emoDiscriminator
      emo_emb = self.ser(speech)
    elif self.tts_model == "other":
      ...
    return self.tts(text, speech, emo_emb)

  def inference(text, ref_speech, emo_emb):
    if self.tts_model == "emocontrl":
      self.ser = emoDiscriminator
      if ref_speech is not None and emo_emb is None:
        emo_emb = self.ser(ref_speech)
    return self.tts.inference(xs, emo_emb)



class emofeature_extract:
  def forward(Speech: torch.Tensor(1,)): ems, pitch, silence, harmonic


class contrlemoTTS2:
  """
  contrlemoTTS main
  """
  def __init__(
    ):
  def forward(xs, ys, emo_emb=None):
    """
      xs:
      ys: mel spectrum
    """
      xs_encoder_out = self.encoder(xs)
      xs_emo = xs_encoder_out + emo_emb
      xs_emo_prosody_encoder_out = self.prosodyEncoder(xs_emo)

      # Attention
      context_vector = attention(xs_encoder_out, ys)
      decoder_input = concatenate(context_vector + xs_encoder_out)
      mel = self.decoder(decoder_input)
      loss = ys - mel
      return loss

  def inference(xs, use_emo_lab=False, emo_emb=None, pitch, eng, duration):
      xs_encoder_out = self.encoder(xs)
      xs_emo = xs_encoder_out + emo_emb
      xs_emo_prosody_encoder_out = self.prosodyEncoder(xs_emo)      

      # Attention
      context_vector = attention(xs_encoder_out)
      decoder_input = concatenate(context_vector + xs_encoder_out)
      mel = self.decoder(decoder_input)

      return mel
```
