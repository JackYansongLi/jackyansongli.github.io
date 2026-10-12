---
title: Helmholtz Decomposition
description: Helmholtz Decomposition.
---

[Download the PDF](/fluid-mechanics/helmholtz-decomposition.pdf)

$$
u=
\underbrace{u_0}_{\text{transition}}
+\underbrace{\frac{1}{2}(\nabla\times u)\times\delta x}_{\text{rotation}}
+\underbrace{\nabla\phi}_{\text{deformation}}
\qquad
\phi=\frac{1}{2}\delta x^T S\delta x
$$

## Notation

$$
x\in\mathbb{R}^3
\qquad
x=\sum_{i=1}^3x^i e_i\equiv x^i e_i
$$

$$
u\in\mathbb{R}^3
\qquad
u=\sum_{i=1}^3u^i e_i\equiv u^i e_i
$$

$$
\nabla f\stackrel{\mathrm{rep}}{=}
\begin{pmatrix}
\dfrac{\partial f}{\partial x^1}\\
\dfrac{\partial f}{\partial x^2}\\
\dfrac{\partial f}{\partial x^3}
\end{pmatrix}
\Rightarrow
\frac{\partial}{\partial x^i}=\partial_i
$$

Kronecker Delta

$$
\delta^i_j=
\begin{cases}
1 & i=j\\
0 & i\ne j
\end{cases}
$$

Levi-Civita Symbol

$$
\epsilon_{ijk}=
\begin{cases}
1 & \text{if even permutation}\\
-1 & \text{if odd permutation}\\
0 & \text{if }i=i\text{ or }i=j\text{ or }j=k\text{ or }\cdots
\end{cases}
$$

Lemma ("Covariant Physics" (1.107))

$$
\epsilon_{ijk}\epsilon^{mnk}=\left(\delta_i^m\delta_j^n-\delta_i^n\delta_j^m\right)
$$

Proposition

$$
u,v\in\mathbb{R}^3
\qquad
(u\times v)^i=\epsilon^i_{\ jk}u^jv^k
$$

$$
u^i=u^i(0)+\sum_{j=1}^3\frac{\partial u^i}{\partial x^j}\delta x^j
$$

Without loss of generality, let $u^i(0)=0$.

$$
u^i=\frac{\partial u^i}{\partial x^j}\delta x^j=(\partial_j u^i)\delta x^j
$$

Let

$$
T_{ij}=T^i_{\ j}\triangleq\partial_j u^i
\qquad
u^i=T_{ij}\delta x^j
$$

$$
\begin{pmatrix}
T_{11} & T_{12}\\
T_{21} & T_{22}
\end{pmatrix}
\begin{pmatrix}
\delta x^1\\
\delta x^2
\end{pmatrix}
=
\begin{pmatrix}
T_{11}\delta x^1+T_{12}\delta x^2\\
T_{21}\delta x^1+T_{22}\delta x^2
\end{pmatrix}
=
\begin{pmatrix}
T_{1j}\delta x^j\\
T_{2j}\delta x^j
\end{pmatrix}
$$

Def. (Symmetric tensor)

$$
S_{ij}=S_{ji}
$$

Def. (Anti-Symm tensor)

$$
A_{ij}=-A_{ji}
$$

Theorem

$$
T_{ij}=A_{ij}+S_{ij}
$$

$$
A_{ij}=\frac{1}{2}(T_{ij}-T_{ji})
$$

voticity ten.

$$
S_{ij}=\frac{1}{2}(T_{ij}+T_{ji})
$$

deformation tensor

$$
u^i=T_{ij}\delta x^j=A_{ij}\delta x^j+S_{ij}\delta x^j
$$

## Anti-Symm term / Voticity tensor

Define

$$
\omega^j\triangleq-\frac{1}{2}\epsilon^{jmn}A_{mn}
$$

Prop.

$$
A_{ij}\delta x^j=\epsilon_{ijk}\omega^j\delta x^k
$$

$$
A\,\delta x=\omega\times\delta x
$$

proof:

$$
\begin{aligned}
\epsilon_{ijk}\omega^j\delta x^k
&=-\frac{1}{2}\epsilon_{ijk}\epsilon^{jmn}A_{mn}\delta x^k\\
&=\frac{1}{2}\epsilon_{ikj}\epsilon^{mnj}A_{mn}\delta x^k\\
&=\frac{1}{2}(\delta_i^m\delta_k^n-\delta_i^n\delta_k^m)A_{mn}\delta x^k\\
&=\frac{1}{2}(A_{ik}-A_{ki})\delta x^k\\
&=A_{ik}\delta x^k=A_{ij}\delta x^j
\end{aligned}
$$

Prop.

$$
\omega^i=\frac{1}{2}\epsilon^i_{\ jk}\partial_j u^k
$$

$$
\omega=\frac{1}{2}\nabla\times u
$$

proof:

$$
\begin{aligned}
\omega^i
&=-\frac{1}{2}\epsilon^{imn}A_{mn}\\
&=-\frac{1}{2}\epsilon^{imn}\frac{1}{2}(T_{mn}-T_{nm})\\
&=-\frac{1}{4}\epsilon^{imn}(T_{mn}-T_{nm})\\
&=-\frac{1}{4}\epsilon^{imn}(\partial_n u^m-\partial_m u^n)\\
&=-\frac{1}{4}\epsilon^{imn}\partial_n u^m+\frac{1}{4}\epsilon^{imn}\partial_m u^n\\
&=\frac{1}{4}\epsilon^{imn}\partial_m u^n+\frac{1}{4}\epsilon^{imn}\partial_m u^n\\
&=\frac{1}{2}\epsilon^{imn}\partial_m u^n
\end{aligned}
$$

$$
A\,\delta x=\frac{1}{2}(\nabla\times u)\times\delta x
$$

## Symmetric term

$$
S\,x\triangleq ?
$$

$$
\phi=\frac{1}{2}x^T Sx
\qquad
\nabla\phi=Sx
$$

$$
Sx=\nabla\phi
\qquad
\phi:\mathbb{R}^3\to\mathbb{R}
$$

HW Define

$$
\phi=\frac{1}{2}x^iS_{ij}x^j
$$

prove

$$
\partial_i\phi=S_{ij}x^j
$$
