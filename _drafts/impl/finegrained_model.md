## Model Architect
```bash
python train_extend.py config/

```


```yaml

Architect:
  name: JointVisDet
  config:
    idim: 1000,
    odim: 200,
    ...

General:
  epochs: 1000


resume:
  checkpoint:a
warm_start:
  str:a

```

```python
def vis_model():
    model = models.resnet50(pretrained=True)
    return model

def det_model(args):
    text_det = TextDetector(args)
    return text_det

def extract_dt_boxes_fts(dt_boxes):
    dt_boxes_cp = copy.deepcopy(dt_boxes)
    # n_bbox, aver_bbox, std_bbox
    bbox_n = len(dt_boxes_cp)
    bbox_long = [r-l for (l, r, t, b) in dt_boxes_cp]  # ck
    bbox_high = [t-b for (l, r, t, b) in dt_boxes_cp]  # ck
    bbox_aver_1 = sum(bbox_long) / len(bbox_long)
    bbox_aver_2 = sum(bbox_high) / len(bbox_high)
    bbox_std_1 = statistics.stdev(bbox_long)
    bbox_std_2 = statistics.stdev(bbox_high)
    return np.array([bbox_n, bbox_aver_1, bbox_aver_2, bbox_std_1, bbox_std_2])


def build_model(model_name, model_config):
  return eval(model_name)(model_config)

def cv_classification_task():
  parse = args.Argument()
  parse.add_paddle_config()
  parse.add_visule_config()
  args = parse.parse_args()

  model = build_model(args["model"], args["model_config"])
  optimizer = build_optimizer()
  loss_fun = build_loss()
  train_dataset = build_dataset()
  train_loader = build_dataloader(train_dataset)

  if args["warm_start"] is not None:
    strModel_param_dict = torch.load(args["warm_start"]["str"])
    strModel_param_dict = convert_model_key(model, strModel_param_dict)
    model.load_state_dict(strModel_param_dict, strict=False)

  if args["resume"] is not None:
    model.load_state_dict()
    model.load(args["resume"])

  train_process(start_epoch, epochs, train_loader, model, optimizer, loss_fun, metric_fun)



def train_process(start_epoch, epochs, train_loader, model, optimizer, loss_fun, metric_fun):
  best_val_loss = 100
  train_losses = []
  eval_losses = []
  from epoch in range(start_epoch, epochs)
    # train and evaluation
    train_loss = train(train_loader, model, optimizer, loss_fun, metric_fun)
    eval_loss, eval_metric = eval(eval_loader, model, metric_fun)

    eval_loss_sum = sum([v for k, v in eval_loss])
    train_losses.append(train_loss)
    eval_losses.append(eval_loss)

    # choose best model
    if eval_loss_sum < best_val:
      best_val_loss = eval_loss_sum
      checkpoint = "checkpoint.pth.tar"
      torch.save(
        {
        "epoch": epoch,
        "model": model.state_dict(),
        "optimizer": optimizer.state_dict(),
        "best_loss": best_val_loss,
        "train_losses": train_losses,
        "eval_losses": eval_losses
        }, checkpoint
      )
      shutil.copyfile(checkpoint, "best_model.pth.tar")



def train(train_loader, model, optimizer, loss):
  model.train()
  train_loss = []
  for i, batch in enumerate(train_loader):
    out = model(batch)
    loss = loss_fun(out, batch)

    # back prob
    optimizer.zero_grad()
    loss.backword()
    optimize.step()

    # print infor
    protest_loss, sign_loss = loss[0], loss[1]
    print("batch_time, protest_loss, sign_loss".format())

    train_loss["protest"] = protest_loss
    train_loss["sign_loss"] = sign_loss

  return train_loss


def eval(eval_loader, model, metric_fun):
  model.eval()
  eval_loss = []
  eval_metric = []
  for i, batch in enumerate(eval_loader):
    out = model(batch)
    metric = metric_fun(batch, out)

    # print
    print("protest_loss, protest_acc, sign_loss, sign_acc".format())
  return eval_loss, eval_metric


def build_loss(loss_name):
  return eval(loss_name)


PROTEST_INDEX = 0
SIGN_INDEX = 1
def dependent_loss(output, input, data_name=""):
  """
  return loss: dict()
  loss[0]: protest
  loss[1]: sign
  """
  loss = []
  protest_out = output[:, PROTEST_INDEX]
  sign_out = output[:, SIGN_INDEX]

  if data_name == "protest_sign":
    pass
  elif data_name == "protest_sign_finegrained":
    pass
  else:
    pass
  return loss



class CRNN(torch.nn.Module):
  pass

class CRAFT(torch.nn.Module):



class JointVisDet(torch.nn.Module):
    def __init__(self, idim=1003, odim=2, args=None):
      """
        idim:
        odim: 1 + 1 = 2
          Protest
          Sign
      """
        super(JointVisDet, self).__init__()
        self.vis_model = vis_model()
        self.det_model = det_model(args)
        self.head = torch.nn.Linear(idim, odim)
        self.sigmoid = torch.nn.Sigmoid()

    def forward(self, img):
        vis_out = self.vis_model(img)
        dt_boxes = self.det_model(img)
        det_out = torch.from_numpy(extract_dt_boxes_fts(dt_boxes)) # ck
        jot_out = torch.cat((vis_out, det_out), 1)
        out = self.head(jot_out)
        out = self.sigmoid(out)
        return out


class JointVisDetFineGrained(torch.nn.Module):
    def __init__(self, idim=1512, odim=5, corpus=None, args=None):
      """
        idim:
        odim: 1 + 1 + 5 = 7
          Protest
          Sign

          class1
          class2
          ..
          class5
      """
        super(JointVisDetFineGrained, self).__init__()
        self.vis_model = vis_model()
        self.detrec_model = detrec_model(args)
        self.head = torch.nn.Linear(idim, odim)
        self.tfidf = Tfidf(corpus)

    def forward(self, img):
        vis_out = self.vis_model(img)
        dt_boxes, rec_res = self.detrec_model(img) # (box_n, 4) (box_n, 2)
        document = [" ".join(d) for d in rec_res]
        detrec_out = self.tfidf([document])   # [1, fts_n]

        jot_out = torch.cat((vis_out, detrec_out[0]), 1)
        out = self.head(jot_out)
        return out

```
