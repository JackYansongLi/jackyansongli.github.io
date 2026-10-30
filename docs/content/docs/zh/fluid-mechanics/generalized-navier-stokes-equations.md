---
title: Generalized Navier-Stokes Equations
description: A guided derivation of mass, momentum, and energy balances for fluid motion.
---

[Download the PDF (with the transport-theorem proof)](/fluid-mechanics/generalized-navier-stokes-equations.pdf)

[Download the original handwritten PDF](/fluid-mechanics/generalized-navier-stokes-equations-original.pdf)

:::lecture-intro
**From integral balances to local equations**

These notes develop the conservation of mass, momentum, and energy for a moving fluid volume. The divergence theorem converts boundary fluxes into volume contributions, while the transport theorem describes how an integral changes as the fluid moves.

**Reading guide.** Begin with the two theorems, then follow how body forces and surface stresses enter the momentum balance. The energy balance adds the work done by those forces, heat supplied within the fluid, and heat crossing its boundary.
:::

## Gauss Divergence Theorem

The net outward flux through a closed boundary can be expressed as the integral of a divergence over the enclosed volume. This is the step that later turns boundary forces and heat fluxes into terms in a local conservation law.

$$
\int_S u\cdot\vec{n}\,dS=\int_V\nabla\cdot u\,dV
$$

**Index notation.** The same boundary-to-volume relation is written in component form below.

$$
\int_S u^i n_i\,dS=\int_V\partial_i(u^i)\,dV
$$

## Reynold's Transport Theorem

A material volume moves with the fluid and contains the same fluid particles. The transport theorem accounts for both the time dependence of the integrand and the changing region of integration.

[(Webpage)](/zh/flow-analysis/ch04-governing-equations/#423-雷诺输运定理)

$$
\begin{aligned}
\frac{d}{dt}\int_{V(t)} f\,dV
&=\int_{V(t)}\partial_t f+\nabla\cdot(fu)\,dV\\
&=\int_{V(t)}\partial_t f+\partial_i(fu^i)\,dV
\end{aligned}
$$

### Proof in material coordinates

The proof changes variables to a fixed reference configuration, then separates the change of the integrand from the change of the volume element.

> C.P. corresponds to "Covariant Physics".
>
> Define
>
> $$
> F(t)=\int_{V(t)} f(x,t)\,\mathrm{d}V,
> $$
>
> where $V(t)$ always consists of the same fluid particles. We assume the flow map $\mathcal{X}$ is smooth and invertible, $f$ is smooth. Spatial coordinates & metric are time-independent.
>
> Spatial coordinates $x^i$ & material coordinates $X^A$
>
> $$
> i,j,k \qquad A,B,C
> $$
>
> Spatial metric $g_{ij}$ & material metric $G_{ij}$
>
> Denote $\mathrm{d}^3x=\mathrm{d}x^1\mathrm{d}x^2\mathrm{d}x^3$.
>
> By Eq (2.137) in C.P.
>
> $$
> \mathrm{d}V=\sqrt{|g|}\,\mathrm{d}^3x=\mathcal{J}\,\mathrm{d}^3x
> $$
>
> Let $V_0$ denote a fixed ref. configuration of the fluid. Each fluid particle is assigned a fixed material label $X^A$.
>
> Therefore,
>
> $$
> \frac{\mathrm{d}X^A}{\mathrm{d}t}=0
> $$
>
> Current spatial coordinates
>
> $$
> x^i=\mathcal{X}^i(X^A,t)
> $$
>
> **Exercise 1.** Show that for a given particle
>
> $$
> u^i=\frac{\mathrm{d}x^i}{\mathrm{d}t}=\left.\frac{\partial\mathcal{X}^i}{\partial t}\right|_X
> $$
>
> Let
>
> $$
> \begin{aligned}
> \Lambda^i{}_A&=\frac{\partial x^i}{\partial X^A}=\frac{\partial\mathcal{X}^i}{\partial X^A} \\
> \Lambda^A{}_i&=\frac{\partial X^A}{\partial x^i}=\frac{\partial X^A}{\partial\mathcal{X}^i}.
> \end{aligned}
> $$
>
> We know that
>
> $$
> \begin{aligned}
> \Lambda^A{}_i\Lambda^i{}_B&=\delta^A{}_B \\
> \Lambda^i{}_A\Lambda^A{}_j&=\delta^i{}_j.
> \end{aligned}
> $$
>
> By Eq (2.127) in C.P., $\mathcal{J}=|\Lambda|$
>
> $$
> \mathrm{d}V=\mathrm{d}^3x=\mathcal{J}\,\mathrm{d}^3X
> $$
>
> Therefore,
>
> $$
> F(t)=\int_{V_0}f(\mathcal{X}(X,t),t)\mathcal{J}(X,t)\,\mathrm{d}^3X
> $$
>
> $$
> \begin{aligned}
> \frac{\mathrm{d}F(t)}{\mathrm{d}t}
> &=\int_{V_0}\frac{\partial}{\partial t}\left[f(\mathcal{X}(X,t),t)\mathcal{J}(X,t)\right]\mathrm{d}^3X \\
> &=\int_{V_0}\left[\mathcal{J}\left.\frac{\partial f(\mathcal{X}(X,t),t)}{\partial t}\right|_X+f\frac{\partial\mathcal{J}}{\partial t}\right]\mathrm{d}^3X
> \end{aligned}\tag{17}
> $$
>
> **First term**
>
> $$
> \begin{aligned}
> \left.\frac{\partial f(\mathcal{X}(X,t),t)}{\partial t}\right|_X
> &=\frac{\partial f}{\partial t}+\frac{\partial f}{\partial x^i}\left.\frac{\partial x^i}{\partial t}\right|_X \\
> &=\partial_t f+u^i\partial_i f \\
> &=\frac{\mathrm{D}f}{\mathrm{D}t}
> \end{aligned}
> $$
>
> **Second term** $\mathcal{J}=\det[\Lambda^i{}_A]$
>
> $$
> \begin{aligned}
> \frac{\partial\Lambda^i{}_A}{\partial t}
> &=\frac{\partial}{\partial t}\frac{\partial x^i}{\partial X^A}
> =\frac{\partial}{\partial X^A}\frac{\partial x^i}{\partial t}
> =\frac{\partial}{\partial X^A}u^i(\mathcal{X}(X,t),t) \\
> &=\frac{\partial u^i}{\partial x^j}\frac{\partial x^j}{\partial X^A}
> =\partial_ju^i\Lambda^j{}_A
> \end{aligned}
> $$
>
> By Eq (8.108) in C.P.
>
> $$
> \mathrm{d}|M|=|M|\operatorname{Tr}(M^{-1}\mathrm{d}M)
> $$
>
> we have
>
> $$
> \begin{aligned}
> \frac{\partial\mathcal{J}}{\partial t}
> &=\mathcal{J}\operatorname{Tr}\left(\Lambda^{-1}\frac{\partial\Lambda}{\partial t}\right) \\
> &=\mathcal{J}\Lambda^A{}_i\frac{\partial\Lambda^i{}_A}{\partial t} \\
> &=\mathcal{J}\Lambda^A{}_i(\partial_ju^i)\Lambda^j{}_A \\
> &=\mathcal{J}\partial_ju^i\delta^j{}_i
> =\mathcal{J}\partial_iu^i
> \end{aligned}
> $$
>
> i.e.
>
> $$
> \frac{1}{\mathcal{J}}\frac{\partial\mathcal{J}}{\partial t}=\nabla\cdot\mathbf{u}
> $$
>
> $$
> \begin{aligned}
> \frac{\mathrm{d}F(t)}{\mathrm{d}t}
> &=\int_{V_0}\frac{\partial}{\partial t}\left[f(\mathcal{X}(X,t),t)\mathcal{J}(X,t)\right]\mathrm{d}^3X \\
> &=\int_{V_0}\left[\mathcal{J}\left.\frac{\partial f(\mathcal{X}(X,t),t)}{\partial t}\right|_X+f\frac{\partial\mathcal{J}}{\partial t}\right]\mathrm{d}^3X \\
> &=\int_{V_0}\left[\mathcal{J}(\partial_t f+u^i\partial_i f)+f\mathcal{J}\partial_iu^i\right]\mathrm{d}^3X \\
> &=\int_{V_0}\left(\partial_t f+u^i\partial_i f+f\partial_iu^i\right)\mathrm{d}V \\
> &=\int_{V_0}\left(\frac{\mathrm{D}f}{\mathrm{D}t}+f\partial_iu^i\right)\mathrm{d}V \\
> &=\int_{V_0}\left(\partial_t f+\underbrace{\partial_i(fu^i)}_{\nabla\cdot(f\mathbf{u})}\right)\mathrm{d}V
> \end{aligned}
> $$
>

## Mass Conservation

When mass is neither created nor lost, the total mass of a material volume remains constant. Applying the transport theorem gives the integral balance below.

$$
\frac{d}{dt}\int_{V(t)}\rho\,dV=\int_{V(t)}\partial_t\rho+\nabla\cdot(\rho u)\,dV=0
$$

Because this balance holds for every sufficiently regular material volume, it gives the pointwise continuity equation.

:::lecture-result
**Local mass balance**

$$
\partial_t\rho+\nabla\cdot(\rho u)=0
$$
:::

## Conservation of Momentum

The momentum balance equates the rate of change of a material volume's momentum to the forces acting on it. First, the transport theorem supplies the time and transport terms. The notes then record the velocity products used in this balance.

$$
\begin{aligned}
\frac{d}{dt}\int_{V(t)}\rho u\,dV
&=\int_{V(t)}\partial_t(\rho u)+\partial_i(\rho u^i u^j)\,dV\\
&=\int_{V(t)}\partial_t(\rho u)+\nabla\cdot(\rho u\otimes u)\,dV
\end{aligned}
$$

$$
u^i u_i=u\cdot u\in\mathbb{R}^3
$$

$$
\begin{aligned}
u^i u^j
&=\begin{pmatrix}
u^1u^1&u^1u^2&u^1u^3\\
\vdots&\vdots&\vdots\\
u^3u^1&u^3u^2&u^3u^3
\end{pmatrix}\in\mathbb{R}^{3\times3}\\
&=u\otimes u
\end{aligned}
$$

### Body force

Body forces act throughout the fluid volume. The integral sums their contribution by weighting the force per unit mass with the density.

$$
\int_{V(t)}\rho b\,dV\qquad b\in\mathbb{R}^3
$$

### Surface force and stress

Surface forces act across the boundary. The stress representation below separates pressure from the remaining stress contribution and relates the traction to the boundary orientation.

$$
-pI\vec{n}+\overbrace{\tau}^{\text{linear transformation}}\cdot\vec{n}
$$

$$
\sigma=-pI+\tau\qquad\sigma_{ij}=\sigma_{ji}
$$

**Newtonian fluid.** The constitutive relation below connects viscous stress to the deformation tensor.

$$
\sigma=-pI+2\mu\overbrace{D}^{\text{deformation tensor}}
$$

### From surface stress to a volume contribution

Applying the divergence theorem to the boundary traction expresses the total surface force as a volume integral. Separating the pressure contribution then gives the form used in the final momentum balance.

$$
\begin{aligned}
\int_{S(t)}\sigma\cdot n\,dS
&=\int_{S(t)}\sigma_{ij}n^j\,dS\\
&=\int_{V(t)}\partial_j(\sigma^{ij})\,dV\\
&=\int_{V(t)}\nabla\cdot\sigma\,dV
\end{aligned}
$$

$$
\nabla\cdot\sigma=\nabla\cdot(-pI+\tau)=-\nabla p+\nabla\cdot\tau
$$

:::lecture-result
**Local momentum balance**

$$
\partial_t(\rho u)+\nabla\cdot(\rho u\otimes u)=-\nabla p+\nabla\cdot\tau+\rho b
$$
:::

## Energy Conservation

Energy changes through mechanical work and heat transfer. The transport theorem supplies the time and transport terms; the following sections assemble the contributions to the energy balance.

$E$ - energy per unit mass

$$
\frac{d}{dt}\int_{V(t)}\rho E\,dV
=\int_{V(t)}\partial_t(\rho E)+\nabla\cdot(\rho Eu)\,dV
$$

### Work by body forces

The integral combines the force per unit mass with density and fluid velocity to give the total power supplied by body forces.

$$
\int_{V(t)} \rho b \cdot u \, dV
$$

### Work by surface stress

The boundary traction also does work. The divergence theorem expresses this boundary power as a volume contribution, and pressure work is then separated from the remaining stress work.

$$
\begin{aligned}
\int_{S(t)} (\sigma \cdot n) \cdot u \, dS
&= \int_{S(t)} \sigma^{ij} n_j u_i \, dS \\
&= \int_{V(t)} \partial_j (\sigma^{ij} u_i) \, dV \\
&= \int_{V(t)} \nabla \cdot (\sigma \cdot u) \, dV
\end{aligned}
$$

$$
\nabla \cdot (\sigma \cdot u) = -\nabla \cdot (pu) + \nabla \cdot (\tau \cdot u)
$$

### Heat supplied within the fluid

A distributed heat source contributes throughout the fluid volume. Its contribution is weighted by the density in the integral below.

$$
\int_{V(t)} \rho r \, dV
$$

### Heat crossing the boundary

The heat flux is measured relative to the outward normal. Outward heat flow removes energy from the material volume, which accounts for the sign of the boundary contribution.

$$
-\int_{S(t)} q \cdot \vec{n} \, dS = -\int_{V(t)} \nabla \cdot q \, dV
$$

Combining mechanical work, distributed heating, and boundary heat transport gives the final conservative form.

:::lecture-result
**Local energy balance**

$$
\begin{aligned}
\partial_t (\rho E) + \nabla \cdot \bigl((\rho E+p)u\bigr)
&= \nabla \cdot (\tau \cdot u) - \nabla \cdot q \\
&\quad + \rho b \cdot u + \rho r
\end{aligned}
$$
:::
