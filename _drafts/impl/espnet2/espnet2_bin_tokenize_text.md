# tokenize_txt.py

```python

def tokenize_txt(
  input: str,
  output: str,
  cleaner: str,
  token_type: str,
  g2p_type: str
  ):
  """
  write token vocabularies of input to output
  """
  # \stream input, output

  fin = Path(input).open("r", encoding="utf-8")

  # \ Clean and Tokenizer process
  cleaner = buid_cleaner(cleaner)
  tokenizer = build_tokenizer(
    token_type,
    g2p_type
    )
  counter = Counter()
  for line in fin:
    text = cleaner(text)
    tokens = tokenizer.text2token(text)
    for t in tokens:
      counter[t] += 1

  for w, c in counter:
    fout.write(w + "\n")


```
