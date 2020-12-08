<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_CHTML"></script>


###  Core
  - Thinking
    - The integration showed below is intractable, since z are not clear defined. ?
    - z is Normal
$$
p_{\theta}(x) = \int p_{\theta}(z) * p_{\theta}(x|z)dz
$$

  - Value Function
    - Make postier equal to prior ?

$$
\begin{eqnarray}
\log{p_{\theta}(x)} &=& \mathbb{E}_{z\sim q_{\phi}(z|x)} [ \log{p_{\theta}(x)} ] \\

&=& \mathbb{E}_{z} [ log{
  \frac{p_{\theta}(x|z)*p_{\theta}(z)}{p_{\theta}(z|x)}
  *
  \frac{q_{\phi}(z|x)}{q_{\phi}(z|x)} } ]  \\

&=& \mathbb{E}_{z}[\log{p_{\theta}(x|z)}] -
D_{KL}(q_{\phi}(z|x) || p_{\theta}(z)) +
D_{KL}(q_{\phi}(z|x) || p_{\theta}(z|x))  
\end{eqnarray}
$$


  - Train process
    - z is meaningful?




## related papers

[Improved Variational Inference with Inverse Autoregressive Flow](https://papers.nips.cc/paper/2016/file/ddeebdeefdb7e7e7a697e1c3e3d8ef54-Paper.pdf)
- high-dimensional latent spaces

## question
  - Interprtable of z
  - Delichelt VAE
