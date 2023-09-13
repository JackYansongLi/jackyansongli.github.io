<TeXmacs|2.1.2>

<style|generic>

<\body>
  <\hide-preamble>
    <assign|uic|University of Illinois Chicago>
  </hide-preamble>

  <doc-data|<doc-title|MEX Algorithm in HAI>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<author-email|yli340@uic.edu>|<\author-affiliation>
    <value|uic>
  </author-affiliation>>>>

  <section|Introduction>

  Training an AI agent capable of cooperating with various types of humans
  stands as a central challenge in human-AI Interaction (HAI). This problem
  proves to be difficult because different humans can create varied
  environments for the AI agent to navigate. Additionally, the AI agent
  cannot presume rational behavior from humans within the collaboration
  setting <cite|carroll_utility_2019>. Many studies in the realm of
  multi-agent reinforcement learning have primarily focused on centralized
  settings <cite|zhang_multi-agent_2021><cite|yao_smixlambda_2020><cite|foerster_counterfactual_2017>,
  which becomes problematic in scenarios lacking a feasible central control
  for individual agents.

  Consequently, collaborating with unknown humans without predetermined
  communication or coordination guidelines becomes important, giving rise to
  a research area named ad-hoc teamwork <cite|baumeister_survey_2022><cite|albrecht_autonomous_2018><cite|stone_ad_2010>.
  A pivotal subtask within the domain of ad-hoc teamwork is opponent modeling
  <cite|albrecht_game-theoretic_2015><cite|albrecht_belief_2016><cite|barrett_making_2017><cite|xie_learning_2020><cite|he_opponent_2016>,
  a concept that, in the context of Human-AI (HAI) interactions, primarily
  entails modeling human behaviors and policies.

  In this paper, we tackle a problem in the Human-AI (HAI) interaction domain
  where there are two participants: a human agent and an AI agent. The human
  agent keeps her policy hidden from the AI. However, the AI starts with a
  few initial guesses about the human's possible policies. The main goal of
  the AI is to figure out the actual policies the human agent is using. We
  categorize this approach as falling within several known frameworks such as
  latent Markov Decision Processes (MDP) <cite|kwon_rl_2021><cite|hallak_contextual_2015><cite|brunskill_sample_2013>
  and multi-task Reinforcement Learning (RL) <cite|liu_pac_2016>
  <cite|taylor_transfer_2009> <cite|brunskill_sample_2013>. We will explore
  these and others in greater detail in the related work.\ 

  To model the HAI problem, we use an episodic Markov decision process where
  the transitions and rewards are influenced by the policy that the human
  agent keeps secret. The AI agent begins with a set of initial guesses about
  the human's policy, grouped together in a finite hypothesis set
  <math|\<cal-H\>>. We discuss loosening the limitation of this finite set in
  a later section (refer to the section on the infinite hypothesis set). It's
  assumed that the actual policy the human is using is a part of set
  <math|\<cal-H\>>, an idea referred to as the realization assumption. We'll
  talk about easing this assumption in another section (see the section on
  the realization assumption).

  We used the Maximize to Explore (MEX) algorithm mentioned in
  <cite|liu_one_2023> to tackle the episodic MDP with an undefined hypothesis
  set. We confirm a sub-linear regret outcome in Section (finite regret).
  Moreover, we found that the MEX algorithm can naturally decrease the size
  of the hypothesis set by grouping together human policies that are of the
  same type, allowing for a regret boundary that is smaller than the upper
  limit noted in <cite|liu_one_2023>. The definition for policies be of the
  same type is introduced in Section (same type). Furthermore, we applied the
  MEX algorithm with an infinite hypothesis set that encompasses the true
  policy. We demonstrated that utilizing MEX with a finite hypothesis set,
  which contains a policy nearly identical to the true policy in the infinite
  hypothesis set, can still achieve sub-linear regret that tends to a value
  that close to an optimal value. This aspect is elaborated in Section
  (infinite hypothesis set).

  In our experiment, we developed a simplified environment of the
  Overcooked-AI <cite|carroll_utility_2019>, where agents are required to
  engage in a series of actions such as cooking, waiting, and delivering
  food. The simplified version of Overcooked-AI, focusing exclusively on the
  food delivery task. This simplification is essential as it enables us to
  focus clearly on the main challenges posed by the original environment but
  significantly reduce the size of both state and action spaces, leading to a
  considerable decrease in computational complexity.

  We created the finite hypothesis set using the best response dynamics
  method <cite|strouse_collaborating_2022>, where agents constantly modify
  their policies to best respond to the policies observed from other agents.
  In addition to this, numerous studies have explored various approaches to
  develop a finite hypothesis set <math|\<cal-H\>>
  <cite|rahman_generating_2023><cite|strouse_collaborating_2022>. The
  infinite hypothesis set is defined as an open cover of the generated finite
  hypothesis set, which mimic the situation that human agents' bounded
  rationality.

  We compared our algorithm with <math|Q>-learning with UCB exploration
  <cite|jin_is_2018><cite|dong_q-learning_2019>, Upper confidence bound
  <cite|lai_asymptotically_1985>, optimistic posterior sampling
  <cite|zhong_gec_2023>, and UCRL2 <cite|auer_near-optimal_2008> algorithms.
  Our results shows that (added experiment)

  <section|Related Work>

  Previous research in the Human-AI (HAI) field tends to model human policy
  as a policy that closely aligns with the AI agent, with efforts to
  parameterize this closeness [42]. \ To evaluate these algorithms, several
  benchmark environments are available that aid in analyzing cooperative
  human-AI interaction tasks, including platforms like the two-player
  cooperative Atari game [57], bridge card game [40], and Overcooked-AI
  [16][54].

  <with|font-series|bold|Human-AI Interaction>: Previous research in the
  Human-AI (HAI) field model human policy as a policy that closely aligns
  with the AI agent, with efforts to parameterize this closeness
  <cite|nikolaidis_human-robot_2017>. Additionally, there are studies in Meta
  Reinforcement Learning (Meta RL) that work on deciphering the MDP the AI
  agent encounters, inherently learning the human agent's policy, since the
  structure of this MDP is influenced by the human agent's choices. To
  evaluate these algorithms, several benchmark environments are available
  that aid in analyzing cooperative human-AI interaction tasks, including
  platforms like the two-player cooperative Atari game
  <cite|tylkin_learning_2021>, bridge card <cite|lockhart_human-agent_2020>,
  and Overcooked-AI <cite|carroll_utility_2019><cite|strouse_collaborating_2022>.\ 

  <with|font-series|bold|Human agent generation:> Collecting human policies
  can be notably costly. Previous studies have developed methods for more
  efficient human policies generation. One such method utilizes an algorithm
  that identifies and selects policies based on a measure defined by the
  diversity of the best responses these policies can offer. The algorithm
  then maximizes this measure to find the policies that provide a diverse set
  of best responses <cite|rahman_generating_2023>. Another strategy
  formulates human policies by running best response dynamics
  <cite|strouse_collaborating_2022>.

  <with|font-series|bold|Ad-Hoc teamworks:> Our work is closely related to
  ad-hoc teamworks <cite|baumeister_survey_2022><cite|albrecht_autonomous_2018><cite|stone_ad_2010>
  , especially the opponent modeling subtask. Barrett et. al.
  <cite|barrett_making_2017> introduces PLASTIC-Model and PLASTIC-Policy
  algorithms, the formal algorithm models the team-member by its transition
  dynamics and the latter models team-member by its policy. He et.al.
  <cite|he_opponent_2016> models the human agent's policy as a deep neural
  network.

  <with|color|blue|YL: needs more time to read
  <cite|albrecht_game-theoretic_2015><cite|albrecht_belief_2016><cite|xie_learning_2020>
  >

  <with|font-series|bold|Partially observable Markov decision process
  (POMDP):> The foundation of our problem is closely related to the partially
  observable Markov decision process <cite|astrom_optimal_1965><cite|smallwood_optimal_1973>,
  since each human policy in the hypothesis set can be viewed as a latent
  variable of the POMDP. The POMDP problem where we have latent variables are
  called latent MDPs (LMDP) <cite|kwon_rl_2021>. LMDP has few different
  names, such as contextual decision process <cite|hallak_contextual_2015>,
  multi-model MDP <cite|steimle_multi-model_2021>, multi-task RL
  <cite|liu_pac_2016><cite|taylor_transfer_2009><cite|brunskill_sample_2013>,
  MOMDP/hidden model MDP <cite|ong_planning_2010><cite|chades_momdps_2012><cite|doshi-velez_hidden_2013><cite|fern_decision-theoretic_2014>,
  and concurrent MDP <cite|buchholz_computation_2019>. Beyond original POMDP,
  there are also some other settings that can cover our problem, such as
  interactive-POMDP <cite|han_learning_2018><cite|gmytrasiewicz_framework_2005>,
  Augmented Bayes-Adaptive MDP (BAMDP) <cite|white_bayesian_1969><cite|duff_optimal_2002><cite|guez_efficient_2012>.
  The model-based RL with UCB exploration algorithms
  <cite|strehl_analysis_2008><cite|azar_minimax_2017> is also related to our
  setting.

  <with|font-series|bold|MEX related algorithms:> Our algorithm is based on
  MEX <cite|liu_one_2023>, in each episode, the algorithm chooses a human
  policy from the hypothesis set. On the other hand, the posterior sampling
  algorithms <cite|thompson_likelihood_1933><cite|russo_learning_2014><cite|zhong_gec_2023><cite|agarwal_model-based_2022><cite|zhang_feel-good_2021><cite|agarwal_non-linear_2022><cite|agrawal_posterior_2020>
  updates a belief over the hypothesis set in each episode and draws a policy
  based on the current belief. Some methods like OLIVE
  <cite|jiang_contextual_2016> eliminates policy from current hypothesis set
  in each episode. Additionally, there is a method that trains one policy
  that is robust for all possible human policies in the hypothesis set
  <cite|bertuccelli_robust_2012>.

  <with|font-series|bold|MDP structure assumptions:> Our regret analysis is
  based on the low generalized eluder coefficient assumption
  <cite|zhong_gec_2023>, which is a weaker assumption than low Eluder
  dimension/Bellman eluder dimension <cite|osband_model-based_2014><cite|jin_bellman_2021>,
  low Bellman rank <cite|jiang_contextual_2016>, Bellman completeness
  <cite|zanette_learning_2020>, Bilinear classes <cite|du_bilinear_2021>, and
  linear MDP structure <cite|yang_sample-optimal_2019><cite|jin_provably_2020>.
  The environment we used in the experiment is a tabular MDP which satisfies
  the low Bellman eluder dimension assumption <cite|jin_bellman_2021>. Also,
  the regret analysis of infinite hypothesis set are related to agnostic
  online learning <cite|ben-davidAgnosticOnlineLearning2009><cite|ross_agnostic_2012>.

  <\bibliography|bib|tm-plain|reference>
    <\bib-list|65>
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

      <bibitem*|3><label|bib-agrawal_posterior_2020>Shipra Agrawal<localize|
      and >Randy Jia. <newblock>Posterior sampling for reinforcement
      learning: worst-case regret bounds. <newblock>mar 2020.<newblock>

      <bibitem*|4><label|bib-albrecht_belief_2016>Stefano<nbsp>V.<nbsp>Albrecht,
      Jacob<nbsp>W.<nbsp>Crandall<localize|, and >Subramanian Ramamoorthy.
      <newblock>Belief and Truth in Hypothesised Behaviours.
      <newblock><with|font-shape|italic|Artificial Intelligence>, 235:63-94,
      jun 2016.<newblock>

      <bibitem*|5><label|bib-albrecht_game-theoretic_2015>Stefano<nbsp>V.<nbsp>Albrecht<localize|
      and >Subramanian Ramamoorthy. <newblock>A Game-Theoretic Model and
      Best-Response Learning Method for Ad Hoc Coordination in Multiagent
      Systems. <newblock>jun 2015.<newblock>

      <bibitem*|6><label|bib-albrecht_autonomous_2018>Stefano<nbsp>V.<nbsp>Albrecht<localize|
      and >Peter Stone. <newblock>Autonomous agents modelling other agents: A
      comprehensive survey and open problems.
      <newblock><with|font-shape|italic|Artificial Intelligence>, 258:66-95,
      may 2018.<newblock>

      <bibitem*|7><label|bib-astrom_optimal_1965>K.J Åström.
      <newblock>Optimal control of Markov processes with incomplete state
      information. <newblock><with|font-shape|italic|Journal of Mathematical
      Analysis and Applications>, 10(1):174-205, feb 1965.<newblock>

      <bibitem*|8><label|bib-auer_near-optimal_2008>Peter Auer, Thomas
      Jaksch<localize|, and >Ronald Ortner. <newblock>Near-optimal Regret
      Bounds for Reinforcement Learning. <newblock><localize|In
      ><with|font-shape|italic|Advances in Neural Information Processing
      Systems>, <localize|volume><nbsp>21. Curran Associates, Inc.,
      2008.<newblock>

      <bibitem*|9><label|bib-azar_minimax_2017>Mohammad<nbsp>Gheshlaghi Azar,
      Ian Osband<localize|, and >Rémi Munos. <newblock>Minimax Regret Bounds
      for Reinforcement Learning. <newblock>jul 2017.<newblock>

      <bibitem*|10><label|bib-azizzadenesheli_reinforcement_2016>Kamyar
      Azizzadenesheli, Alessandro Lazaric<localize|, and >Animashree
      Anandkumar. <newblock>Reinforcement Learning of POMDPs using Spectral
      Methods. <newblock>may 2016.<newblock>

      <bibitem*|11><label|bib-barrett_making_2017>Samuel Barrett, Avi
      Rosenfeld, Sarit Kraus<localize|, and >Peter Stone. <newblock>Making
      friends on the fly: Cooperating with new teammates.
      <newblock><with|font-shape|italic|Artificial Intelligence>,
      242:132-171, jan 2017.<newblock>

      <bibitem*|12><label|bib-ben-davidAgnosticOnlineLearning2009>Shai
      Ben-David, D.<nbsp>Pál<localize|, and >S.<nbsp>Shalev-Shwartz.
      <newblock>Agnostic Online Learning. <newblock><localize|In
      ><with|font-shape|italic|Annual Conference Computational Learning
      Theory>. 2009.<newblock>

      <bibitem*|13><label|bib-bertuccelli_robust_2012>Luca<nbsp>F.<nbsp>Bertuccelli,
      Albert Wu<localize|, and >Jonathan<nbsp>P.<nbsp>How. <newblock>Robust
      Adaptive Markov Decision Processes: Planning with Model Uncertainty.
      <newblock><with|font-shape|italic|IEEE Control Systems Magazine>,
      32(5):96-109, oct 2012.<newblock>

      <bibitem*|14><label|bib-brunskill_sample_2013>Emma Brunskill<localize|
      and >Lihong Li. <newblock>Sample Complexity of Multi-task Reinforcement
      Learning. <newblock>sep 2013.<newblock>

      <bibitem*|15><label|bib-buchholz_computation_2019>Peter
      Buchholz<localize| and >Dimitri Scheftelowitsch. <newblock>Computation
      of weighted sums of rewards for concurrent MDPs.
      <newblock><with|font-shape|italic|Math Meth Oper Res>, 89(1):1-42, feb
      2019.<newblock>

      <bibitem*|16><label|bib-carroll_utility_2019>Micah Carroll, Rohin Shah,
      Mark<nbsp>K.<nbsp>Ho, Thomas<nbsp>L.<nbsp>Griffiths,
      Sanjit<nbsp>A.<nbsp>Seshia, Pieter Abbeel<localize|, and >Anca Dragan.
      <newblock>On the Utility of Learning about Humans for Human-AI
      Coordination. <newblock>Oct 2019.<newblock>

      <bibitem*|17><label|bib-chades_momdps_2012>Iadine Chades, Josie
      Carwardine, Tara Martin, Samuel Nicol, Regis Sabbadin<localize|, and
      >Olivier Buffet. <newblock>MOMDPs: A Solution for Modelling Adaptive
      Management Problems. <newblock><with|font-shape|italic|Proceedings of
      the AAAI Conference on Artificial Intelligence>, 26(1):267-273,
      2012.<newblock>

      <bibitem*|18><label|bib-charakorn_learning_2021>Rujikorn Charakorn,
      Poramate Manoonpong<localize|, and >Nat Dilokthanakul.
      <newblock>Learning to Cooperate with Unseen Agent via
      Meta-Reinforcement Learning. <newblock>nov 2021.<newblock>

      <bibitem*|19><label|bib-dong_q-learning_2019>Kefan Dong, Yuanhao Wang,
      Xiaoyu Chen<localize|, and >Liwei Wang. <newblock>Q-learning with UCB
      Exploration is Sample Efficient for Infinite-Horizon MDP. <newblock>sep
      2019.<newblock>

      <bibitem*|20><label|bib-doshi-velez_hidden_2013>Finale
      Doshi-Velez<localize| and >George Konidaris. <newblock>Hidden Parameter
      Markov Decision Processes: A Semiparametric Regression Approach for
      Discovering Latent Task Parametrizations. <newblock>aug 2013.<newblock>

      <bibitem*|21><label|bib-du_bilinear_2021>Simon<nbsp>S.<nbsp>Du,
      Sham<nbsp>M.<nbsp>Kakade, Jason<nbsp>D.<nbsp>Lee, Shachar Lovett,
      Gaurav Mahajan, Wen Sun<localize|, and >Ruosong Wang.
      <newblock>Bilinear Classes: A Structural Framework for Provable
      Generalization in RL. <newblock>jul 2021.<newblock>

      <bibitem*|22><label|bib-duff_optimal_2002>Michael<nbsp>O'Gordon Duff.
      <newblock>Optimal learning: Computational procedures for Bayes
      -adaptive Markov decision processes.
      <newblock><with|font-shape|italic|Doctoral Dissertations Available from
      Proquest>, <localize|pages >1-247, jan 2002.<newblock>

      <bibitem*|23><label|bib-fern_decision-theoretic_2014>A.<nbsp>Fern,
      S.<nbsp>Natarajan, K.<nbsp>Judah<localize|, and >P.<nbsp>Tadepalli.
      <newblock>A Decision-Theoretic Model of Assistance.
      <newblock><with|font-shape|italic|Journal of Artificial Intelligence
      Research>, 50:71-104, may 2014.<newblock>

      <bibitem*|24><label|bib-foerster_counterfactual_2017>Jakob Foerster,
      Gregory Farquhar, Triantafyllos Afouras, Nantas Nardelli<localize|, and
      >Shimon Whiteson. <newblock>Counterfactual Multi-Agent Policy
      Gradients. <newblock>dec 2017.<newblock>

      <bibitem*|25><label|bib-gmytrasiewicz_framework_2005>P.<nbsp>J.<nbsp>Gmytrasiewicz<localize|
      and >P.<nbsp>Doshi. <newblock>A Framework for Sequential Planning in
      Multi-Agent Settings. <newblock><with|font-shape|italic|Journal of
      Artificial Intelligence Research>, 24:49-79, jul 2005.<newblock>

      <bibitem*|26><label|bib-guez_efficient_2012>Arthur Guez, David
      Silver<localize|, and >Peter Dayan. <newblock>Efficient Bayes-adaptive
      reinforcement learning using sample-based search.
      <newblock><localize|In ><with|font-shape|italic|Proceedings of the 25th
      International Conference on Neural Information Processing Systems -
      Volume 1>, NIPS'12, <localize|pages >1025-1033. Red Hook, NY, USA, dec
      2012. Curran Associates Inc.<newblock>

      <bibitem*|27><label|bib-guo_pac_2016>Z.<nbsp>Guo, Shayan
      Doroudi<localize|, and >E.<nbsp>Brunskill. <newblock>A PAC RL Algorithm
      for Episodic POMDPs. <newblock><localize|In
      ><with|font-shape|italic|International Conference on Artificial
      Intelligence and Statistics>. May 2016.<newblock>

      <bibitem*|28><label|bib-hallak_contextual_2015>Assaf Hallak, Dotan Di
      Castro<localize|, and >Shie Mannor. <newblock>Contextual Markov
      Decision Processes. <newblock>feb 2015.<newblock>

      <bibitem*|29><label|bib-han_learning_2018>Yanlin Han<localize| and
      >Piotr Gmytrasiewicz. <newblock>Learning Others' Intentional Models in
      Multi-Agent Settings Using Interactive POMDPs. <newblock><localize|In
      ><with|font-shape|italic|Advances in Neural Information Processing
      Systems>, <localize|volume><nbsp>31. Curran Associates, Inc.,
      2018.<newblock>

      <bibitem*|30><label|bib-he_opponent_2016>He He, Jordan Boyd-Graber,
      Kevin Kwok<localize|, and >Hal Daumé III. <newblock>Opponent Modeling
      in Deep Reinforcement Learning. <newblock>sep 2016.<newblock>

      <bibitem*|31><label|bib-jiang_contextual_2016>Nan Jiang, Akshay
      Krishnamurthy, Alekh Agarwal, John Langford<localize|, and
      >Robert<nbsp>E.<nbsp>Schapire. <newblock>Contextual Decision Processes
      with Low Bellman Rank are PAC-Learnable. <newblock>dec 2016.<newblock>

      <bibitem*|32><label|bib-jin_is_2018>Chi Jin, Zeyuan Allen-Zhu,
      Sebastien Bubeck<localize|, and >Michael<nbsp>I.<nbsp>Jordan.
      <newblock>Is Q-learning Provably Efficient? <newblock>jul
      2018.<newblock>

      <bibitem*|33><label|bib-jin_sample-efficient_2020>Chi Jin,
      Sham<nbsp>M.<nbsp>Kakade, Akshay Krishnamurthy<localize|, and >Qinghua
      Liu. <newblock>Sample-Efficient Reinforcement Learning of Undercomplete
      POMDPs. <newblock>oct 2020.<newblock>

      <bibitem*|34><label|bib-jin_bellman_2021>Chi Jin, Qinghua
      Liu<localize|, and >Sobhan Miryoosefi. <newblock>Bellman Eluder
      Dimension: New Rich Classes of RL Problems, and Sample-Efficient
      Algorithms. <newblock>jul 2021.<newblock>

      <bibitem*|35><label|bib-jin_provably_2020>Chi Jin, Zhuoran Yang,
      Zhaoran Wang<localize|, and >Michael<nbsp>I.<nbsp>Jordan.
      <newblock>Provably efficient reinforcement learning with linear
      function approximation. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of Thirty Third Conference on
      Learning Theory>, <localize|pages >2137-2143. PMLR, jul 2020.<newblock>

      <bibitem*|36><label|bib-kwon_rl_2021>Jeongyeol Kwon, Yonathan Efroni,
      Constantine Caramanis<localize|, and >Shie Mannor. <newblock>RL for
      Latent MDPs: Regret Guarantees and a Lower Bound. <newblock>feb
      2021.<newblock>

      <bibitem*|37><label|bib-lai_asymptotically_1985>T.<nbsp>L Lai<localize|
      and >Herbert Robbins. <newblock>Asymptotically efficient adaptive
      allocation rules. <newblock><with|font-shape|italic|Advances in Applied
      Mathematics>, 6(1):4-22, mar 1985.<newblock>

      <bibitem*|38><label|bib-liu_pac_2016>Yao Liu, Zhaohan Guo<localize|,
      and >Emma Brunskill. <newblock>PAC Continuous State Online Multitask
      Reinforcement Learning with Identification. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of the 2016 International
      Conference on Autonomous Agents & Multiagent Systems>, AAMAS '16,
      <localize|pages >438-446. Richland, SC, may 2016. International
      Foundation for Autonomous Agents and Multiagent Systems.<newblock>

      <bibitem*|39><label|bib-liu_one_2023>Zhihan Liu, Miao Lu, Wei Xiong,
      Han Zhong, Hao Hu, Shenao Zhang, Sirui Zheng, Zhuoran Yang<localize|,
      and >Zhaoran Wang. <newblock>One Objective to Rule Them All: A
      Maximization Objective Fusing Estimation and Planning for Exploration.
      <newblock>may 2023.<newblock>

      <bibitem*|40><label|bib-lockhart_human-agent_2020>Edward Lockhart, Neil
      Burch, Nolan Bard, Sebastian Borgeaud, Tom Eccles, Lucas
      Smaira<localize|, and >Ray Smith. <newblock>Human-Agent Cooperation in
      Bridge Bidding. <newblock>nov 2020.<newblock>

      <bibitem*|41><label|bib-baumeister_survey_2022>Reuth Mirsky, Ignacio
      Carlucho, Arrasy Rahman, Elliot Fosong, William Macke, Mohan Sridharan,
      Peter Stone<localize|, and >Stefano<nbsp>V.<nbsp>Albrecht. <newblock>A
      Survey of Ad Hoc Teamwork Research. <newblock><localize|In >Dorothea
      Baumeister<localize| and >Jörg Rothe<localize|, editors>,
      <with|font-shape|italic|Multi-Agent Systems>, <localize|volume> 13442,
      <localize|pages >275-293. Springer International Publishing, Cham,
      2022.<newblock>

      <bibitem*|42><label|bib-nikolaidis_human-robot_2017>Stefanos
      Nikolaidis, David Hsu<localize|, and >Siddhartha Srinivasa.
      <newblock>Human-robot mutual adaptation in collaborative tasks: Models
      and experiments. <newblock><with|font-shape|italic|The International
      Journal of Robotics Research>, 36(5-7):618-634, jun 2017.<newblock>

      <bibitem*|43><label|bib-ong_planning_2010>Sylvie<nbsp>C.<nbsp>W.<nbsp>Ong,
      Shao<nbsp>Wei Png, David Hsu<localize|, and >Wee<nbsp>Sun Lee.
      <newblock>Planning under Uncertainty for Robotic Tasks with Mixed
      Observability. <newblock><with|font-shape|italic|Int. J. Rob. Res.>,
      29(8):1053-1068, jul 2010.<newblock>

      <bibitem*|44><label|bib-osband_model-based_2014>Ian Osband<localize|
      and >Benjamin Van Roy. <newblock>Model-based Reinforcement Learning and
      the Eluder Dimension. <newblock><localize|In
      ><with|font-shape|italic|Advances in Neural Information Processing
      Systems>, <localize|volume><nbsp>27. Curran Associates, Inc.,
      2014.<newblock>

      <bibitem*|45><label|bib-pineau_anytime_2006>J.<nbsp>Pineau,
      G.<nbsp>Gordon<localize|, and >S.<nbsp>Thrun. <newblock>Anytime
      Point-Based Approximations for Large POMDPs.
      <newblock><with|font-shape|italic|Jair>, 27:335-380, nov
      2006.<newblock>

      <bibitem*|46><label|bib-rahman_generating_2023>Arrasy Rahman, Elliot
      Fosong, Ignacio Carlucho<localize|, and >Stefano<nbsp>V.<nbsp>Albrecht.
      <newblock>Generating Teammates for Training Robust Ad Hoc Teamwork
      Agents via Best-Response Diversity.
      <newblock><with|font-shape|italic|Transactions on Machine Learning
      Research>, may 2023.<newblock>

      <bibitem*|47><label|bib-ribeiro_assisting_2022>João<nbsp>G.<nbsp>Ribeiro,
      Cassandro Martinho, Alberto Sardinha<localize|, and
      >Francisco<nbsp>S.<nbsp>Melo. <newblock>Assisting Unknown Teammates in
      Unknown Tasks: Ad Hoc Teamwork under Partial Observability.
      <newblock>jan 2022.<newblock>

      <bibitem*|48><label|bib-ross_agnostic_2012>Stephane Ross<localize| and
      >J.<nbsp>Andrew Bagnell. <newblock>Agnostic System Identification for
      Model-Based Reinforcement Learning.
      <newblock><with|font-shape|italic|ArXiv:1203.1007 [cs, stat]>, jul
      2012.<newblock>

      <bibitem*|49><label|bib-russo_learning_2014>Daniel Russo<localize| and
      >Benjamin Van Roy. <newblock>Learning to Optimize Via Posterior
      Sampling. <newblock>feb 2014.<newblock>

      <bibitem*|50><label|bib-smallwood_optimal_1973>Richard<nbsp>D.<nbsp>Smallwood<localize|
      and >Edward<nbsp>J.<nbsp>Sondik. <newblock>The Optimal Control of
      Partially Observable Markov Processes Over a Finite Horizon.
      <newblock><with|font-shape|italic|Operations Research>,
      21(5):1071-1088, 1973.<newblock>

      <bibitem*|51><label|bib-steimle_multi-model_2021>Lauren<nbsp>N.<nbsp>Steimle,
      David<nbsp>L.<nbsp>Kaufman<localize|, and >Brian<nbsp>T.<nbsp>Denton.
      <newblock>Multi-model Markov decision processes.
      <newblock><with|font-shape|italic|IISE Transactions>, <localize|pages
      >1-16, may 2021.<newblock>

      <bibitem*|52><label|bib-stone_ad_2010>Peter Stone, Gal Kaminka, Sarit
      Kraus<localize|, and >Jeffrey Rosenschein. <newblock>Ad Hoc Autonomous
      Agent Teams: Collaboration without Pre-Coordination.
      <newblock><with|font-shape|italic|AAAI>, 24(1):1504-1509, jul
      2010.<newblock>

      <bibitem*|53><label|bib-strehl_analysis_2008>Alexander<nbsp>L.<nbsp>Strehl<localize|
      and >Michael<nbsp>L.<nbsp>Littman. <newblock>An analysis of model-based
      Interval Estimation for Markov Decision Processes.
      <newblock><with|font-shape|italic|Journal of Computer and System
      Sciences>, 74(8):1309-1331, dec 2008.<newblock>

      <bibitem*|54><label|bib-strouse_collaborating_2022>D.<nbsp>J.<nbsp>Strouse,
      Kevin<nbsp>R.<nbsp>McKee, Matt Botvinick, Edward Hughes<localize|, and
      >Richard Everett. <newblock>Collaborating with Humans without Human
      Data. <newblock>jan 2022.<newblock>

      <bibitem*|55><label|bib-taylor_transfer_2009>Matthew<nbsp>E.<nbsp>Taylor<localize|
      and >Peter Stone. <newblock>Transfer Learning for Reinforcement
      Learning Domains: A Survey. <newblock><with|font-shape|italic|J. Mach.
      Learn. Res.>, 10:1633-1685, dec 2009.<newblock>

      <bibitem*|56><label|bib-thompson_likelihood_1933>William<nbsp>R.<nbsp>Thompson.
      <newblock>On the Likelihood that One Unknown Probability Exceeds
      Another in View of the Evidence of Two Samples.
      <newblock><with|font-shape|italic|Biometrika>, 25(3/4):285-294,
      1933.<newblock>

      <bibitem*|57><label|bib-tylkin_learning_2021>Paul Tylkin, Goran
      Radanovic<localize|, and >David<nbsp>C Parkes. <newblock>Learning
      Robust Helpful Behaviors in Two-Player Cooperative Atari Environments.
      <newblock>2021.<newblock>

      <bibitem*|58><label|bib-white_bayesian_1969>D.<nbsp>J.<nbsp>White.
      <newblock>Bayesian Decision Problems and Markov Chains.
      <newblock><with|font-shape|italic|Royal Statistical Society. Journal.
      Series A: General>, 132(1):106-107, jan 1969.<newblock>

      <bibitem*|59><label|bib-xie_learning_2020>Annie Xie,
      Dylan<nbsp>P.<nbsp>Losey, Ryan Tolsma, Chelsea Finn<localize|, and
      >Dorsa Sadigh. <newblock>Learning Latent Representations to Influence
      Multi-Agent Interaction. <newblock>nov 2020.<newblock>

      <bibitem*|60><label|bib-yang_sample-optimal_2019>Lin Yang<localize| and
      >Mengdi Wang. <newblock>Sample-Optimal Parametric Q-Learning Using
      Linearly Additive Features. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of the 36th International
      Conference on Machine Learning>, <localize|pages >6995-7004. PMLR, may
      2019.<newblock>

      <bibitem*|61><label|bib-yao_smixlambda_2020>Xinghu Yao, Chao Wen, Yuhui
      Wang<localize|, and >Xiaoyang Tan. <newblock>SMIX($\\ lambda$):
      Enhancing Centralized Value Functions for Cooperative Multi-Agent
      Reinforcement Learning. <newblock>aug 2020.<newblock>

      <bibitem*|62><label|bib-zanette_learning_2020>Andrea Zanette,
      Alessandro Lazaric, Mykel Kochenderfer<localize|, and >Emma Brunskill.
      <newblock>Learning Near Optimal Policies with Low Inherent Bellman
      Error. <newblock><localize|In ><with|font-shape|italic|Proceedings of
      the 37th International Conference on Machine Learning>, <localize|pages
      >10978-10989. PMLR, nov 2020.<newblock>

      <bibitem*|63><label|bib-zhang_multi-agent_2021>Kaiqing Zhang, Zhuoran
      Yang<localize|, and >Tamer Ba³ar. <newblock>Multi-Agent Reinforcement
      Learning: A Selective Overview of Theories and Algorithms.
      <newblock>apr 2021.<newblock>

      <bibitem*|64><label|bib-zhang_feel-good_2021>Tong Zhang.
      <newblock>Feel-Good Thompson Sampling for Contextual Bandits and
      Reinforcement Learning. <newblock>oct 2021.<newblock>

      <bibitem*|65><label|bib-zhong_gec_2023>Han Zhong, Wei Xiong, Sirui
      Zheng, Liwei Wang, Zhaoran Wang, Zhuoran Yang<localize|, and >Tong
      Zhang. <newblock>GEC: A Unified Framework for Interactive Decision
      Making in MDP, POMDP, and Beyond. <newblock>jun 2023.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|prog-scripts|python>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|2|3>>
    <associate|bib-agarwal_model-based_2022|<tuple|1|3>>
    <associate|bib-agarwal_non-linear_2022|<tuple|2|3>>
    <associate|bib-agrawal_posterior_2020|<tuple|3|3>>
    <associate|bib-albrecht_autonomous_2018|<tuple|6|3>>
    <associate|bib-albrecht_belief_2016|<tuple|4|3>>
    <associate|bib-albrecht_game-theoretic_2015|<tuple|5|3>>
    <associate|bib-astrom_optimal_1965|<tuple|7|3>>
    <associate|bib-auer_near-optimal_2008|<tuple|8|3>>
    <associate|bib-azar_minimax_2017|<tuple|9|3>>
    <associate|bib-azizzadenesheli_reinforcement_2016|<tuple|10|3>>
    <associate|bib-barrett_making_2017|<tuple|11|3>>
    <associate|bib-baumeister_survey_2022|<tuple|41|4>>
    <associate|bib-ben-davidAgnosticOnlineLearning2009|<tuple|12|3>>
    <associate|bib-bertuccelli_robust_2012|<tuple|13|3>>
    <associate|bib-brunskill_sample_2013|<tuple|14|3>>
    <associate|bib-buchholz_computation_2019|<tuple|15|3>>
    <associate|bib-carroll_utility_2019|<tuple|16|3>>
    <associate|bib-chades_momdps_2012|<tuple|17|3>>
    <associate|bib-charakorn_learning_2021|<tuple|18|3>>
    <associate|bib-dong_q-learning_2019|<tuple|19|3>>
    <associate|bib-doshi-velez_hidden_2013|<tuple|20|3>>
    <associate|bib-du_bilinear_2021|<tuple|21|3>>
    <associate|bib-duff_optimal_2002|<tuple|22|3>>
    <associate|bib-fern_decision-theoretic_2014|<tuple|23|3>>
    <associate|bib-foerster_counterfactual_2017|<tuple|24|3>>
    <associate|bib-gmytrasiewicz_framework_2005|<tuple|25|3>>
    <associate|bib-guez_efficient_2012|<tuple|26|3>>
    <associate|bib-guo_pac_2016|<tuple|27|4>>
    <associate|bib-hallak_contextual_2015|<tuple|28|4>>
    <associate|bib-han_learning_2018|<tuple|29|4>>
    <associate|bib-he_opponent_2016|<tuple|30|4>>
    <associate|bib-jiang_contextual_2016|<tuple|31|4>>
    <associate|bib-jin_bellman_2021|<tuple|34|4>>
    <associate|bib-jin_is_2018|<tuple|32|4>>
    <associate|bib-jin_provably_2020|<tuple|35|4>>
    <associate|bib-jin_sample-efficient_2020|<tuple|33|4>>
    <associate|bib-kwon_rl_2021|<tuple|36|4>>
    <associate|bib-lai_asymptotically_1985|<tuple|37|4>>
    <associate|bib-liu_one_2023|<tuple|39|4>>
    <associate|bib-liu_pac_2016|<tuple|38|4>>
    <associate|bib-lockhart_human-agent_2020|<tuple|40|4>>
    <associate|bib-nikolaidis_human-robot_2017|<tuple|42|4>>
    <associate|bib-ong_planning_2010|<tuple|43|4>>
    <associate|bib-osband_model-based_2014|<tuple|44|4>>
    <associate|bib-pineau_anytime_2006|<tuple|45|4>>
    <associate|bib-rahman_generating_2023|<tuple|46|4>>
    <associate|bib-ribeiro_assisting_2022|<tuple|47|4>>
    <associate|bib-ross_agnostic_2012|<tuple|48|4>>
    <associate|bib-russo_learning_2014|<tuple|49|4>>
    <associate|bib-smallwood_optimal_1973|<tuple|50|4>>
    <associate|bib-steimle_multi-model_2021|<tuple|51|4>>
    <associate|bib-stone_ad_2010|<tuple|52|4>>
    <associate|bib-strehl_analysis_2008|<tuple|53|4>>
    <associate|bib-strouse_collaborating_2022|<tuple|54|4>>
    <associate|bib-taylor_transfer_2009|<tuple|55|4>>
    <associate|bib-thompson_likelihood_1933|<tuple|56|4>>
    <associate|bib-tylkin_learning_2021|<tuple|57|5>>
    <associate|bib-white_bayesian_1969|<tuple|58|5>>
    <associate|bib-xie_learning_2020|<tuple|59|5>>
    <associate|bib-yang_sample-optimal_2019|<tuple|60|5>>
    <associate|bib-yao_smixlambda_2020|<tuple|61|5>>
    <associate|bib-zanette_learning_2020|<tuple|62|5>>
    <associate|bib-zhang_feel-good_2021|<tuple|64|5>>
    <associate|bib-zhang_multi-agent_2021|<tuple|63|5>>
    <associate|bib-zhong_gec_2023|<tuple|65|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      carroll_utility_2019

      zhang_multi-agent_2021

      yao_smixlambda_2020

      foerster_counterfactual_2017

      baumeister_survey_2022

      albrecht_autonomous_2018

      stone_ad_2010

      albrecht_game-theoretic_2015

      albrecht_belief_2016

      barrett_making_2017

      xie_learning_2020

      he_opponent_2016

      kwon_rl_2021

      hallak_contextual_2015

      brunskill_sample_2013

      liu_pac_2016

      taylor_transfer_2009

      brunskill_sample_2013

      liu_one_2023

      liu_one_2023

      carroll_utility_2019

      strouse_collaborating_2022

      rahman_generating_2023

      strouse_collaborating_2022

      jin_is_2018

      dong_q-learning_2019

      lai_asymptotically_1985

      zhong_gec_2023

      auer_near-optimal_2008

      nikolaidis_human-robot_2017

      tylkin_learning_2021

      lockhart_human-agent_2020

      carroll_utility_2019

      strouse_collaborating_2022

      rahman_generating_2023

      strouse_collaborating_2022

      baumeister_survey_2022

      albrecht_autonomous_2018

      stone_ad_2010

      barrett_making_2017

      he_opponent_2016

      albrecht_game-theoretic_2015

      albrecht_belief_2016

      xie_learning_2020

      astrom_optimal_1965

      smallwood_optimal_1973

      kwon_rl_2021

      hallak_contextual_2015

      steimle_multi-model_2021

      liu_pac_2016

      taylor_transfer_2009

      brunskill_sample_2013

      ong_planning_2010

      chades_momdps_2012

      doshi-velez_hidden_2013

      fern_decision-theoretic_2014

      buchholz_computation_2019

      han_learning_2018

      gmytrasiewicz_framework_2005

      white_bayesian_1969

      duff_optimal_2002

      guez_efficient_2012

      liu_one_2023

      thompson_likelihood_1933

      russo_learning_2014

      zhong_gec_2023

      agarwal_model-based_2022

      zhang_feel-good_2021

      agarwal_non-linear_2022

      agrawal_posterior_2020

      jiang_contextual_2016

      bertuccelli_robust_2012

      strehl_analysis_2008

      azar_minimax_2017

      zhong_gec_2023

      osband_model-based_2014

      jin_bellman_2021

      jiang_contextual_2016

      zanette_learning_2020

      du_bilinear_2021

      yang_sample-optimal_2019

      jin_provably_2020

      jin_bellman_2021

      ben-davidAgnosticOnlineLearning2009

      ross_agnostic_2012
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Related
      Work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>