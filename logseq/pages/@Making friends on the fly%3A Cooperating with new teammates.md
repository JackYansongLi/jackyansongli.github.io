date:: 01/2017
issn:: 00043702
doi:: 10.1016/j.artint.2016.10.005
title:: @Making friends on the fly: Cooperating with new teammates
pages:: 132-171
volume:: 242
item-type:: [[journalArticle]]
access-date:: 2023-04-30T20:59:59Z
original-title:: Making friends on the fly: Cooperating with new teammates
language:: en
url:: https://linkinghub.elsevier.com/retrieve/pii/S0004370216301266
short-title:: Making friends on the fly
publication-title:: Artificial Intelligence
journal-abbreviation:: Artificial Intelligence
authors:: [[Samuel Barrett]], [[Avi Rosenfeld]], [[Sarit Kraus]], [[Peter Stone]]
library-catalog:: DOI.org (Crossref)
links:: [Local library](zotero://select/library/items/NBGXNL8V), [Web library](https://www.zotero.org/users/7448055/items/NBGXNL8V)

- [[Attachments]]
  collapsed:: true
	- [Barrett et al. - 2017 - Making friends on the fly Cooperating with new te.pdf](https://www.cs.utexas.edu/~pstone/Papers/bib2html-links/AIJ16-Barrett.pdf) {{zotero-imported-file 9R3LU8YF, "Barrett et al. - 2017 - Making friends on the fly Cooperating with new te.pdf"}}
- date:: 01/2017
  issn:: 00043702
  doi:: 10.1016/j.artint.2016.10.005
  title:: @Making friends on the fly: Cooperating with new teammates
  pages:: 132-171
  volume:: 242
  item-type:: [[journalArticle]]
  access-date:: 2023-04-30T20:59:59Z
  original-title:: Making friends on the fly: Cooperating with new teammates
  language:: en
  url:: https://linkinghub.elsevier.com/retrieve/pii/S0004370216301266
  short-title:: Making friends on the fly
  publication-title:: Artificial Intelligence
  journal-abbreviation:: Artificial Intelligence
  authors:: [[Samuel Barrett]], [[Avi Rosenfeld]], [[Sarit Kraus]], [[Peter Stone]]
  library-catalog:: DOI.org (Crossref)
  links:: [Local library](zotero://select/library/items/NBGXNL8V), [Web library](https://www.zotero.org/users/7448055/items/NBGXNL8V)
- [[Attachments]]
	- [Barrett et al. - 2017 - Making friends on the fly Cooperating with new te.pdf](https://www.cs.utexas.edu/~pstone/Papers/bib2html-links/AIJ16-Barrett.pdf) {{zotero-imported-file 9R3LU8YF, "Barrett et al. - 2017 - Making friends on the fly Cooperating with new te.pdf"}}
- ## Notes
	- ## AHT setup
	  collapsed:: true
		- environment defined in AHT contains the dynamics of the world and ad hoc agents' observations.
		- In this work, the environmental dynamics is known.
			- $P(s'|s,a_1,a_2)$ and $R(s,a_1,a_2)$ is known.
			- ((64500ad0-1307-4cc8-a1cf-cf56f2e5cdd3))
		- ### Team Knowledge
			- We measure the knowledge of teammates by $K \colon \Delta(A_2)  \times\Delta(A_2) \rightarrow [-1,1]$ defined in the following:
			- ((64500d3a-36b9-41a1-8393-73785a179f87)) where $T$ represents the true distribution, $U$ is the uniform distribution, $Pred$ is a predicted distribution, and $Point$ is a deterministic distribution.
			- The ad hoc agent's knowledge about its teammates' behavior is $$TeamK = \frac{1}{|S|} \sum_{s \in S} K(\pi^{(2)}(s), Pred(s)) $$
		- ## Environment Knowledge
		  collapsed:: true
			- Similarly define $EnvK = (TransK, RewardK)$
			- In this paper $EnvK = (1,1)$
		- ## Reactivity of teammates
		  collapsed:: true
			- ((64501486-5e33-4f3d-a9cf-87ec8a33ed49))
			- In this paper $Reactivity = 1$.
	- ## Evaluation of Ad Hoc Agent's Performance
	  collapsed:: true
		- ((64503102-087c-49c8-b3cb-5f2602e4b8c1))
		- The author further introduces the method to build $\Pi^{(2)}$ in Pursuit Domain and 2-D RoboCup Simulator
	- ## Mathematical Formulation
	  collapsed:: true
		- The planning problem of ad hoc agent can be formulated as a single agent MDP when $\pi^{(2)}$ is known.
		- Transfer learning
	- ## PLASTIC
		- ((64503df0-521c-4cd7-8c8e-f3ddfe31f1f1))
		- ### PLASTIC-Model: Model-Based
			- ((645059b0-0c26-4cc8-841d-f8903c21ffc5))
			- learn $\pi^{(2)}$, get $P_2(s',s,a_1)$, then model-based RL
			  collapsed:: true
				- update belief by a modified bayes algorithm.
				- TODO read the detail about select action
				- Will this algorithm update $\Pi^{(2)}$? Yes, by $LearnAboutPriorTeammate$
		- ### PLASTIC-Policy: Model-Free
			- In this variant, the ad hoc agent learns a policy to cooperate with each of its past teammates, selects which policies best match how to cooperate with its current teammates, and then selects actions using these policies.
	- ### RL and AHT
		- ((645006d7-403d-40c3-b839-d2ef430bd16b))
		- ((64500747-9b2c-4468-8e4f-37a8220ef449))
			- ((6450076c-df17-4980-abe2-8a4f810b4512))
			- TODO  why capability 2 is important for AHT?
				- ((645045d0-69cd-4078-b253-4149d886ca48))
				- ((64504602-876b-4a1d-909f-052f57dbc6ab))
				- In addition, PLASTIC–Model is better able to handle situations (not explored in this article) in which its models of teammate behaviors change over time, such as when ongoing learning changes these models. As these models change, PLASTIC–Model can simply adapt by planning a new behavior using these models, while PLASTIC–Policy requires recalculating the policy for the resulting MDP. On the other hand, the main advantage of PLASTIC–Policy is its ability to scale to more complex problems