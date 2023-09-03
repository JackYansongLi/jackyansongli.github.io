<TeXmacs|2.1.1>

<style|generic>

<\body>
  <doc-data|<doc-title|Reference>>

  <section|Type-Based AHT>

  <\enumerate>
    <item>Review: <cite|baumeister_survey_2022> 2018/2010 more reviews

    <item>Opponent Modelling: <cite|albrecht_game-theoretic_2015><cite|albrecht_belief_2016><cite|barrett_making_2017>

    <item>Overcooked-AI: <cite|carroll_utility_2019><cite|he_opponent_2016>
    <with|font-series|bold|are they type-based?>
  </enumerate>

  <section|POMDP>

  <\enumerate>
    <item>LMDP: <cite|kwon_rl_2021><cite|hallak_contextual_2015><cite|brunskill_sample_2013>

    <item>IPOMDP:<cite|han_learning_2018><cite|gmytrasiewicz_framework_2005>

    <item>add more pomdp papers

    <item>BAMDP:\ 
  </enumerate>

  <section|MEX and Optimistic Posterior Sampling>

  <\enumerate>
    <item>OLIVE: <cite|jiang_contextual_2016>

    <item>PS: <cite|zhong_gec_2023><cite|agarwal_model-based_2022> feel good
    tompson sampling

    <item>MEX: <cite|liu_one_2023>
  </enumerate>

  <section|Other Algorithms>

  <\enumerate>
    <item><math|Q> learning with UCB: <cite|jin_is_2018><cite|dong_q-learning_2019>

    <item>UCB: 1985 original paper.
  </enumerate>

  <section|>

  <cite|xie_learning_2020>

  <\bibliography|bib|tm-plain|../../../JackYansongLi.github.io/notes/human_ai_collaboration_project/reference>
    <\bib-list|18>
      <bibitem*|1><label|bib-agarwal_model-based_2022>Alekh Agarwal<localize|
      and >Tong Zhang. <newblock>Model-based RL with Optimistic Posterior
      Sampling: Structural Conditions and Sample Complexity. <newblock>oct
      2022.<newblock>

      <bibitem*|2><label|bib-albrecht_belief_2016>Stefano<nbsp>V.<nbsp>Albrecht,
      Jacob<nbsp>W.<nbsp>Crandall<localize|, and >Subramanian Ramamoorthy.
      <newblock>Belief and Truth in Hypothesised Behaviours.
      <newblock><with|font-shape|italic|Artificial Intelligence>, 235:63\U94,
      jun 2016.<newblock>

      <bibitem*|3><label|bib-albrecht_game-theoretic_2015>Stefano<nbsp>V.<nbsp>Albrecht<localize|
      and >Subramanian Ramamoorthy. <newblock>A Game-Theoretic Model and
      Best-Response Learning Method for Ad Hoc Coordination in Multiagent
      Systems. <newblock>jun 2015.<newblock>

      <bibitem*|4><label|bib-barrett_making_2017>Samuel Barrett, Avi
      Rosenfeld, Sarit Kraus<localize|, and >Peter Stone. <newblock>Making
      friends on the fly: Cooperating with new teammates.
      <newblock><with|font-shape|italic|Artificial Intelligence>,
      242:132\U171, jan 2017.<newblock>

      <bibitem*|5><label|bib-brunskill_sample_2013>Emma Brunskill<localize|
      and >Lihong Li. <newblock>Sample Complexity of Multi-task Reinforcement
      Learning. <newblock>sep 2013.<newblock>

      <bibitem*|6><label|bib-carroll_utility_2019>Micah Carroll, Rohin Shah,
      Mark<nbsp>K.<nbsp>Ho, Thomas<nbsp>L.<nbsp>Griffiths,
      Sanjit<nbsp>A.<nbsp>Seshia, Pieter Abbeel<localize|, and >Anca Dragan.
      <newblock>On the Utility of Learning about Humans for Human-AI
      Coordination. <newblock>Oct 2019.<newblock>

      <bibitem*|7><label|bib-dong_q-learning_2019>Kefan Dong, Yuanhao Wang,
      Xiaoyu Chen<localize|, and >Liwei Wang. <newblock>Q-learning with UCB
      Exploration is Sample Efficient for Infinite-Horizon MDP. <newblock>sep
      2019.<newblock>

      <bibitem*|8><label|bib-gmytrasiewicz_framework_2005>P.<nbsp>J.<nbsp>Gmytrasiewicz<localize|
      and >P.<nbsp>Doshi. <newblock>A Framework for Sequential Planning in
      Multi-Agent Settings. <newblock><with|font-shape|italic|Journal of
      Artificial Intelligence Research>, 24:49\U79, jul 2005.<newblock>

      <bibitem*|9><label|bib-hallak_contextual_2015>Assaf Hallak, Dotan Di
      Castro<localize|, and >Shie Mannor. <newblock>Contextual Markov
      Decision Processes. <newblock>feb 2015.<newblock>

      <bibitem*|10><label|bib-han_learning_2018>Yanlin Han<localize| and
      >Piotr Gmytrasiewicz. <newblock>Learning Others' Intentional Models in
      Multi-Agent Settings Using Interactive POMDPs. <newblock><localize|In
      ><with|font-shape|italic|Advances in Neural Information Processing
      Systems>, <localize|volume><nbsp>31. Curran Associates, Inc.,
      2018.<newblock>

      <bibitem*|11><label|bib-he_opponent_2016>He He, Jordan Boyd-Graber,
      Kevin Kwok<localize|, and >Hal Daumé III. <newblock>Opponent Modeling
      in Deep Reinforcement Learning. <newblock>sep 2016.<newblock>

      <bibitem*|12><label|bib-jiang_contextual_2016>Nan Jiang, Akshay
      Krishnamurthy, Alekh Agarwal, John Langford<localize|, and
      >Robert<nbsp>E.<nbsp>Schapire. <newblock>Contextual Decision Processes
      with Low Bellman Rank are PAC-Learnable. <newblock>dec 2016.<newblock>

      <bibitem*|13><label|bib-jin_is_2018>Chi Jin, Zeyuan Allen-Zhu,
      Sebastien Bubeck<localize|, and >Michael<nbsp>I.<nbsp>Jordan.
      <newblock>Is Q-learning Provably Efficient? <newblock>jul
      2018.<newblock>

      <bibitem*|14><label|bib-kwon_rl_2021>Jeongyeol Kwon, Yonathan Efroni,
      Constantine Caramanis<localize|, and >Shie Mannor. <newblock>RL for
      Latent MDPs: Regret Guarantees and a Lower Bound. <newblock>feb
      2021.<newblock>

      <bibitem*|15><label|bib-liu_one_2023>Zhihan Liu, Miao Lu, Wei Xiong,
      Han Zhong, Hao Hu, Shenao Zhang, Sirui Zheng, Zhuoran Yang<localize|,
      and >Zhaoran Wang. <newblock>One Objective to Rule Them All: A
      Maximization Objective Fusing Estimation and Planning for Exploration.
      <newblock>may 2023.<newblock>

      <bibitem*|16><label|bib-baumeister_survey_2022>Reuth Mirsky, Ignacio
      Carlucho, Arrasy Rahman, Elliot Fosong, William Macke, Mohan Sridharan,
      Peter Stone<localize|, and >Stefano<nbsp>V.<nbsp>Albrecht. <newblock>A
      Survey of Ad Hoc Teamwork Research. <newblock><localize|In >Dorothea
      Baumeister<localize| and >Jörg Rothe<localize|, editors>,
      <with|font-shape|italic|Multi-Agent Systems>, <localize|volume> 13442,
      <localize|pages >275\U293. Springer International Publishing, Cham,
      2022.<newblock>

      <bibitem*|17><label|bib-xie_learning_2020>Annie Xie,
      Dylan<nbsp>P.<nbsp>Losey, Ryan Tolsma, Chelsea Finn<localize|, and
      >Dorsa Sadigh. <newblock>Learning Latent Representations to Influence
      Multi-Agent Interaction. <newblock>nov 2020.<newblock>

      <bibitem*|18><label|bib-zhong_gec_2023>Han Zhong, Wei Xiong, Sirui
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
    <associate|auto-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-2|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-3|<tuple|3|1|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-4|<tuple|4|1|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-5|<tuple|5|1|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-6|<tuple|5|1|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-agarwal_model-based_2022|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-albrecht_belief_2016|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-albrecht_game-theoretic_2015|<tuple|3|1|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-barrett_making_2017|<tuple|4|1|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-baumeister_survey_2022|<tuple|16|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-brunskill_sample_2013|<tuple|5|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-carroll_utility_2019|<tuple|6|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-dong_q-learning_2019|<tuple|7|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-gmytrasiewicz_framework_2005|<tuple|8|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-hallak_contextual_2015|<tuple|9|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-han_learning_2018|<tuple|10|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-he_opponent_2016|<tuple|11|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-jiang_contextual_2016|<tuple|12|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-jin_is_2018|<tuple|13|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-kwon_rl_2021|<tuple|14|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-liu_one_2023|<tuple|15|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-xie_learning_2020|<tuple|17|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-zhong_gec_2023|<tuple|18|2|../../../.TeXmacs/texts/scratch/no_name_18.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      baumeister_survey_2022

      he_opponent_2016

      albrecht_game-theoretic_2015

      albrecht_belief_2016

      barrett_making_2017

      carroll_utility_2019

      kwon_rl_2021

      hallak_contextual_2015

      brunskill_sample_2013

      han_learning_2018

      gmytrasiewicz_framework_2005

      jiang_contextual_2016

      zhong_gec_2023

      agarwal_model-based_2022

      liu_one_2023

      jin_bellman_2021

      jin_is_2018

      dong_q-learning_2019

      xie_learning_2020
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Type-Based
      AHT> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>POMDP>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>MEX
      and Optimistic Posterior Sampling> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Other
      Algorithms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>