---
title: Helmholtz Decomposition
description: A guided derivation of local fluid motion as uniform motion, rotation, and deformation.
---

[Download the PDF](/fluid-mechanics/helmholtz-decomposition.pdf)

:::lecture-intro
**A local picture of fluid motion**

Near a chosen point, the velocity field can be described to first order by uniform motion, rotation, and deformation. These notes develop that local description by splitting the velocity gradient into its antisymmetric and symmetric parts.

**Reading guide.** Begin with the index notation, follow the linear approximation, and then read the two parts of the decomposition separately. The antisymmetric part leads to local rotation; the symmetric part leads to a quadratic potential.
:::

:::lecture-result
**The decomposition at a glance**

$$
u=
\underbrace{u_0}_{\text{transition}}
+\underbrace{\frac{1}{2}(\nabla\times u)\times\delta x}_{\text{rotation}}
+\underbrace{\nabla\phi}_{\text{deformation}}
\qquad
\phi=\frac{1}{2}\delta x^T S\delta x
$$

:::

The first term carries the velocity of the reference point. The remaining terms describe how the velocity changes across a small neighborhood. Throughout the derivation, the velocity gradient is evaluated at that reference point and held fixed in the local approximation.

## Notation and index conventions

Position and velocity are written in a Cartesian basis. Repeated indices indicate summation, so the compact component expressions below represent the same vectors as the explicit sums.

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

### Kronecker delta and Levi-Civita symbol

The Kronecker delta selects matching components when indices are contracted. The Levi-Civita symbol records orientation and provides a compact way to write cross products.

**Kronecker delta**

$$
\delta^i_j=
\begin{cases}
1 & i=j\\
0 & i\ne j
\end{cases}
$$

**Levi-Civita symbol**

$$
\epsilon_{ijk}=
\begin{cases}
1 & \text{if even permutation}\\
-1 & \text{if odd permutation}\\
0 & \text{if }i=i\text{ or }i=j\text{ or }j=k\text{ or }\cdots
\end{cases}
$$

### Contraction and cross products

The following contraction identity converts a product of orientation symbols into Kronecker deltas. It is the key algebraic step in identifying the rotational contribution later in the proof.

>**Lemma.** ("Covariant Physics" (1.107))
>
>$$
>\epsilon_{ijk}\epsilon^{mnk}=\left(\delta_i^m\delta_j^n-\delta_i^n\delta_j^m\right)
>$$

>**Proposition. Cross product in components**
>
>$$
>u,v\in\mathbb{R}^3
>\qquad
>(u\times v)^i=\epsilon^i_{\ jk}u^jv^k
>$$

## Linearizing the velocity field

Retain the constant and first-order terms in the Taylor expansion about the reference point. The displayed relations in this section describe that local linear approximation; higher-order spatial variations are set aside.

$$
u^i=u^i(0)+\sum_{j=1}^3\frac{\partial u^i}{\partial x^j}\delta x^j
$$

To isolate the variation around the reference point, subtract its uniform velocity. This choice leaves the spatial velocity gradient unchanged.

Without loss of generality, let $u^i(0)=0$.

$$
u^i=\frac{\partial u^i}{\partial x^j}\delta x^j=(\partial_j u^i)\delta x^j
$$

### The velocity gradient as a linear map

Collect the spatial derivatives of velocity into a tensor. Acting on a small displacement, this tensor gives the corresponding velocity variation.

Let

$$
T_{ij}=T^i_{\ j}\triangleq\partial_j u^i
\qquad
u^i=T_{ij}\delta x^j
$$

The following two-component example makes the index contraction explicit: each row of the matrix contributes one component of the resulting velocity.

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

## Splitting rotation and deformation

Every velocity-gradient tensor separates into a symmetric part and an antisymmetric part. Exchanging the two indices preserves the symmetric part and reverses the sign of the antisymmetric part.

>**Definition. Symmetric tensor**
>
>$$
>S_{ij}=S_{ji}
>$$

>**Definition. Antisymmetric tensor**
>
>$$
>A_{ij}=-A_{ji}
>$$

>**Theorem. Symmetric and antisymmetric decomposition**
>
>$$
>T_{ij}=A_{ij}+S_{ij}
>$$
>
>$$
>A_{ij}=\frac{1}{2}(T_{ij}-T_{ji})
>$$
>
>The antisymmetric tensor describes the local rotational contribution.
>
>$$
>S_{ij}=\frac{1}{2}(T_{ij}+T_{ji})
>$$
>
>The symmetric tensor describes deformation.

Taking the difference with the transpose isolates the antisymmetric part; taking the sum isolates the symmetric part. Their contributions add to recover the full local velocity variation.

$$
u^i=T_{ij}\delta x^j=A_{ij}\delta x^j+S_{ij}\delta x^j
$$

## Antisymmetric part: local rotation

In three dimensions, an antisymmetric linear map can be represented by a cross product with an angular-velocity vector. The definition below prepares that representation in component form.

Define

$$
\omega^j\triangleq-\frac{1}{2}\epsilon^{jmn}A_{mn}
$$

>**Proposition. Rotation as a cross product**
>
>$$
>A_{ij}\delta x^j=\epsilon_{ijk}\omega^j\delta x^k
>$$
>
>$$
>A\,\delta x=\omega\times\delta x
>$$

Substitute the definition of angular velocity, reorder the Levi-Civita indices, and apply the contraction identity. Antisymmetry then combines the two surviving tensor components.

>**Proof.**
>
>$$
>\begin{aligned}
>\epsilon_{ijk}\omega^j\delta x^k
>&=-\frac{1}{2}\epsilon_{ijk}\epsilon^{jmn}A_{mn}\delta x^k\\
>&=\frac{1}{2}\epsilon_{ikj}\epsilon^{mnj}A_{mn}\delta x^k\\
>&=\frac{1}{2}(\delta_i^m\delta_k^n-\delta_i^n\delta_k^m)A_{mn}\delta x^k\\
>&=\frac{1}{2}(A_{ik}-A_{ki})\delta x^k\\
>&=A_{ik}\delta x^k=A_{ij}\delta x^j
>\end{aligned}
>$$

>**Proposition. Angular velocity and vorticity**
>
>$$
>\omega^i=\frac{1}{2}\epsilon^i_{\ jk}\partial_j u^k
>$$
>
>$$
>\omega=\frac{1}{2}\nabla\times u
>$$

The next calculation expresses angular velocity directly in terms of the velocity gradient. Relabeling the summed indices and using the sign change of the Levi-Civita symbol makes the two derivative terms identical.

>**Proof.**
>
>$$
>\begin{aligned}
>\omega^i
>&=-\frac{1}{2}\epsilon^{imn}A_{mn}\\
>&=-\frac{1}{2}\epsilon^{imn}\frac{1}{2}(T_{mn}-T_{nm})\\
>&=-\frac{1}{4}\epsilon^{imn}(T_{mn}-T_{nm})\\
>&=-\frac{1}{4}\epsilon^{imn}(\partial_n u^m-\partial_m u^n)\\
>&=-\frac{1}{4}\epsilon^{imn}\partial_n u^m+\frac{1}{4}\epsilon^{imn}\partial_m u^n\\
>&=\frac{1}{4}\epsilon^{imn}\partial_m u^n+\frac{1}{4}\epsilon^{imn}\partial_m u^n\\
>&=\frac{1}{2}\epsilon^{imn}\partial_m u^n
>\end{aligned}
>$$

:::lecture-result
**The rotational contribution**

$$
A\,\delta x=\frac{1}{2}(\nabla\times u)\times\delta x
$$

The angular velocity of the local rotation is half the vorticity. This identifies the antisymmetric contribution in the opening decomposition.
:::

## Symmetric part: deformation and a quadratic potential

The symmetric part accounts for local stretching, compression, and shear. With the tensor held fixed at the reference point, its action can be written as the gradient of a quadratic scalar potential.

The position vector below is measured from the chosen local origin. The question in the first display asks how to express this symmetric contribution as a gradient.

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

### Exercise: differentiate the potential

Differentiate the quadratic expression component by component, treating the tensor entries as constants. The product rule produces a contribution from each position factor; symmetry makes those contributions equal.

>**Exercise.** Define
>
>$$
>\phi=\frac{1}{2}x^iS_{ij}x^j
>$$
>
>Prove the following identity.
>
>$$
>\partial_i\phi=S_{ij}x^j
>$$

:::lecture-callout
**Putting the pieces together**

Restore the uniform velocity removed at the start, then combine the rotational and deformation contributions. The result is the opening description of the velocity field near the reference point, within the first-order approximation.
:::
