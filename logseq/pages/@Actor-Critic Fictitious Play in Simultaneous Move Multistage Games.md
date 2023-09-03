date:: [[Mar 31st, 2018]]
publisher:: PMLR
conference-name:: International Conference on Artificial Intelligence and Statistics
proceedings-title:: Proceedings of the Twenty-First International Conference on Artificial Intelligence and Statistics
extra:: ISSN: 2640-3498
title:: @Actor-Critic Fictitious Play in Simultaneous Move Multistage Games
pages:: 919-928
item-type:: [[conferencePaper]]
access-date:: 2023-02-13T04:59:22Z
original-title:: Actor-Critic Fictitious Play in Simultaneous Move Multistage Games
language:: en
url:: https://proceedings.mlr.press/v84/perolat18a.html
authors:: [[Julien Perolat]], [[Bilal Piot]], [[Olivier Pietquin]]
library-catalog:: proceedings.mlr.press
links:: [Local library](zotero://select/library/items/97H5BCPP), [Web library](https://www.zotero.org/users/7448055/items/97H5BCPP)

- [[Abstract]]
	- Fictitious play is a game theoretic iterative procedure meant to learn an equilibrium in normal form games. However, this algorithm requires that each player has full knowledge of other players’ strategies. Using an architecture inspired by actor-critic algorithms, we build a stochastic approximation of the fictitious play process. This procedure is on-line, decentralized (an agent has no information of others’ strategies and rewards) and applies to multistage games (a generalization of normal form games). In addition, we prove convergence of our method towards a Nash equilibrium in both the cases of zero-sum two-player multistage games and cooperative multistage games. We also provide empirical evidence of the soundness of our approach on the game of Alesia with and without function approximation.
- [[Attachments]]
	- [Full Text PDF](http://proceedings.mlr.press/v84/perolat18a/perolat18a.pdf) {{zotero-imported-file R3I5XNRP, "Perolat et al. - 2018 - Actor-Critic Fictitious Play in Simultaneous Move .pdf"}}
	- [Supplementary PDF](http://proceedings.mlr.press/v84/perolat18a/perolat18a-supp.pdf) {{zotero-imported-file EI7F4MPH, "Perolat et al. - 2018 - Actor-Critic Fictitious Play in Simultaneous Move .pdf"}}
- [[Notes]]
	- [[Independent Learning]]
		- ((63ed4e9b-67e1-4a7d-a5a7-4f39d5cc5202))
		- [[@Markov games as a framework for multi-agent reinforcement learning]] ((63ed4f7d-ceef-4981-85b1-929da696795f))
	- ((63ed61f4-ee20-4739-a1eb-59511db96ec6))
		- The Smooth Nash Equilibrium can be viewed as a generalization of Nash Distribution defined in [[@Individual Q-Learning in Normal Form Games]]. To see this, check the definition of Smooth Nash Equilibrium in state $\Omega$, you will get $$\pi^i(a^i|\Omega) = \beta_{\sigma}(r^i_\pi(\Omega,a^i))$$, for any $i$, which is exactly the definition of Nash Distribution ignoring the state $\Omega$
	- local v.s. global best response: the local best response takes an action that maximize instantaneous reward while global best response takes an action that maximize cumulative reward. Compare equation (3) and equation (4)
-