---
title: Why using regret in online learning
description: Notes on why regret is used in online learning instead of cost minimization.
---

Regret analysis is broadly adopted in learning with online interactions. However, why using regret minimization instead of cost minimization as in other learning tasks such as batch learning? In this short note, we will give an example that by minimizing the regret, the learner gets a better reward.

## Worst-case cost and worst-case regret cost

Consider the function $g$ defined as $g(x) \triangleq \max_y f(x,y)$, where $f$ is an arbitrary function. The optimization problem defined as:

$$
\begin{equation}
\min_x g(x) \equiv \min_x \max_y f(x,y)
\end{equation}
$$

can be viewed as a worst-case optimization problem, and $g(x)$ is called *worst-case cost*.

Let's consider a scenario where we have $f(x,y)$ that represents the time required to drive a car from one location to another given policy $x$ and environment $y$. In this context, $x$ represents the driver's driving pattern, which encompass decisions like adjusting speed, selecting lanes (left or right), and other driving strategies. On the other hand, $y$ represents a binary condition indicating whether it's currently raining ($y = 1$) or not ($y = 0$). Together, this function captures how the driver's decisions and weather conditions collectively impact the time it takes for the journey.

It's a widely acknowledged fact that driving takes more time on days when it's raining. Thus, $\max_y f(x,y) = f(x,1)$. By definition, the function $g(x)$ currently represents the time required for driving on rainy days.

Now, define $g'(x) \triangleq \max_y (f(x,y) - \min_{x'} f(x',y))$. We call $g'(x)$ the *worst-case regret cost*. Unlike worst-case cost, the regret cost measures the maximum achievement **it can be improved** in the past days. For example, if a driver cannot drive in the rainy day due to rheumatoid arthritis. Then there is no difference between $f(x,\text{rain})$ and $f(x',\text{rain})$ for any $x$ and $x'$, which makes $g'(x) = 0$. No regret at all! Because nothing can be improved in the worst-case.

## An example that minimizes regret cost results in a better policy

Consider the function $f(x,y)$ as follows:

$$
\begin{array}{c|cc}
f(x,y) & y=0 & y=1 \\
\hline
x=0 & 100 & 0 \\
x=1 & 100 & 99
\end{array}
$$

The worst-case cost $g(x)$ in this example is $\max_y f(x,y) = f(x,0) = 100$ for any $x$. Thus,

$$
\begin{equation}
\arg\min_x g(x) = 0 \lor 1
\end{equation}
$$

But for the worst-case regret cost, $g'(0) = 0$ and $g'(1) = 99$. Thus:

$$
\begin{equation}
\arg\min_x g'(x) = 0
\end{equation}
$$

## Data correlation

The fundamental assumption of standard offline machine learning is that the collected data are independently and identically distributed, stemming from an unknown distribution [@vapnik_overview_1999]. However, this assumption can be easily compromised in the realm of online learning [@shalev-shwartz_online_2011-1]. For instance, let's reconsider a scenario involving a driver who refrains from driving on rainy days. In this case, data points (representing the time taken to travel between places) within a one-hour time-frame might have a probability of collection as low as $0$. Conversely, data points beyond one hour might possess a probability of collection greater than $0$. This implies that data collected on different dates adhere to distinct distributions. This distinction underscores a crucial difference between traditional offline learning and online learning.