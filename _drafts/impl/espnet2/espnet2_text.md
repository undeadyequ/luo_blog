#

## cleaner.py



## build_tokenizer.py

```python
def build_tokenizer(
  token_type,
  g2p_type
  ):

  if token_type == "phn":
    return PhonemeTokenizer(
      g2p_type=g2p_type
    )

```


## phoneme_tokenizer.py

```python

class G2p_en:
  def __init__(self, no_space: bool = true):
    pass
  def __call__(self, text):
    pass


class PhonemeTokenizer:
  def __init__(
    self,
    g2_type):
    if g2_type == "g2e_en":
      self.g2p = G2p_en()

  def text2token(self, line: str) -> List[str]:
    pass

  def token2text(self, tokens: Iterable[str]) -> str:
    pass

```

## word_tokenizer.py
