<TeXmacs|2.1.2>

<style|generic>

<\body>
  <\hide-preamble>
    <assign|alg|<macro|<with|font-family|tt|Alg>>>

    <assign|rob|<macro|<math|\<mu\><rsub|rob>>>>

    <assign|wor|<macro|<math|\<lambda\><rsub|wor>>>>

    <\new-remark|def>
      Definition
    </new-remark>

    <\new-remark|ass>
      Assumption
    </new-remark>

    <\new-remark|infodef>
      Informal Definition
    </new-remark>

    <\new-theorem|hyp>
      Hypothesis
    </new-theorem>

    <\new-exercise|open>
      Goal
    </new-exercise>

    <\new-theorem|fact>
      Fact
    </new-theorem>
  </hide-preamble>

  <doc-data|<doc-title|Impact of Prior Beliefs on Type-Based Ad Hoc
  Teamwork>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|Introduction>

  Ad hoc teamwork <cite|baumeister_survey_2022> is the problem of developing
  an AI agent capable of collaborating with previously unseen partners. A
  subtask of ad hoc teamwork called type-based ad hoc teamwork deals with the
  case that all partners are classified by types. The AI agent is given a
  hypothesis set that contains distinct types of potential partner's polices
  before collaboration.\ 

  There are many works <cite|sarkar_diverse_2023><cite|canaan_generating_2023><cite|rahman_generating_2023><cite|rahman_minimum_2023><cite|lauffer_who_2023>
  on generating a diverse hypothesis set. The generated hypothesis set
  contains distinct types of partner policies. These works then train a
  robust policy on the generated hypothesis set for the AI agent and assume
  that the AI agent can efficiently collaborate with previously unseen
  partners based on the trained robust policy. The robust policy is trained
  by maximizing a objective function that is the expected cumulative reward
  expected on a prior belief over the hypothesis set. When partners adopt a
  fixed policy, the objective function can be considered as an objective
  function for solving a latent Markov decision process <cite|kwon_rl_2021>.

  A common choice of a prior belief is the uniform distribution
  <cite|rahman_generating_2023><cite|rahman_minimum_2023>. Besides the
  uniform distribution, Albrecht et al. <cite|albrecht_belief_2016><cite|albrecht_empirical_2019>
  compared several hand-coded prior with the uniform prior
  (<with|color|red|and the results indicates xxx>).\ 

  In this paper, we show that for any robust policy trained based on a given
  prior, if nature chooses a bad prior, the policy is no longer robust even
  if the partner's policy is fixed and taken from the given hypothesis set.
  After this, we give a definition called robust AHT policy that is a robust
  policy even if nature chooses a bad prior. However, the existing works of
  computing a robust AHT policy is very expensive consider the sample
  complexity.

  To the best of our knowledge, our paper is the first that gives a formal
  way to explore the impact of prior beliefs on ad hoc teamwork.\ 

  <with|font-series|bold|Related works (Not complete):>

  <\enumerate>
    <item><strong|AHT>: The only work on AHT that explores the impact of
    prior distribution is <cite|albrecht_belief_2016>, the paper
    <cite|albrecht_empirical_2019> I mentioned last week is a short version
    of <cite|albrecht_belief_2016>. However, the author compares several
    different prior distributions by comparing the average payoff averaged
    over different games, which is not a fair comparison.

    <item><strong|Bayesian RL>: Several experiments taken by Buening et. al.
    <cite|buening_minimax-bayes_2023> conclude that the Bayes-optimal regret
    is more robust under the minimax prior than the uniform prior.

    <item><strong|POMDP>: The only paper I found exploring prior
    distribution's impact on POMDP is <cite|castellini_explaining_2020><rigid|>.
    The algorithm they explored is POMCP. This paper is fully experimental.
    The result shows that prior knowledge affects the distance between the
    belief and the real state, and the mutual information between segment
    difficulty and action taken in the segment.

    <item><strong|Game>: As discussed in Section 2 in
    <cite|albrecht_belief_2016>, all existing works on game theory that
    explore the impact on prior belief focus on equilibrium points. For
    example, in <cite|nyarko_bayesian_1998>, the author shows that the
    resulting subjective equilibrium may not be a Nash equilibrium if the
    players have different prior beliefs. However, this differs from our
    interest in the impact of prior beliefs on payoff maximization.
  </enumerate>

  <section|Problem formulation>

  We consider a two player team Markov game defined as
  <math|<around*|(|S,A\<times\>A,\<bbb-P\>,r,\<gamma\>,H|)>>, where <math|S>
  is the state space and <math|A> is the action space for both players. The
  transition kernel <math|\<bbb-P\>> is defined as\ 

  <\equation*>
    \<bbb-P\>:S\<times\>A\<times\>A\<rightarrow\>\<Delta\><around*|(|S|)>,
  </equation*>

  and the reward function is defined as\ 

  <\equation*>
    r:S\<times\>A\<times\>A\<rightarrow\>\<Delta\><around*|(|<around*|[|0,1|]>|)>,
  </equation*>

  Throughout this monograph, player 1 is the AI agent, and player 2 is the
  partner. The game is finite horizon with horizon length be <math|H> and
  discounted with discount factor <math|H>. We assume that the partner takes
  a nonadaptive<\footnote>
    Page 13 in <cite|baumeister_survey_2022>: \P<em|Current approaches to AHT
    are not designed to work with adaptive teammates (one notable exception
    being HBA <cite|albrecht_belief_2016>), whose presence would mean that
    the learner needs not only to adapt to teammates' behaviors, but also
    consider how the teammates adapt to its own behavior.>\Q
  </footnote> policy <math|\<pi\>>, i.e.,

  <\equation*>
    \<pi\>:S\<times\><around*|[|H|]>\<rightarrow\>\<Delta\><around*|(|A|)>.
  </equation*>

  However, the AI agent takes a history-dependent policy defined as
  <math|\<mu\>:\<bbb-H\>\<rightarrow\>\<Delta\><around*|(|A|)>>, where
  <math|\<bbb-H\>> is the set of all histories. A history
  <math|\<tau\><rsub|h>> at time <math|h> is defined as\ 

  <\equation*>
    \<tau\><rsub|h>=<around*|{|s<rsub|1>,a<rsub|1>,b<rsub|1>,\<ldots\>,s<rsub|h>|}>,
  </equation*>

  where <math|s<rsub|h>> is the state at time <math|h>, <math|a<rsub|h>> is
  the AI agent's action at time <math|h>, and <math|b<rsub|h>> is the
  partner's action at time <math|h>. The set of all AI agent's policy is
  denoted as <math|\<cal-U\>> and the set of all partner's policy is denoted
  as <math|\<Pi\>>.

  <subsection|Hypothesis set and the true prior distribution>

  Recall that ad hoc teamwork is the problem of developing an AI agent that
  can collaborate with different partners. In this monograph, we consider a
  simple case where the possible partners the AI agent might belongs to a
  given set. Formally, we make the following assumption:

  <\ass>
    The partner's policy is drawn from a finite hypothesis set
    <math|\<cal-H\>=<around*|{|\<pi\><rsub|1>,\<pi\><rsub|2>,\<ldots\>,\<pi\><rsub|M>|}>>
    with <math|<around*|\||\<cal-H\>|\|>=M> based on a distribution
    <math|\<lambda\><rsup|\<ast\>>\<in\>\<Delta\><rsub|M>>. We call
    <math|\<cal-H\>> the <em|set of all potential partners> and
    <math|\<lambda\><rsup|\<ast\>>> the <em|true prior distribution>.
  </ass>

  The possibility of the AI agent to collaborate a specific partner is
  related to the nature. For example, consider an AI agent moving tables with
  a partner in a sports school. Then, it is more possible that the AI agent
  will collaborate with a strong partner than a weak one. Thus, the true
  prior distribution <math|\<lambda\><rsup|\<ast\>>> reflects nature's
  preference for the potential partners.

  Throughout this monograph, we assume that:

  <\enumerate>
    <item>The set of all potential partners <math|\<cal-H\>> is known to the
    AI agent.

    <item>The true prior belief <math|\<lambda\><rsup|\<ast\>>> is unknown to
    the AI agent.
  </enumerate>

  <subsection|Measure the impact of prior>

  Before we take a further step in defining the impact of prior beliefs, let
  us introduce the following definitions:

  <\def>
    (<em|<rigid|Regret>>) The regret of policy <math|\<mu\>> is defined as

    <\equation*>
      Reg<around*|(|\<mu\>,\<pi\><rsup|\<ast\>>|)>\<triangleq\>max<rsub|\<mu\><rprime|'>>
      V<around*|(|\<mu\><rprime|'>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<mu\>,\<pi\><rsup|\<ast\>>|)>,
    </equation*>

    where <math|\<pi\><rsup|\<ast\>>> is the partner's true policy, and
    <math|V> is the expected cumulative value function.
  </def>

  Since the true partner policy <math|\<pi\><rsup|\<ast\>>> is unknown to the
  AI agent, the maximization problem <math|max<rsub|\<mu\>>
  Reg<around*|(|\<mu\>,\<pi\><rsup|\<ast\>>|)>> is ill-posed. Thus, the
  following regret is defined for a given prior distribution
  <math|\<lambda\>\<in\>\<Delta\><rsub|M>>,

  <\def>
    (<em|Bayes-optimal regret> <cite|buening_minimax-bayes_2023>) The
    Bayes-optimal Regret of policy <math|\<mu\>> under a prior
    <math|\<lambda\>> is defined as\ 

    <\equation*>
      Reg<around*|(|\<mu\>,\<lambda\>|)>\<triangleq\><big|sum><rsub|m\<in\><around*|[|M|]>>\<lambda\><rsub|m><around*|[|V<around*|(|\<mu\><rsub|\<lambda\>><rsup|\<ast\>>,\<pi\><rsub|m>|)>-V<around*|(|\<mu\>,\<pi\><rsub|m>|)>|]>=\<bbb-E\><rsub|m\<sim\>\<lambda\>><around*|[|V<around*|(|\<mu\><rsub|\<lambda\>><rsup|\<ast\>>,\<pi\><rsub|m>|)>-V<around*|(|\<mu\>,\<pi\><rsub|m>|)>|]>,
    </equation*>

    where <math|\<mu\><rsub|\<lambda\>><rsup|\<ast\>>=argmax<rsub|\<mu\>>\<bbb-E\><rsub|m\<sim\>\<lambda\>>V<around*|(|\<mu\>,\<pi\><rsub|m>|)>>
    is the Bayes-optimal policy.
  </def>

  <\remark>
    The Bayes-optimal policy is the solution of LMDP with the objective to be

    <\equation*>
      <below|maximize|\<mu\>> \<bbb-E\><rsub|m\<sim\>\<lambda\>>V<around*|(|\<mu\>,\<pi\><rsub|m>|)>.
    </equation*>

    If <math|\<lambda\>=\<lambda\><rsup|\<ast\>>>, the ad hoc teamwork
    reduces to solving a latent variable MDP with the objective function to
    be the above function.
  </remark>

  The Bayes-optimal regret is the regret of using policy <math|\<mu\>>
  compared to the Bayes-optimal policy under prior <math|\<lambda\>>. In the
  following, we introduce the Bayesian regret that compared the policy
  <math|\<mu\>> to the best response policy.

  <\def>
    (<em|Bayesian regret> <cite|buening_minimax-bayes_2023>) The Bayesian
    regret of policy <math|\<mu\>> under a prior <math|\<lambda\>> is defined
    as

    <\equation*>
      L<around*|(|\<mu\>,\<lambda\>|)>\<triangleq\><big|sum><rsub|m\<in\><around*|[|M|]>>\<lambda\><rsub|m><around*|[|V<around*|(|\<mu\><rsub|m>,\<pi\><rsub|m>|)>-V<around*|(|\<mu\>,\<pi\><rsub|m>|)>|]>=\<bbb-E\><rsub|m\<sim\>\<lambda\>><around*|[|Reg<around*|(|\<mu\>,\<pi\><rsub|m>|)>|]>,
    </equation*>

    where <math|\<mu\><rsub|m>\<in\>argmax<rsub|\<mu\>>V<around*|(|\<mu\>,\<pi\><rsub|m>|)>>
    is an best response policy for partner <math|\<pi\><rsub|m>>.
  </def>

  The Bayesian regret can be considered as the expected regret when the true
  prior is <math|\<lambda\>>. Thus, it serves as a measure of the impact of
  <math|\<lambda\>> for a fixed policy <math|\<mu\>>. For a given policy
  <math|\<mu\>>, a prior that leads to a smaller
  <math|L<around*|(|\<mu\>,\<lambda\>|)>> is considered a better prior. So, a
  <em|worst-case prior> (nature) is taken from <math|argmax<rsub|\<lambda\>>
  L<around*|(|\<mu\>,\<lambda\>|)>>.

  <\def>
    (<em|Worst-case prior>) A worst-case prior <math|\<lambda\><rsub|\<mu\>>>
    under a given policy <math|\<mu\>> is defined as a best response of
    <math|\<mu\>>, i.e.,

    <\equation*>
      \<lambda\><rsub|\<mu\>>\<in\><below|argmax|\<lambda\>\<in\>\<Delta\><rsub|M>>
      L<around*|(|\<mu\>,\<lambda\>|)>.
    </equation*>
  </def>

  In the next subsection, we will discuss the situation that the AI agent
  takes an optimal policy based on his guessed prior while nature chooses a
  worst case prior under the policy taken by the AI agent.

  <section|The choice of prior matters in AHT>

  Consider the following optimization problem:

  <\equation>
    <below|max.|\<mu\>\<in\>\<cal-U\> > \<bbb-E\><rsub|m\<sim\>\<lambda\>>V<around*|(|\<mu\>,\<pi\><rsub|m>|)>,<label|eq:lmdp>
  </equation>

  where <math|\<bbb-E\><rsub|m\<sim\>\<lambda\>>V<around*|(|\<mu\>,\<pi\><rsub|m>|)>>
  is the objective function for a latent MDP (LMDP) <cite|kwon_rl_2021>. The
  prior distribution <math|\<lambda\>> represents the guessed prior by the AI
  agent. A solution of <eqref|eq:lmdp> <math|\<mu\><rsub|\<lambda\>>> is
  called a <em|Bayes-optimal policy> of <math|\<lambda\>>. The set of all
  solutions of <eqref|eq:lmdp> (the set of all Bayes-optimal policy for
  <math|\<lambda\>>) is denoted as <math|\<cal-U\><rsub|\<lambda\>>>.\ 

  Previous works <cite|rahman_minimum_2023> in AHT assume that the prior
  distribution <math|\<lambda\>> is uniform. Consider that the AI agent has a
  guessed prior <math|\<lambda\>> and he takes a Bayes-optimal policy
  <math|\<mu\><rsub|\<lambda\>>> based under <math|\<lambda\>>. If nature
  chooses a worst-case prior <math|\<lambda\><rsup|\<ast\>>=\<lambda\><rsub|\<mu\><rsub|\<lambda\>>>>
  under the AI agent's policy <math|\<mu\><rsub|\<lambda\>>>, will the policy
  <math|\<mu\><rsub|\<lambda\>>> robust to
  <math|\<lambda\><rsub|\<mu\><rsub|\<lambda\>>>>? Before answering this
  question, let us introduce the following definition to measure the maximum
  impact of adopting a Bayes-optimal policy for LMDP based on a chosen prior.

  <\def>
    (<em|><em|Maximum guessed prior error>) For a given prior
    <math|\<lambda\>>, the <em|maximum guessed prior error> is defined as

    <\equation*>
      \<cal-R\><rsub|wor><around*|(|\<lambda\>|)>\<triangleq\>min<rsub|\<mu\>\<in\>\<cal-U\><rsub|\<lambda\>>>max<rsub|\<lambda\><rprime|'>\<in\>\<Delta\><rsub|M>>
      L<around*|(|\<mu\>,\<lambda\><rprime|'>|)>-L<rsub|wor>,
    </equation*>

    where the term <math|L<rsub|wor>> is the minimum Bayesian regret in the
    worst-case, i.e.,

    <\equation*>
      L<rsub|wor>\<triangleq\>min<rsub|\<mu\>\<in\>\<cal-U\>>
      max<rsub|\<lambda\><rprime|'>\<in\>\<Delta\><rsub|M>>
      \ L<around*|(|\<mu\>,\<lambda\><rprime|'>|)>.
    </equation*>
  </def>

  The maximum guessed prior error can be considered an error for taking
  policies under a guessed prior <math|\<lambda\>>, while nature chooses a
  worst-case prior under the policy <math|\<mu\><rsub|\<lambda\>>> taken by
  the AI agent, i.e., <math|\<lambda\><rsup|\<ast\>>=\<lambda\><rsub|\<mu\><rsub|\<lambda\>>>>.

  <subsection|Bayes-optimal policies are not robust>

  <\hyp>
    <label|hyp:normal>Consider a two-player normal-form game with action
    space to be <math|A\<times\><around*|[|M|]>>. For any
    <math|\<lambda\>\<in\>\<Delta\><rsub|M>>, there exist a utility function
    <math|u:A\<times\><around*|[|M|]>\<rightarrow\><around*|[|0,1|]>> such
    that

    <\equation*>
      \<cal-R\><rsub|wor><around*|(|\<lambda\>|)>\<geq\><frac|1|2>.
    </equation*>
  </hyp>

  The above hypothesis states that for any given prior, there exists a
  normal-form game such that if nature chooses a worst-case prior under the a
  policy from <math|\<cal-U\><rsub|\<lambda\>>>, an optimal policy
  <math|\<mu\>\<in\>\<cal-U\><rsub|\<lambda\>>> for that given prior can not
  perform better than a uniform policy. This result implies that we must take
  extra caution in choosing the prior when using the LMDP solver in an AHT
  problem.

  <subsection|Proof of Hypothesis <reference|hyp:normal> (Not complete)>

  Consider a normal-form game defined as follows:

  <\equation*>
    r<around*|(|1,1|)>=r<rsub|1>,<space|1em>r<around*|(|1,2|)>=f<rsub|2>,<space|1em>r<around*|(|2,1|)>=f<rsub|1>,<space|1em>r<around*|(|2,2|)>=r<rsub|2>,
  </equation*>

  where <math|r<rsub|1>\<geq\>f<rsub|1>> and
  <math|r<rsub|2>\<geq\>f<rsub|2>>. Express the mixed strategy adopted by the
  AI agent as <math|\<mu\>\<triangleq\><around*|[|\<mu\><rsub|1>,\<mu\><rsub|2>|]><rsup|\<top\>>>.
  Then,

  <\equation*>
    Reg<around*|(|\<mu\>,1|)>=\<mu\><rsub|2><around*|(|r<rsub|2>-f<rsub|2>|)>,<space|1em>and<space|1em>Reg<around*|(|\<mu\>,2|)>=\<mu\><rsub|1><around*|(|r<rsub|1>-f<rsub|1>|)>.
  </equation*>

  Consider a prior <math|\<lambda\>> expressed as
  <math|\<lambda\>\<triangleq\><around*|[|\<lambda\><rsub|1>,\<lambda\><rsub|2>|]><rsup|\<top\>>>.
  Denote <math|r<rsub|1>-f<rsub|1>> as <math|d<rsub|1>> and
  <math|r<rsub|2>-f<rsub|2>> as <math|d<rsub|2>>, we have

  <\equation*>
    L<around*|(|\<mu\>,\<lambda\>|)>=\<lambda\><rsub|1>\<mu\><rsub|2>d<rsub|2>+\<lambda\><rsub|2>\<mu\><rsub|1>d<rsub|1>.
  </equation*>

  Also,

  <\equation*>
    <below|argmin|\<mu\>\<in\>\<cal-U\>> L<around*|(|\<mu\>,\<lambda\>|)>=<choice|<tformat|<table|<row|<cell|<around*|[|0,1|]><rsup|\<top\>>>|<cell|if
    \<lambda\><rsub|1>d<rsub|2>\<leq\>\<lambda\><rsub|2>d<rsub|1>>>|<row|<cell|<around*|[|1,0|]><rsup|\<top\>>>|<cell|if
    \<lambda\><rsub|1>d<rsub|2>\<geq\>\<lambda\><rsub|2>d<rsub|1>>>>>>.
  </equation*>

  The above equality implies that for any given guessed prior
  <math|\<lambda\>>, the set <math|\<cal-U\><rsub|\<lambda\>>\<subset\>\<partial\>\<Delta\><rsub|2>>.
  W.L.L.G., let <math|d<rsub|1>\<geq\>d<rsub|2>>,

  <section|Robust AHT policy>

  In the previous section, we show that a Bayes-optimal policy for a given
  guessed prior is not robust in general, i.e., it performs bad if nature
  chooses a worst-case prior under the policy adopted by the AI agent. To
  tackle this problem, we introduce the following definition:

  <\def>
    (<em|<em|>Robust AHT policy>) A <em|robust AHT policy> <rob> is a
    solution of the following minimax optimization problem:

    <\equation>
      min<rsub|\<mu\>\<in\>\<cal-U\>>.max<rsub|\<lambda\>\<in\>\<Delta\><rsub|M>>L<around*|(|\<mu\>,\<lambda\>|)>.<label|eq:primal-belief>
    </equation>
  </def>

  <\remark>
    The optimization problem defined in <eqref|eq:primal-belief> is
    equivalent to

    <\equation*>
      min<rsub|\<mu\>\<in\>\<cal-U\>>.max<rsub|m\<in\><around*|[|M|]>>
      <around*|[|V<rsup|\<ast\>><rsub|m>-V<rsub|m><around*|(|\<mu\>|)>|]>.
    </equation*>
  </remark>

  We also consider a maximin prior defined as:

  <\def>
    (<em|Maximin prior>) A maximin prior <math|\<lambda\><rsub|wor>> is a
    solution of the maximin optimization problem\ 

    <\equation>
      <below|max.|\<lambda\>\<in\>\<Delta\><rsub|M>>min<rsub|\<mu\>\<in\>\<cal-U\>>
      L<around*|(|\<mu\>,\<lambda\>|)>,<label|eq:dual>
    </equation>

    which is the dual problem of <eqref|eq:primal-belief>. Thus,

    <\equation*>
      \<lambda\><rsub|wor>\<in\><below|argmax|\<lambda\>\<in\>\<Delta\><rsub|M>>
      min<rsub|\<mu\>\<in\>\<cal-U\>> L<around*|(|\<mu\>,\<lambda\>|)>.
    </equation*>
  </def>

  Intuitively, a robust AHT policy <math|\<mu\><rsub|rob>> should be an
  optimal policy for a maximin prior, i.e.,
  <math|L<around*|(|\<mu\><rsub|rob>,<wor>|)>\<leq\>L<around*|(|\<mu\>,<wor>|)>>
  for all <math|\<mu\>\<in\>\<cal-U\>>. Also, for any prior other than a
  maximin prior, the robust AHT policy should perform better under that prior
  i.e., <math|L<around*|(|\<mu\><rsub|rob>,<wor>|)>\<geq\>L<around*|(|\<mu\><rsub|rob>,\<lambda\>|)>>
  for all <math|\<lambda\>\<in\>\<Delta\><rsub|M>>. Thus, we require
  <math|<around*|(|\<mu\><rsub|rob>,<wor>|)>> to be a saddle point of
  <math|L<around*|(|\<mu\>,\<lambda\>|)>>. By Lemma 4 in
  <cite|buening_minimax-bayes_2023>, for a finite horizon MDP with finite
  state and finite action spaces, the following equality holds:

  <\equation>
    <below|max|\<lambda\>\<in\>\<Delta\><rsub|M>>min<rsub|\<mu\>\<in\>\<cal-U\>>
    L<around*|(|\<mu\>,\<lambda\>|)>=min<rsub|\<mu\>\<in\>\<cal-U\>>
    max<rsub|\<lambda\>\<in\>\<Delta\><rsub|M>>L<around*|(|\<mu\>,\<lambda\>|)>=<below|max|\<lambda\>\<in\>\<Delta\><rsub|M>>
    L<around*|(|\<mu\><rsub|\<lambda\>>,\<lambda\>|)>,<label|eq:strong-duality>
  </equation>

  where <math|\<mu\><rsub|\<lambda\>>\<in\>argmax<rsub|\<mu\>>
  \<bbb-E\><rsub|m\<sim\>\<lambda\>>V<around*|(|\<mu\>,\<pi\><rsub|m>|)>> is
  a Bayes-optimal policy. So the existence of a robust AHT policy pair is
  guaranteed. Recall the definition of a saddle point:

  <\def>
    A saddle point <math|<around*|(|\<mu\><rsub|rob>,<wor>|)>> of
    <math|L<around*|(|\<mu\>,\<lambda\>|)>> is defined as

    <\equation*>
      L<around*|(|\<mu\><rsub|rob>,\<lambda\>|)>\<leq\>L<around*|(|\<mu\><rsub|rob>,<wor>|)>\<leq\>L<around*|(|\<mu\>,<wor>|)>,<space|1em>\<forall\>\<mu\>\<in\>\<cal-U\>,\<forall\>\<lambda\>\<in\>\<Delta\><rsub|M>,
    </equation*>

    where <math|<wor>> is a maximin prior and <math|\<mu\><rsub|rob>> is a
    robust AHT policy.
  </def>

  Algorithm 2 in <cite|buening_minimax-bayes_2023> provides a method to
  compute <math|\<lambda\><rsub|wor>>. In the following, we show that when
  the best response of <math|\<lambda\><rsub|wor>> is unique,
  <math|<around*|(|\<mu\><rsub|<wor>>,<wor>|)>> forms a saddle point.

  <\proposition>
    <label|prop:unique-bayes-optimal-policy-for-maxmin-prior>If for a maximin
    prior <math|\<lambda\><rsub|wor>>, the set <math|argmax<rsub|\<mu\>>
    \<bbb-E\><rsub|m\<sim\>\<lambda\><rsub|wor>>V<around*|(|\<mu\>,\<pi\><rsub|m>|)>>
    is a singleton, then <math|<around*|(|\<mu\><rsub|<wor>>,<wor>|)>> is a
    saddle point of <math|L<around*|(|\<mu\>,\<lambda\>|)>>.
  </proposition>

  <\proof>
    Assume that <math|\<mu\><rsub|rob>\<in\>argmin<rsub|\<mu\>\<in\>\<cal-U\>>
    max<rsub|\<lambda\>\<in\>\<Delta\><rsub|M>>
    L<around*|(|\<mu\>,\<lambda\>|)>>. By Proposition 3.4.1 in
    <cite|bertsekas_convex_2009>, <math|<around*|(|\<mu\><rsub|rob>,\<lambda\><rsub|wor>|)>>
    is a saddle point of <math|L<around*|(|\<mu\>,\<lambda\>|)>>. Thus,
    <math|\<mu\><rsub|rob>> is a best response of
    <math|\<lambda\><rsub|wor>>. Since the best response of
    <math|\<lambda\><rsub|wor>> is unique, we have
    <math|\<mu\><rsub|rob>=\<mu\><rsub|\<lambda\><rsub|wor>>>.
  </proof>

  In general, the best response of <math|\<lambda\><rsub|wor>> is not unique.
  So, a Bayes-optimal policy <math|\<mu\><rsub|<wor>>> under prior
  <math|<wor>> is not a robust AHT policy in general. Even if the the best
  response of <math|\<lambda\><rsub|wor>> is unique, the computation of
  <math|\<lambda\><rsub|wor>> is still too expensive since the sample
  complexity depends on the <math|<around*|\||A|\|><rsup|<around*|\||\<bbb-H\>|\|>>>.

  <section|Do Not Read>

  <subsection|Case study>

  Consider a normal-form game defined as follows:

  <\equation*>
    r<around*|(|1,1|)>=r<rsub|1>,<space|1em>r<around*|(|1,2|)>=f<rsub|2>,<space|1em>r<around*|(|2,1|)>=f<rsub|1>,<space|1em>r<around*|(|2,2|)>=r<rsub|2>,
  </equation*>

  where <math|r<rsub|1>\<geq\>f<rsub|1>> and
  <math|r<rsub|2>\<geq\>f<rsub|2>>. Denote
  <math|\<mu\>\<triangleq\><around*|[|\<mu\><rsub|1>,\<mu\><rsub|2>|]><rsup|\<top\>>>
  as the mixed strategy adopted by the AI agent. Then

  <\equation*>
    Reg<around*|(|\<mu\>,1|)>=\<mu\><rsub|2><around*|(|r<rsub|2>-f<rsub|2>|)>,<space|1em>and<space|1em>Reg<around*|(|\<mu\>,2|)>=\<mu\><rsub|1><around*|(|r<rsub|1>-f<rsub|1>|)>.
  </equation*>

  Consider a prior <math|\<lambda\>> expressed as
  <math|\<lambda\>\<triangleq\><around*|[|\<lambda\><rsub|1>,\<lambda\><rsub|2>|]><rsup|\<top\>>>,
  we have

  <\equation*>
    L<around*|(|\<mu\>,\<lambda\>|)>=\<lambda\><rsub|1>\<mu\><rsub|2><around*|(|r<rsub|2>-f<rsub|2>|)>+\<lambda\><rsub|2>\<mu\><rsub|1><around*|(|r<rsub|1>-f<rsub|1>|)>.
  </equation*>

  Thus,

  <\equation*>
    <below|argmin|\<mu\>\<in\>\<cal-U\>> L<around*|(|\<mu\>,\<lambda\>|)>=<choice|<tformat|<table|<row|<cell|<around*|[|0,1|]><rsup|\<top\>>>|<cell|if
    \<lambda\><rsub|1><around*|(|r<rsub|2>-f<rsub|2>|)>\<leq\>\<lambda\><rsub|2><around*|(|r<rsub|1>-f<rsub|1>|)>>>|<row|<cell|<around*|[|1,0|]><rsup|\<top\>>>|<cell|if
    \<lambda\><rsub|1><around*|(|r<rsub|2>-f<rsub|2>|)>\<geq\>\<lambda\><rsub|2><around*|(|r<rsub|1>-f<rsub|1>|)>>>>>>.
  </equation*>

  Also,\ 

  <\equation*>
    <below|argmax|\<lambda\>\<in\>\<Delta\><rsub|2>>
    <below|min|\<mu\>\<in\>\<cal-U\>> L<around*|(|\<mu\>,\<lambda\>|)>=<choice|<tformat|<table|<row|<cell|<below|argmax|\<lambda\>\<in\>\<Delta\><rsub|2>>
    \<lambda\><rsub|2><around*|(|r<rsub|1>-f<rsub|1>|)>>|<cell|if
    \<lambda\><rsub|1><around*|(|r<rsub|2>-f<rsub|2>|)>\<leq\>\<lambda\><rsub|2><around*|(|r<rsub|1>-f<rsub|1>|)>>>|<row|<cell|<below|argmax|\<lambda\>\<in\>\<Delta\><rsub|2>>
    \<lambda\><rsub|1><around*|(|r<rsub|2>-f<rsub|2>|)>>|<cell|if
    \<lambda\><rsub|1><around*|(|r<rsub|2>-f<rsub|2>|)>\<geq\>\<lambda\><rsub|2><around*|(|r<rsub|1>-f<rsub|1>|)>>>>>>.
  </equation*>

  Thus,

  <\equation*>
    <below|max|\<lambda\>\<in\>\<Delta\><rsub|2>>
    <below|min|\<mu\>\<in\>\<cal-U\>> L<around*|(|\<mu\>,\<lambda\>|)>=max<around*|{|r<rsub|1>-f<rsub|1>,r<rsub|2>-f<rsub|2>|}>.
  </equation*>

  Denote <math|P<rsub|n>> as the <math|n\<times\>n> permutation matrix that
  reverses the order of elements. For example,\ 

  <\equation*>
    P<rsub|2>=<matrix|<tformat|<table|<row|<cell|0>|<cell|1>>|<row|<cell|1>|<cell|0>>>>>.
  </equation*>

  Thus,

  <\equation*>
    L<around*|(|\<mu\>,\<lambda\>|)>=<around*|(|P<rsub|2>*\<lambda\>|)><rsup|\<top\>>\<mu\>\<odot\><around*|(|r-f|)>,
  </equation*>

  where <math|r=<around*|[|r<rsub|1>,r<rsub|2>|]><rsup|\<top\>>> and
  <math|f=<around*|[|f<rsub|1>,f<rsub|2>|]><rsup|\<top\>>>. Then, the minimax
  optimization problem is

  <\equation*>
    min<rsub|\<mu\>\<in\>\<mathLaplace\><rsub|2>>
    max<rsub|\<lambda\>\<in\>\<Delta\><rsub|2>>
    <around*|(|P<rsub|2>*\<lambda\>|)><rsup|\<top\>>\<mu\>\<odot\><around*|(|r-f|)>.
  </equation*>

  <\lemma>
    The prior <math|\<lambda\><rsup|1>> is a maxmin prior.
  </lemma>

  <subsection|Experiment Setup>

  Consider the food delivering task in a <math|3\<times\>3> gridworld we
  defined previously, the time horizon is set to <math|H=10>. Recall that it
  takes 4 timesteps to deliver the food to the guest when the partner takes
  food from the table and delivers the food directly to the guest. It takes
  <math|6> timesteps if the AI agent takes the food and delivers directly to
  the guest. Consider the following two partners:

  <\itemize>
    <item>Partner <math|1> with policy <math|\<pi\><rsub|1>>: A partner that
    takes the food from the table and delivering directly to the guest.

    <item>Partner <math|2> with policy <math|\<pi\><rsub|2>>: A partner that
    takes the food from the table and put the food to the table.
  </itemize>

  Now, consider a hypothesis set <math|\<cal-H\>> defined as
  <math|\<cal-H\>\<triangleq\><around*|{|\<pi\><rsub|1>,\<pi\><rsub|2>|}>>.
  When the true partner policy <math|\<pi\><rsup|\<ast\>>=\<pi\><rsub|1>> and
  the following prior distribution

  <\equation*>
    \<lambda\><rsub|1><rsup|1>=1,<space|1em>\<lambda\><rsub|2><rsup|1>=0.
  </equation*>

  Intuitively, the prior will never be updated before time <math|5>. This is
  because the two partners perform exactly the same before taking the food
  from the table. With this prior, the best policy for the AI agent is to
  take food from the table and deliver the food directly to the guest, which
  takes <math|10> timesteps to deliver the food.

  <\bibliography|bib|tm-plain|prior.bib>
    <\bib-list|13>
      <bibitem*|1><label|bib-albrecht_belief_2016>Stefano<nbsp>V.<nbsp>Albrecht,
      Jacob<nbsp>W.<nbsp>Crandall<localize|, and >Subramanian Ramamoorthy.
      <newblock>Belief and Truth in Hypothesised Behaviours.
      <newblock><with|font-shape|italic|Artificial Intelligence>, 235:63-94,
      jun 2016.<newblock>

      <bibitem*|2><label|bib-albrecht_empirical_2019>Stefano<nbsp>V.<nbsp>Albrecht,
      Jacob<nbsp>W.<nbsp>Crandall<localize|, and >Subramanian Ramamoorthy.
      <newblock>An Empirical Study on the Practical Impact of Prior Beliefs
      over Policy Types. <newblock>jul 2019.<newblock>

      <bibitem*|3><label|bib-bertsekas_convex_2009>Dimitri<nbsp>P.<nbsp>Bertsekas<localize|,
      editor>. <newblock><with|font-shape|italic|Convex Optimization Theory>.
      <newblock>Athena Scientific, Belmont, Mass, 2009.<newblock>

      <bibitem*|4><label|bib-buening_minimax-bayes_2023>Thomas<nbsp>Kleine
      Buening, Christos Dimitrakakis, Hannes Eriksson, Divya
      Grover<localize|, and >Emilio Jorge. <newblock>Minimax-Bayes
      Reinforcement Learning. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of The 26th International
      Conference on Artificial Intelligence and Statistics>, <localize|pages
      >7511-7527. PMLR, apr 2023.<newblock>

      <bibitem*|5><label|bib-canaan_generating_2023>Rodrigo Canaan, Xianbo
      Gao, Julian Togelius, Andy Nealen<localize|, and >Stefan Menzel.
      <newblock>Generating and Adapting to Diverse Ad-Hoc Cooperation Agents
      in Hanabi. <newblock><with|font-shape|italic|IEEE Trans. Games>,
      15(2):228-241, jun 2023.<newblock>

      <bibitem*|6><label|bib-castellini_explaining_2020>Alberto Castellini,
      Enrico Marchesini, Giulio Mazzi<localize|, and >Alessandro Farinelli.
      <newblock>Explaining the Influence of Prior Knowledge on POMCP
      Policies. <newblock><localize|In >Nick Bassiliades, Georgios
      Chalkiadakis<localize|, and >Dave de Jonge<localize|, editors>,
      <with|font-shape|italic|Multi-Agent Systems and Agreement
      Technologies>, Lecture Notes in Computer Science, <localize|pages
      >261-276. Cham, 2020. Springer International Publishing.<newblock>

      <bibitem*|7><label|bib-kwon_rl_2021>Jeongyeol Kwon, Yonathan Efroni,
      Constantine Caramanis<localize|, and >Shie Mannor. <newblock>RL for
      Latent MDPs: Regret Guarantees and a Lower Bound. <newblock>feb
      2021.<newblock>

      <bibitem*|8><label|bib-lauffer_who_2023>Niklas Lauffer, Ameesh Shah,
      Micah Carroll, Michael Dennis<localize|, and >Stuart Russell.
      <newblock>Who Needs to Know? Minimal Knowledge for Optimal
      Coordination. <newblock>jul 2023.<newblock>

      <bibitem*|9><label|bib-baumeister_survey_2022>Reuth Mirsky, Ignacio
      Carlucho, Arrasy Rahman, Elliot Fosong, William Macke, Mohan Sridharan,
      Peter Stone<localize|, and >Stefano<nbsp>V.<nbsp>Albrecht. <newblock>A
      Survey of Ad Hoc Teamwork Research. <newblock><localize|In >Dorothea
      Baumeister<localize| and >Jörg Rothe<localize|, editors>,
      <with|font-shape|italic|Multi-Agent Systems>, <localize|volume> 13442,
      <localize|pages >275-293. Springer International Publishing, Cham,
      2022.<newblock>

      <bibitem*|10><label|bib-nyarko_bayesian_1998>Yaw Nyarko.
      <newblock>Bayesian Learning and Convergence to Nash Equilibria without
      Common Priors. <newblock><with|font-shape|italic|Economic Theory>,
      11(3):643-655, 1998.<newblock>

      <bibitem*|11><label|bib-rahman_minimum_2023>Arrasy Rahman, Jiaxun
      Cui<localize|, and >Peter Stone. <newblock>Minimum Coverage Sets for
      Training Robust Ad Hoc Teamwork Agents. <newblock>aug 2023.<newblock>

      <bibitem*|12><label|bib-rahman_generating_2023>Arrasy Rahman, Elliot
      Fosong, Ignacio Carlucho<localize|, and >Stefano<nbsp>V.<nbsp>Albrecht.
      <newblock>Generating Teammates for Training Robust Ad Hoc Teamwork
      Agents via Best-Response Diversity.
      <newblock><with|font-shape|italic|Transactions on Machine Learning
      Research>, may 2023.<newblock>

      <bibitem*|13><label|bib-sarkar_diverse_2023>Bidipta Sarkar, Andy
      Shih<localize|, and >Dorsa Sadigh. <newblock>Diverse Conventions for
      Human-AI Collaboration. <newblock>oct 2023.<newblock>
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
    <associate|auto-10|<tuple|5.1|6>>
    <associate|auto-11|<tuple|5.2|7>>
    <associate|auto-12|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|2.1|2>>
    <associate|auto-4|<tuple|2.2|2>>
    <associate|auto-5|<tuple|3|3>>
    <associate|auto-6|<tuple|3.1|4>>
    <associate|auto-7|<tuple|3.2|4>>
    <associate|auto-8|<tuple|4|5>>
    <associate|auto-9|<tuple|5|6>>
    <associate|bib-albrecht_belief_2016|<tuple|1|7>>
    <associate|bib-albrecht_empirical_2019|<tuple|2|7>>
    <associate|bib-baumeister_survey_2022|<tuple|9|7>>
    <associate|bib-bertsekas_convex_2009|<tuple|3|7>>
    <associate|bib-buening_minimax-bayes_2023|<tuple|4|7>>
    <associate|bib-canaan_generating_2023|<tuple|5|7>>
    <associate|bib-castellini_explaining_2020|<tuple|6|7>>
    <associate|bib-kwon_rl_2021|<tuple|7|7>>
    <associate|bib-lauffer_who_2023|<tuple|8|7>>
    <associate|bib-nyarko_bayesian_1998|<tuple|10|7>>
    <associate|bib-rahman_generating_2023|<tuple|12|7>>
    <associate|bib-rahman_minimum_2023|<tuple|11|7>>
    <associate|bib-sarkar_diverse_2023|<tuple|13|7>>
    <associate|eq:dual|<tuple|3|5>>
    <associate|eq:lmdp|<tuple|1|3>>
    <associate|eq:primal-belief|<tuple|2|5>>
    <associate|eq:strong-duality|<tuple|4|5>>
    <associate|footnote-1|<tuple|1|2>>
    <associate|footnr-1|<tuple|1|2>>
    <associate|hyp:normal|<tuple|8|4>>
    <associate|prop:unique-bayes-optimal-policy-for-maxmin-prior|<tuple|13|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      baumeister_survey_2022

      sarkar_diverse_2023

      canaan_generating_2023

      rahman_generating_2023

      rahman_minimum_2023

      lauffer_who_2023

      castellini_explaining_2020

      albrecht_belief_2016

      nyarko_bayesian_1998

      albrecht_belief_2016

      albrecht_empirical_2019

      albrecht_belief_2016

      buening_minimax-bayes_2023

      baumeister_survey_2022

      albrecht_belief_2016

      buening_minimax-bayes_2023

      buening_minimax-bayes_2023

      kwon_rl_2021

      rahman_minimum_2023

      buening_minimax-bayes_2023

      buening_minimax-bayes_2023

      bertsekas_convex_2009
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Problem
      formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Hypothesis set and the true
      prior distribution <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Measure the impact of prior
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      choice of prior matters in AHT> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Bayes-optimal policies are
      not robust <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Proof of Hypothesis
      <reference|hyp:normal> (Not complete)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Robust
      AHT policy> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Do
      Not Read> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Case study
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Experiment Setup
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>