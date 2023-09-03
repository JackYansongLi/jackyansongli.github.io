date:: [[Jul 26th, 2006]]
archive-location:: world
extra:: Publisher: Society for Industrial and Applied Mathematics
doi:: 10.1137/S0363012903437976
title:: @Individual Q-Learning in Normal Form Games
item-type:: [[journalArticle]]
access-date:: 2022-12-25T10:56:34Z
rights:: Copyright © 2005 Society for Industrial and Applied Mathematics
original-title:: Individual Q-Learning in Normal Form Games
language:: en
url:: https://epubs.siam.org/doi/10.1137/S0363012903437976
publication-title:: SIAM Journal on Control and Optimization
authors:: [[David S. Leslie]], [[E. J. Collins]]
library-catalog:: epubs.siam.org
links:: [Local library](zotero://select/library/items/DX5IF55V), [Web library](https://www.zotero.org/users/7448055/items/DX5IF55V)

- [[Abstract]]
	- The single-agent multi-armed bandit problem can be solved by an agent that learns the values of each action using reinforcement learning. However, the multi-agent version of the problem, the iterated normal form game, presents a more complex challenge, since the rewards available to each agent depend on the strategies of the others. We consider the behavior of value-based learning agents in this situation, and show that such agents cannot generally play at a Nash equilibrium, although if smooth best responses are used, a Nash distribution can be reached. We introduce a particular value-based learning algorithm, which we call individual Q-learning, and use stochastic approximation to study the asymptotic behavior, showing that strategies will converge to Nash distribution almost surely in 2-player zero-sum games and 2-player partnership games. Player-dependent learning rates are then considered, and it is shown that this extension converges in some games for which many algorithms, including the basic algorithm initially considered, fail to converge.
- [[Attachments]]
	- [Leslie and Collins - 2006 - Individual Q-Learning in Normal Form Games.pdf](zotero://select/library/items/37W8LRRU) {{zotero-imported-file 37W8LRRU, "Leslie and Collins - 2006 - Individual Q-Learning in Normal Form Games.pdf"}}
	- [Snapshot](https://epubs.siam.org/doi/epdf/10.1137/S0363012903437976) {{zotero-imported-file GNSIDQNL, "S0363012903437976.html"}}
- # Notes
	- ## Questions
	- ((63d1ca2d-40cf-4762-999c-85548ea0df8c))
		- why play at an equilibrium is not possible?
		- Answer: the equilibrium strategy gives a $Q$ table with all entries to be $2/3$
	- ((63d1d513-716a-4319-bd6d-0a6c98f1bdeb)): Why value-based method can result a Nash distribution while it cannot result in Nash equilibrium?
	- Why? ((63d1d825-9cf0-49a1-a8cc-55a376432949))
	- ## Introduction
	- ((63d1b04c-ca75-483c-a561-daa7d6f2c119))
	- ((63d1b08d-16f5-4b85-be6e-6895c559c3a6))
	- [[Actor-critic]]((63d1b204-88aa-4a27-82d2-aaed43692df1))
	- ((63d1b7a8-2886-46e7-a1a7-26bbb8ecd7e5))
	- [[Value-based Method]] ((63d1c5a1-0cf1-46e9-8c4a-453ede17d288))
	- [[Value-based Method]]: ((63d1ca2d-40cf-4762-999c-85548ea0df8c))
	-
	- ## Definition
	- *Normal Form Game*:
		- $N$ players
		- Mixed Strategy: $\pi^i \in \Delta^i$, $i\in \{1,2,...,N\}$
		- Joint Strategy Space: $\Delta = \Pi \Delta^i$
		- Expected Reward: $$r^i \colon \Delta \rightarrow \mathbb{R}$$
	- *Partnership Game*: ((63d1c6a8-be09-4308-9f8f-86f69ea1dc54))
	- *Smooth best responses*:((63d1ccbe-0e67-4ddc-9dc5-054f8ae9cda1))
		- The term $\tau v^i(\pi^i)$ severs as a regularization term.
		- $v^i$ is a smooth, strictly differentiably concave function such that as $\pi^i$ approaches the boundary of $\Delta^i$, the slope of $v^i$ becomes infinite: this makes sure that when doing the maximization, the $\pi^i$ will be further from $\partial \Delta^i$: means a deterministic strategy is not allowed.
	- *Nash Distribution*: A joint mixed strategy $\pi \in \Delta$ such that, for each $i$, $$\pi^i = \beta^i(r^i(\cdot,\pi^{-i})$$, i.e., each player playes a smooth best response.
	- ## Theorem
		- ((63d9d786-e832-4695-afab-57d337fd45e9))
		- [[@Dynamics of stochastic approximation algorithms]]
		- Proposition 4.2 proof:
			- ((63d2cae5-26a9-4669-b7de-88c1b3f96077))
		- Lemma 3.1 shows that the $Q$ value will converge to a connected internally chain-recurrent set for the corresponding ODE, which means ??
	- ## Numerical Test
		- Equilibrium point for RPS, zero-sum test:((63e428e4-df5c-4bff-a8b3-eddb4f979661))
	- ## Further reading
		- [[ODE Method]]((63d1daee-41b6-4231-a1ab-b9f1c786fc8e))
- date:: [[Jul 26th, 2006]]
  archive-location:: world
  extra:: Publisher: Society for Industrial and Applied Mathematics
  doi:: 10.1137/S0363012903437976
  title:: @Individual Q-Learning in Normal Form Games
  item-type:: [[journalArticle]]
  access-date:: 2022-12-25T10:56:34Z
  rights:: Copyright © 2005 Society for Industrial and Applied Mathematics
  original-title:: Individual Q-Learning in Normal Form Games
  language:: en
  url:: https://epubs.siam.org/doi/10.1137/S0363012903437976
  publication-title:: SIAM Journal on Control and Optimization
  authors:: [[David S. Leslie]], [[E. J. Collins]]
  library-catalog:: epubs.siam.org
  links:: [Local library](zotero://select/library/items/DX5IF55V), [Web library](https://www.zotero.org/users/7448055/items/DX5IF55V)
- [[Abstract]]
	- The single-agent multi-armed bandit problem can be solved by an agent that learns the values of each action using reinforcement learning. However, the multi-agent version of the problem, the iterated normal form game, presents a more complex challenge, since the rewards available to each agent depend on the strategies of the others. We consider the behavior of value-based learning agents in this situation, and show that such agents cannot generally play at a Nash equilibrium, although if smooth best responses are used, a Nash distribution can be reached. We introduce a particular value-based learning algorithm, which we call individual Q-learning, and use stochastic approximation to study the asymptotic behavior, showing that strategies will converge to Nash distribution almost surely in 2-player zero-sum games and 2-player partnership games. Player-dependent learning rates are then considered, and it is shown that this extension converges in some games for which many algorithms, including the basic algorithm initially considered, fail to converge.
- [[Attachments]]
	- [Leslie and Collins - 2006 - Individual Q-Learning in Normal Form Games.pdf](zotero://select/library/items/37W8LRRU) {{zotero-imported-file 37W8LRRU, "Leslie and Collins - 2006 - Individual Q-Learning in Normal Form Games.pdf"}}
	- [Snapshot](https://epubs.siam.org/doi/epdf/10.1137/S0363012903437976) {{zotero-imported-file GNSIDQNL, "S0363012903437976.html"}}
- date:: [[Jul 26th, 2006]]
  archive-location:: world
  extra:: Publisher: Society for Industrial and Applied Mathematics
  doi:: 10.1137/S0363012903437976
  title:: @Individual Q-Learning in Normal Form Games
  item-type:: [[journalArticle]]
  access-date:: 2022-12-25T10:56:34Z
  rights:: Copyright © 2005 Society for Industrial and Applied Mathematics
  original-title:: Individual Q-Learning in Normal Form Games
  language:: en
  url:: https://epubs.siam.org/doi/10.1137/S0363012903437976
  publication-title:: SIAM Journal on Control and Optimization
  authors:: [[David S. Leslie]], [[E. J. Collins]]
  library-catalog:: epubs.siam.org
  links:: [Local library](zotero://select/library/items/DX5IF55V), [Web library](https://www.zotero.org/users/7448055/items/DX5IF55V)
- [[Abstract]]
	- The single-agent multi-armed bandit problem can be solved by an agent that learns the values of each action using reinforcement learning. However, the multi-agent version of the problem, the iterated normal form game, presents a more complex challenge, since the rewards available to each agent depend on the strategies of the others. We consider the behavior of value-based learning agents in this situation, and show that such agents cannot generally play at a Nash equilibrium, although if smooth best responses are used, a Nash distribution can be reached. We introduce a particular value-based learning algorithm, which we call individual Q-learning, and use stochastic approximation to study the asymptotic behavior, showing that strategies will converge to Nash distribution almost surely in 2-player zero-sum games and 2-player partnership games. Player-dependent learning rates are then considered, and it is shown that this extension converges in some games for which many algorithms, including the basic algorithm initially considered, fail to converge.
- [[Attachments]]
	- [Leslie and Collins - 2006 - Individual Q-Learning in Normal Form Games.pdf](zotero://select/library/items/37W8LRRU) {{zotero-imported-file 37W8LRRU, "Leslie and Collins - 2006 - Individual Q-Learning in Normal Form Games.pdf"}}
	- [Snapshot](https://epubs.siam.org/doi/epdf/10.1137/S0363012903437976) {{zotero-imported-file GNSIDQNL, "S0363012903437976.html"}}
- date:: [[Jul 26th, 2006]]
  archive-location:: world
  extra:: Publisher: Society for Industrial and Applied Mathematics
  doi:: 10.1137/S0363012903437976
  title:: @Individual Q-Learning in Normal Form Games
  item-type:: [[journalArticle]]
  access-date:: 2022-12-25T10:56:34Z
  rights:: Copyright © 2005 Society for Industrial and Applied Mathematics
  original-title:: Individual Q-Learning in Normal Form Games
  language:: en
  url:: https://epubs.siam.org/doi/10.1137/S0363012903437976
  publication-title:: SIAM Journal on Control and Optimization
  authors:: [[David S. Leslie]], [[E. J. Collins]]
  library-catalog:: epubs.siam.org
  links:: [Local library](zotero://select/library/items/DX5IF55V), [Web library](https://www.zotero.org/users/7448055/items/DX5IF55V)
- [[Abstract]]
	- The single-agent multi-armed bandit problem can be solved by an agent that learns the values of each action using reinforcement learning. However, the multi-agent version of the problem, the iterated normal form game, presents a more complex challenge, since the rewards available to each agent depend on the strategies of the others. We consider the behavior of value-based learning agents in this situation, and show that such agents cannot generally play at a Nash equilibrium, although if smooth best responses are used, a Nash distribution can be reached. We introduce a particular value-based learning algorithm, which we call individual Q-learning, and use stochastic approximation to study the asymptotic behavior, showing that strategies will converge to Nash distribution almost surely in 2-player zero-sum games and 2-player partnership games. Player-dependent learning rates are then considered, and it is shown that this extension converges in some games for which many algorithms, including the basic algorithm initially considered, fail to converge.
- [[Attachments]]
	- [Leslie and Collins - 2006 - Individual Q-Learning in Normal Form Games.pdf](zotero://select/library/items/37W8LRRU) {{zotero-imported-file 37W8LRRU, "Leslie and Collins - 2006 - Individual Q-Learning in Normal Form Games.pdf"}}
	- [Snapshot](https://epubs.siam.org/doi/epdf/10.1137/S0363012903437976) {{zotero-imported-file GNSIDQNL, "S0363012903437976.html"}}