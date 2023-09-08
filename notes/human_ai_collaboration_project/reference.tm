<TeXmacs|2.1.2>

<style|generic>

<\body>
  <doc-data|<doc-title|Reference>>

  <section|AHT>

  Our work is related to ad-hoc teamworks (AHT), expecilly the opponent
  modelling subtask of AHT\ 

  <\enumerate>
    <item>Review: <cite|baumeister_survey_2022><cite|albrecht_autonomous_2018><cite|stone_ad_2010>

    <item>Opponent Modelling: <cite|albrecht_game-theoretic_2015><cite|albrecht_belief_2016><cite|barrett_making_2017><cite|xie_learning_2020>
  </enumerate>

  <section|POMDP>

  The earlies POMDP paper I found is: <with|font-shape|italic|The Optimal
  Control of Partially Observable Markov Processes Over a Finite Horizon>:
  <cite|smallwood_optimal_1973>

  <\enumerate>
    <item>LMDP: <cite|kwon_rl_2021><cite|hallak_contextual_2015><cite|brunskill_sample_2013>

    <item>IPOMDP:<cite|han_learning_2018><cite|gmytrasiewicz_framework_2005>

    <item>Augmented Bayes-Adaptive MDP (BAMDP):
    <cite|white_bayesian_1969><cite|duff_optimal_2002><cite|guez_efficient_2012>
  </enumerate>

  <subsection|LMDP>

  Our formulation is close to LMDP, which has few different names, listed in
  the following:

  <\enumerate>
    <item><with|color|blue|Contextual decision process>
    <cite|hallak_contextual_2015>: dynamic web application\ 

    <item><with|color|blue|Multi-model MDP> <cite|steimle_multi-model_2021>:
    medical decision making\ 

    <item><with|color|blue|<with|color|blue|Multi-task RL>>: transfer
    learning in different RL tasks <cite|liu_pac_2016>
    <cite|taylor_transfer_2009> <cite|brunskill_sample_2013>

    <item><with|color|blue|Hidden model MDP, MOMDP>:
    <cite|chades_momdps_2012>

    <item><with|color|blue|Concurrent MDP>: <cite|buchholz_computation_2019>
  </enumerate>

  <with|font-shape|italic|<with|font-series|bold|Kwon et.al. 2021:> Previous
  studies of partially-observed decision problems assumed
  <with|color|blue|the number of observations is larger than the number of
  hidden states>, as well as, that a set of single observations forms
  sufficient statistics to learn the hidden structure
  <cite|guo_pac_2016><cite|azizzadenesheli_reinforcement_2016>.>\ 

  <with|color|pink|YL: I can make an example such that MEX do not need to
  visit all number of hidden states to achieve zero regret.>

  <section|MEX Regret Analysis>

  The regret analysis in this paper took some ideas from the following
  papers.

  <\enumerate>
    <item>OLIVE: <cite|jiang_contextual_2016>

    <item>Posterior Sampling and Thomas Sampling:
    <cite|thompson_likelihood_1933><cite|russo_learning_2014><cite|zhong_gec_2023><cite|agarwal_model-based_2022><cite|zhang_feel-good_2021><cite|agarwal_non-linear_2022>

    <item>MEX: <cite|liu_one_2023>
  </enumerate>

  <subsection|GEC assumption>

  The main result relies on GEC assumption, which covers the following
  assumptions:

  <\enumerate>
    <item>linear MDP structure (<cite|yang_sample-optimal_2019>;
    <cite|jin_provably_2020>)

    <item>Bellman completeness (Zanette et al., 2020:
    <cite|zanette_learning_2020>)

    <item>Bellman rank (<cite|jiang_contextual_2016>)

    <item>Eluder dimension (Osband and Van Roy, 2014
    :<cite|osband_model-based_2014>)

    <item>Bellman eluder dimension (Jin et al., 2021<cite|jin_bellman_2021>)
  </enumerate>

  <subsection|Agnostic online learning>

  The regret analysi of infinite hypothesis set are related to agnostic
  online learning: <cite|ben-davidAgnosticOnlineLearning2009><cite|ross_agnostic_2012>

  <section|Other Algorithms>

  <\enumerate>
    <item><math|Q> learning with UCB: <cite|jin_is_2018><cite|dong_q-learning_2019>

    <item>UCB: 1985 original paper. <cite|lai_asymptotically_1985>

    <item>Model-based RL with UCB: <cite|azar_minimax_2017><cite|auer_near-optimal_2008>

    <item><with|color|blue|PBVI:> <cite|pineau_anytime_2006>
    <with|color|pink|YL: we shall discuss whether to replicate this POMDP
    algorithm.>
  </enumerate>

  <subsection|Environment>

  We use a simplified version of the Overcooked-AI
  <cite|carroll_utility_2019><cite|he_opponent_2016> as benchmark environment
  for numerical experiment.

  \;

  <\bibliography|bib|tm-plain|reference>
    <\bib-list|46>
      <bibitem*|1><label|bib-agarwal_model-based_2022>Alekh Agarwal<localize|
      and >Tong Zhang. <newblock>Model-based RL with Optimistic Posterior
      Sampling: Structural Conditions and Sample Complexity. <newblock>oct
      2022.<newblock>

      <bibitem*|2><label|bib-agarwal_non-linear_2022>Alekh Agarwal<localize|
      and >Tong Zhang. <newblock>Non-Linear Reinforcement Learning in Large
      Action Spaces: Structural Conditions and Sample-efficiency of Posterior
      Sampling. <newblock><localize|In ><with|font-shape|italic|Proceedings
      of Thirty Fifth Conference on Learning Theory>, <localize|pages
      >2776-2814. PMLR, jun 2022.<newblock>

      <bibitem*|3><label|bib-albrecht_belief_2016>Stefano<nbsp>V.<nbsp>Albrecht,
      Jacob<nbsp>W.<nbsp>Crandall<localize|, and >Subramanian Ramamoorthy.
      <newblock>Belief and Truth in Hypothesised Behaviours.
      <newblock><with|font-shape|italic|Artificial Intelligence>, 235:63-94,
      jun 2016.<newblock>

      <bibitem*|4><label|bib-albrecht_game-theoretic_2015>Stefano<nbsp>V.<nbsp>Albrecht<localize|
      and >Subramanian Ramamoorthy. <newblock>A Game-Theoretic Model and
      Best-Response Learning Method for Ad Hoc Coordination in Multiagent
      Systems. <newblock>jun 2015.<newblock>

      <bibitem*|5><label|bib-albrecht_autonomous_2018>Stefano<nbsp>V.<nbsp>Albrecht<localize|
      and >Peter Stone. <newblock>Autonomous agents modelling other agents: A
      comprehensive survey and open problems.
      <newblock><with|font-shape|italic|Artificial Intelligence>, 258:66-95,
      may 2018.<newblock>

      <bibitem*|6><label|bib-auer_near-optimal_2008>Peter Auer, Thomas
      Jaksch<localize|, and >Ronald Ortner. <newblock>Near-optimal Regret
      Bounds for Reinforcement Learning. <newblock><localize|In
      ><with|font-shape|italic|Advances in Neural Information Processing
      Systems>, <localize|volume><nbsp>21. Curran Associates, Inc.,
      2008.<newblock>

      <bibitem*|7><label|bib-azar_minimax_2017>Mohammad<nbsp>Gheshlaghi Azar,
      Ian Osband<localize|, and >Rémi Munos. <newblock>Minimax Regret Bounds
      for Reinforcement Learning. <newblock>jul 2017.<newblock>

      <bibitem*|8><label|bib-azizzadenesheli_reinforcement_2016>Kamyar
      Azizzadenesheli, Alessandro Lazaric<localize|, and >Animashree
      Anandkumar. <newblock>Reinforcement Learning of POMDPs using Spectral
      Methods. <newblock>may 2016.<newblock>

      <bibitem*|9><label|bib-barrett_making_2017>Samuel Barrett, Avi
      Rosenfeld, Sarit Kraus<localize|, and >Peter Stone. <newblock>Making
      friends on the fly: Cooperating with new teammates.
      <newblock><with|font-shape|italic|Artificial Intelligence>,
      242:132-171, jan 2017.<newblock>

      <bibitem*|10><label|bib-ben-davidAgnosticOnlineLearning2009>Shai
      Ben-David, D.<nbsp>Pál<localize|, and >S.<nbsp>Shalev-Shwartz.
      <newblock>Agnostic Online Learning. <newblock><localize|In
      ><with|font-shape|italic|Annual Conference Computational Learning
      Theory>. 2009.<newblock>

      <bibitem*|11><label|bib-brunskill_sample_2013>Emma Brunskill<localize|
      and >Lihong Li. <newblock>Sample Complexity of Multi-task Reinforcement
      Learning. <newblock>sep 2013.<newblock>

      <bibitem*|12><label|bib-buchholz_computation_2019>Peter
      Buchholz<localize| and >Dimitri Scheftelowitsch. <newblock>Computation
      of weighted sums of rewards for concurrent MDPs.
      <newblock><with|font-shape|italic|Math Meth Oper Res>, 89(1):1-42, feb
      2019.<newblock>

      <bibitem*|13><label|bib-carroll_utility_2019>Micah Carroll, Rohin Shah,
      Mark<nbsp>K.<nbsp>Ho, Thomas<nbsp>L.<nbsp>Griffiths,
      Sanjit<nbsp>A.<nbsp>Seshia, Pieter Abbeel<localize|, and >Anca Dragan.
      <newblock>On the Utility of Learning about Humans for Human-AI
      Coordination. <newblock>Oct 2019.<newblock>

      <bibitem*|14><label|bib-chades_momdps_2012>Iadine Chades, Josie
      Carwardine, Tara Martin, Samuel Nicol, Regis Sabbadin<localize|, and
      >Olivier Buffet. <newblock>MOMDPs: A Solution for Modelling Adaptive
      Management Problems. <newblock><with|font-shape|italic|Proceedings of
      the AAAI Conference on Artificial Intelligence>, 26(1):267-273,
      2012.<newblock>

      <bibitem*|15><label|bib-dong_q-learning_2019>Kefan Dong, Yuanhao Wang,
      Xiaoyu Chen<localize|, and >Liwei Wang. <newblock>Q-learning with UCB
      Exploration is Sample Efficient for Infinite-Horizon MDP. <newblock>sep
      2019.<newblock>

      <bibitem*|16><label|bib-duff_optimal_2002>Michael<nbsp>O'Gordon Duff.
      <newblock>Optimal learning: Computational procedures for Bayes
      -adaptive Markov decision processes.
      <newblock><with|font-shape|italic|Doctoral Dissertations Available from
      Proquest>, <localize|pages >1-247, jan 2002.<newblock>

      <bibitem*|17><label|bib-gmytrasiewicz_framework_2005>P.<nbsp>J.<nbsp>Gmytrasiewicz<localize|
      and >P.<nbsp>Doshi. <newblock>A Framework for Sequential Planning in
      Multi-Agent Settings. <newblock><with|font-shape|italic|Journal of
      Artificial Intelligence Research>, 24:49-79, jul 2005.<newblock>

      <bibitem*|18><label|bib-guez_efficient_2012>Arthur Guez, David
      Silver<localize|, and >Peter Dayan. <newblock>Efficient Bayes-adaptive
      reinforcement learning using sample-based search.
      <newblock><localize|In ><with|font-shape|italic|Proceedings of the 25th
      International Conference on Neural Information Processing Systems -
      Volume 1>, NIPS'12, <localize|pages >1025-1033. Red Hook, NY, USA, dec
      2012. Curran Associates Inc.<newblock>

      <bibitem*|19><label|bib-guo_pac_2016>Z.<nbsp>Guo, Shayan
      Doroudi<localize|, and >E.<nbsp>Brunskill. <newblock>A PAC RL Algorithm
      for Episodic POMDPs. <newblock><localize|In
      ><with|font-shape|italic|International Conference on Artificial
      Intelligence and Statistics>. May 2016.<newblock>

      <bibitem*|20><label|bib-hallak_contextual_2015>Assaf Hallak, Dotan Di
      Castro<localize|, and >Shie Mannor. <newblock>Contextual Markov
      Decision Processes. <newblock>feb 2015.<newblock>

      <bibitem*|21><label|bib-han_learning_2018>Yanlin Han<localize| and
      >Piotr Gmytrasiewicz. <newblock>Learning Others' Intentional Models in
      Multi-Agent Settings Using Interactive POMDPs. <newblock><localize|In
      ><with|font-shape|italic|Advances in Neural Information Processing
      Systems>, <localize|volume><nbsp>31. Curran Associates, Inc.,
      2018.<newblock>

      <bibitem*|22><label|bib-he_opponent_2016>He He, Jordan Boyd-Graber,
      Kevin Kwok<localize|, and >Hal Daumé III. <newblock>Opponent Modeling
      in Deep Reinforcement Learning. <newblock>sep 2016.<newblock>

      <bibitem*|23><label|bib-jiang_contextual_2016>Nan Jiang, Akshay
      Krishnamurthy, Alekh Agarwal, John Langford<localize|, and
      >Robert<nbsp>E.<nbsp>Schapire. <newblock>Contextual Decision Processes
      with Low Bellman Rank are PAC-Learnable. <newblock>dec 2016.<newblock>

      <bibitem*|24><label|bib-jin_is_2018>Chi Jin, Zeyuan Allen-Zhu,
      Sebastien Bubeck<localize|, and >Michael<nbsp>I.<nbsp>Jordan.
      <newblock>Is Q-learning Provably Efficient? <newblock>jul
      2018.<newblock>

      <bibitem*|25><label|bib-jin_bellman_2021>Chi Jin, Qinghua
      Liu<localize|, and >Sobhan Miryoosefi. <newblock>Bellman Eluder
      Dimension: New Rich Classes of RL Problems, and Sample-Efficient
      Algorithms. <newblock>jul 2021.<newblock>

      <bibitem*|26><label|bib-jin_provably_2020>Chi Jin, Zhuoran Yang,
      Zhaoran Wang<localize|, and >Michael<nbsp>I.<nbsp>Jordan.
      <newblock>Provably efficient reinforcement learning with linear
      function approximation. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of Thirty Third Conference on
      Learning Theory>, <localize|pages >2137-2143. PMLR, jul 2020.<newblock>

      <bibitem*|27><label|bib-kwon_rl_2021>Jeongyeol Kwon, Yonathan Efroni,
      Constantine Caramanis<localize|, and >Shie Mannor. <newblock>RL for
      Latent MDPs: Regret Guarantees and a Lower Bound. <newblock>feb
      2021.<newblock>

      <bibitem*|28><label|bib-lai_asymptotically_1985>T.<nbsp>L Lai<localize|
      and >Herbert Robbins. <newblock>Asymptotically efficient adaptive
      allocation rules. <newblock><with|font-shape|italic|Advances in Applied
      Mathematics>, 6(1):4-22, mar 1985.<newblock>

      <bibitem*|29><label|bib-liu_pac_2016>Yao Liu, Zhaohan Guo<localize|,
      and >Emma Brunskill. <newblock>PAC Continuous State Online Multitask
      Reinforcement Learning with Identification. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of the 2016 International
      Conference on Autonomous Agents & Multiagent Systems>, AAMAS '16,
      <localize|pages >438-446. Richland, SC, may 2016. International
      Foundation for Autonomous Agents and Multiagent Systems.<newblock>

      <bibitem*|30><label|bib-liu_one_2023>Zhihan Liu, Miao Lu, Wei Xiong,
      Han Zhong, Hao Hu, Shenao Zhang, Sirui Zheng, Zhuoran Yang<localize|,
      and >Zhaoran Wang. <newblock>One Objective to Rule Them All: A
      Maximization Objective Fusing Estimation and Planning for Exploration.
      <newblock>may 2023.<newblock>

      <bibitem*|31><label|bib-baumeister_survey_2022>Reuth Mirsky, Ignacio
      Carlucho, Arrasy Rahman, Elliot Fosong, William Macke, Mohan Sridharan,
      Peter Stone<localize|, and >Stefano<nbsp>V.<nbsp>Albrecht. <newblock>A
      Survey of Ad Hoc Teamwork Research. <newblock><localize|In >Dorothea
      Baumeister<localize| and >Jörg Rothe<localize|, editors>,
      <with|font-shape|italic|Multi-Agent Systems>, <localize|volume> 13442,
      <localize|pages >275-293. Springer International Publishing, Cham,
      2022.<newblock>

      <bibitem*|32><label|bib-osband_model-based_2014>Ian Osband<localize|
      and >Benjamin Van Roy. <newblock>Model-based Reinforcement Learning and
      the Eluder Dimension. <newblock><localize|In
      ><with|font-shape|italic|Advances in Neural Information Processing
      Systems>, <localize|volume><nbsp>27. Curran Associates, Inc.,
      2014.<newblock>

      <bibitem*|33><label|bib-pineau_anytime_2006>J.<nbsp>Pineau,
      G.<nbsp>Gordon<localize|, and >S.<nbsp>Thrun. <newblock>Anytime
      Point-Based Approximations for Large POMDPs.
      <newblock><with|font-shape|italic|Jair>, 27:335-380, nov
      2006.<newblock>

      <bibitem*|34><label|bib-ross_agnostic_2012>Stephane Ross<localize| and
      >J.<nbsp>Andrew Bagnell. <newblock>Agnostic System Identification for
      Model-Based Reinforcement Learning.
      <newblock><with|font-shape|italic|ArXiv:1203.1007 [cs, stat]>, jul
      2012.<newblock>

      <bibitem*|35><label|bib-russo_learning_2014>Daniel Russo<localize| and
      >Benjamin Van Roy. <newblock>Learning to Optimize Via Posterior
      Sampling. <newblock>feb 2014.<newblock>

      <bibitem*|36><label|bib-smallwood_optimal_1973>Richard<nbsp>D.<nbsp>Smallwood<localize|
      and >Edward<nbsp>J.<nbsp>Sondik. <newblock>The Optimal Control of
      Partially Observable Markov Processes Over a Finite Horizon.
      <newblock><with|font-shape|italic|Operations Research>,
      21(5):1071-1088, 1973.<newblock>

      <bibitem*|37><label|bib-steimle_multi-model_2021>Lauren<nbsp>N.<nbsp>Steimle,
      David<nbsp>L.<nbsp>Kaufman<localize|, and >Brian<nbsp>T.<nbsp>Denton.
      <newblock>Multi-model Markov decision processes.
      <newblock><with|font-shape|italic|IISE Transactions>, <localize|pages
      >1-16, may 2021.<newblock>

      <bibitem*|38><label|bib-stone_ad_2010>Peter Stone, Gal Kaminka, Sarit
      Kraus<localize|, and >Jeffrey Rosenschein. <newblock>Ad Hoc Autonomous
      Agent Teams: Collaboration without Pre-Coordination.
      <newblock><with|font-shape|italic|AAAI>, 24(1):1504-1509, jul
      2010.<newblock>

      <bibitem*|39><label|bib-taylor_transfer_2009>Matthew<nbsp>E.<nbsp>Taylor<localize|
      and >Peter Stone. <newblock>Transfer Learning for Reinforcement
      Learning Domains: A Survey. <newblock><with|font-shape|italic|J. Mach.
      Learn. Res.>, 10:1633-1685, dec 2009.<newblock>

      <bibitem*|40><label|bib-thompson_likelihood_1933>William<nbsp>R.<nbsp>Thompson.
      <newblock>On the Likelihood that One Unknown Probability Exceeds
      Another in View of the Evidence of Two Samples.
      <newblock><with|font-shape|italic|Biometrika>, 25(3/4):285-294,
      1933.<newblock>

      <bibitem*|41><label|bib-white_bayesian_1969>D.<nbsp>J.<nbsp>White.
      <newblock>Bayesian Decision Problems and Markov Chains.
      <newblock><with|font-shape|italic|Royal Statistical Society. Journal.
      Series A: General>, 132(1):106-107, jan 1969.<newblock>

      <bibitem*|42><label|bib-xie_learning_2020>Annie Xie,
      Dylan<nbsp>P.<nbsp>Losey, Ryan Tolsma, Chelsea Finn<localize|, and
      >Dorsa Sadigh. <newblock>Learning Latent Representations to Influence
      Multi-Agent Interaction. <newblock>nov 2020.<newblock>

      <bibitem*|43><label|bib-yang_sample-optimal_2019>Lin Yang<localize| and
      >Mengdi Wang. <newblock>Sample-Optimal Parametric Q-Learning Using
      Linearly Additive Features. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of the 36th International
      Conference on Machine Learning>, <localize|pages >6995-7004. PMLR, may
      2019.<newblock>

      <bibitem*|44><label|bib-zanette_learning_2020>Andrea Zanette,
      Alessandro Lazaric, Mykel Kochenderfer<localize|, and >Emma Brunskill.
      <newblock>Learning Near Optimal Policies with Low Inherent Bellman
      Error. <newblock><localize|In ><with|font-shape|italic|Proceedings of
      the 37th International Conference on Machine Learning>, <localize|pages
      >10978-10989. PMLR, nov 2020.<newblock>

      <bibitem*|45><label|bib-zhang_feel-good_2021>Tong Zhang.
      <newblock>Feel-Good Thompson Sampling for Contextual Bandits and
      Reinforcement Learning. <newblock>oct 2021.<newblock>

      <bibitem*|46><label|bib-zhong_gec_2023>Han Zhong, Wei Xiong, Sirui
      Zheng, Liwei Wang, Zhaoran Wang, Zhuoran Yang<localize|, and >Tong
      Zhang. <newblock>GEC: A Unified Framework for Interactive Decision
      Making in MDP, POMDP, and Beyond. <newblock>jun 2023.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|5|?>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|2.1|1>>
    <associate|auto-4|<tuple|3|1>>
    <associate|auto-5|<tuple|3.1|1>>
    <associate|auto-6|<tuple|3.2|1>>
    <associate|auto-7|<tuple|4|2>>
    <associate|auto-8|<tuple|4.1|2>>
    <associate|auto-9|<tuple|4.1|2>>
    <associate|bib-agarwal_model-based_2022|<tuple|1|2>>
    <associate|bib-agarwal_non-linear_2022|<tuple|2|2>>
    <associate|bib-albrecht_autonomous_2018|<tuple|5|2>>
    <associate|bib-albrecht_belief_2016|<tuple|3|2>>
    <associate|bib-albrecht_game-theoretic_2015|<tuple|4|2>>
    <associate|bib-auer_near-optimal_2008|<tuple|6|2>>
    <associate|bib-azar_minimax_2017|<tuple|7|2>>
    <associate|bib-azizzadenesheli_reinforcement_2016|<tuple|8|2>>
    <associate|bib-barrett_making_2017|<tuple|9|2>>
    <associate|bib-baumeister_survey_2022|<tuple|31|3>>
    <associate|bib-ben-davidAgnosticOnlineLearning2009|<tuple|10|2>>
    <associate|bib-brunskill_sample_2013|<tuple|11|2>>
    <associate|bib-buchholz_computation_2019|<tuple|12|2>>
    <associate|bib-carroll_utility_2019|<tuple|13|2>>
    <associate|bib-chades_momdps_2012|<tuple|14|2>>
    <associate|bib-dong_q-learning_2019|<tuple|15|2>>
    <associate|bib-duff_optimal_2002|<tuple|16|2>>
    <associate|bib-gmytrasiewicz_framework_2005|<tuple|17|2>>
    <associate|bib-guez_efficient_2012|<tuple|18|2>>
    <associate|bib-guo_pac_2016|<tuple|19|2>>
    <associate|bib-hallak_contextual_2015|<tuple|20|2>>
    <associate|bib-han_learning_2018|<tuple|21|2>>
    <associate|bib-he_opponent_2016|<tuple|22|2>>
    <associate|bib-jiang_contextual_2016|<tuple|23|3>>
    <associate|bib-jin_bellman_2021|<tuple|25|3>>
    <associate|bib-jin_is_2018|<tuple|24|3>>
    <associate|bib-jin_provably_2020|<tuple|26|3>>
    <associate|bib-kwon_rl_2021|<tuple|27|3>>
    <associate|bib-lai_asymptotically_1985|<tuple|28|3>>
    <associate|bib-liu_one_2023|<tuple|30|3>>
    <associate|bib-liu_pac_2016|<tuple|29|3>>
    <associate|bib-osband_model-based_2014|<tuple|32|3>>
    <associate|bib-pineau_anytime_2006|<tuple|33|3>>
    <associate|bib-ross_agnostic_2012|<tuple|34|3>>
    <associate|bib-russo_learning_2014|<tuple|35|3>>
    <associate|bib-smallwood_optimal_1973|<tuple|36|3>>
    <associate|bib-steimle_multi-model_2021|<tuple|37|3>>
    <associate|bib-stone_ad_2010|<tuple|38|3>>
    <associate|bib-taylor_transfer_2009|<tuple|39|3>>
    <associate|bib-thompson_likelihood_1933|<tuple|40|3>>
    <associate|bib-white_bayesian_1969|<tuple|41|3>>
    <associate|bib-xie_learning_2020|<tuple|42|3>>
    <associate|bib-yang_sample-optimal_2019|<tuple|43|3>>
    <associate|bib-zanette_learning_2020|<tuple|44|3>>
    <associate|bib-zhang_feel-good_2021|<tuple|45|3>>
    <associate|bib-zhong_gec_2023|<tuple|46|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      baumeister_survey_2022

      albrecht_autonomous_2018

      stone_ad_2010

      albrecht_game-theoretic_2015

      albrecht_belief_2016

      barrett_making_2017

      carroll_utility_2019

      he_opponent_2016

      smallwood_optimal_1973

      kwon_rl_2021

      hallak_contextual_2015

      brunskill_sample_2013

      han_learning_2018

      gmytrasiewicz_framework_2005

      white_bayesian_1969

      duff_optimal_2002

      guez_efficient_2012

      hallak_contextual_2015

      steimle_multi-model_2021

      liu_pac_2016

      taylor_transfer_2009

      brunskill_sample_2013

      chades_momdps_2012

      buchholz_computation_2019

      guo_pac_2016

      azizzadenesheli_reinforcement_2016

      jiang_contextual_2016

      thompson_likelihood_1933

      russo_learning_2014

      zhong_gec_2023

      agarwal_model-based_2022

      zhang_feel-good_2021

      agarwal_non-linear_2022

      liu_one_2023

      osband_model-based_2014

      yang_sample-optimal_2019

      jin_provably_2020

      zanette_learning_2020

      jiang_contextual_2016

      osband_model-based_2014

      jin_bellman_2021

      ben-davidAgnosticOnlineLearning2009

      ross_agnostic_2012

      jin_is_2018

      dong_q-learning_2019

      lai_asymptotically_1985

      azar_minimax_2017

      auer_near-optimal_2008

      pineau_anytime_2006

      xie_learning_2020
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>AHT>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>POMDP>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>LMDP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>MEX
      and Optimistic Posterior Sampling> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>GEC Assumption
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Agnostic online learning
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Other
      Algorithms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>