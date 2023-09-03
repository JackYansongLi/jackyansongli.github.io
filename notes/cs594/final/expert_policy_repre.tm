<TeXmacs|2.1.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>

    <\new-remark|ass>
      Assumption
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Learning Policy Representation from
  Trajectories>|<doc-date|<date|>>|<doc-author|<author-data|<author-name|Shuo
  Wu>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|swu99@uic.edu>>>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<\author-email>
    yli340@uic.edu
  </author-email>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>>>>

  <section|Introduction>

  Reinforcement learning (RL) has seen significant advancements in recent
  years, enabling artificial intelligence (AI) agents to tackle various
  complex tasks across diverse domains. The ultimate goal of reinforcement
  learning is to find an optimal policy that guides an agent's
  decision-making process in an environment. In single-agent environments,
  such optimal policies can be learned through various methods, as discussed
  in <cite|meyn_control_2022>. However, the situation becomes more complex
  when the agent interacts in a multi-agent environment. In a multi-agent
  setting, an optimal policy for one agent depends on the policies of all
  other agents in the environment. We demonstrated that the environment turns
  into a stationary MDP when other agents remain
  <with|font-shape|italic|static>. To determine which MDP the agent is
  facing, knowledge of the other agents' policies is required. In a
  decentralized setting, where the agent can only observe the system state
  and joint actions of other players, this information is not directly
  observable. Thus, we need to infer an agent's policy from their historical
  trajectories.

  We further demonstrated that such a mathematical framework can be applied
  to human-AI collaboration, where the AI interacts with different types of
  humans. The type of human can be defined by the policy that the human agent
  adopts. Therefore, inferring a human agent's policy is the same as
  determining the type of human the AI agent is interacting with.

  The primary goal of our task is:

  <\itemize>
    <item><with|font-series|bold|Learning a policy representation from
    trajectories and using this representation to predict the policy an agent
    adopts when given their historical trajectories.>
  </itemize>

  Our task is different with imitation learning in the following ways:

  <\itemize>
    <item>The policies we want to learn a representation may not be optimal
    or close to optimal.

    <item>We aim to predict the policy given a trajectory, rather than
    mimicking a policy.
  </itemize>

  Previous work on learning a policy representation from trajectories
  typically restrict the agent's policy in a policy set with a strong
  functional form. For instance, Stefanos et.al.
  <cite|nikolaidis_human-robot_2017> assumes the human agent choose a policy
  from <math|\<Pi\><rsup|<around*|(|2|)>><rsub|\<alpha\>>> such that\ 

  <\equation*>
    \<Pi\><rsup|<around*|(|2|)>><rsub|\<alpha\>>\<triangleq\><choice|<tformat|<table|<row|<cell|\<pi\><rsup|H><space|1em>with
    prob. \<alpha\>>>|<row|<cell|\<pi\><rsup|R><space|1em>with prob.
    1-\<alpha\><space|2em>>>>>>,
  </equation*>

  where <math|\<pi\><rsup|H>> and <math|\<pi\><rsup|R>> are fixed stationary
  polices. Our work aims to find a representation that only assumes the human
  agent choose a policy from <math|\<Pi\><rsup|<around*|(|2|)>>> such that
  <math|\<Pi\><rsup|<around*|(|2|)>>> is the set of all stationary policy.

  We address this task by treating a trajectory as a language sequence and
  applying contrastive learning from natural language processing. Detailed
  experimental results will be presented in the final section of this
  proposal.

  <section|Problem Setup>

  We consider a non-discounted finite horizon multi-agent Markov decision
  process (MMDP), which is defined below.

  <\def>
    A multi-agent Markov decision process (MMDP) is defined as a tuple
    <math|<around*|(|N,S,A,R,P,\<gamma\>|)>>, where <math|N> is the total
    number of agents, <math|S> is the state space,
    <math|A\<triangleq\>A<rsub|1>\<times\>\<cdots\>\<times\>A<rsub|N>> is the
    joint action space, <math|R:S\<times\>A\<rightarrow\><around*|[|0,1|]>>
    is the reward function, <math|\<gamma\>> is the discount factor, and
    <math|P:S\<times\>A\<rightarrow\>\<Delta\><around*|(|S|)>> is the
    transition kernel. \ \ \ 
  </def>

  <\remark>
    Note that all the agents share the same reward function, i.e., we assume
    an identical-interest setting. A more general definition for
    non-identical interest is called <with|font-shape|italic|Stochastic
    games> which can be seen in <cite|yang_overview_2021> and
    <cite|zhang_multi-agent_2021>.
  </remark>

  The goal of MMDP is to maximize the following cumulative reward

  <\equation>
    <below|min|\<pi\>><space|1em>V<rsup|\<pi\>><around*|(|s<rsub|1>|)>\<triangleq\>\<bbb-E\><around*|(|<above|<below|<big|sum>|h=1>|H>R<around*|(|s<rsub|h>,a<rsub|h><rsup|<around*|(|1|)>>,a<rsub|h><rsup|<around*|(|2|)>>,\<ldots\>,a<rsub|h><rsup|<around*|(|N|)>>|)>|)>,<label|eq:mmdp-goal>
  </equation>

  where <math|s<rsub|h>> is the state in timestep <math|h>,
  \ <math|a<rsub|h><rsup|<around*|(|i|)>>> is the action of agent <math|i> in
  timestep <math|h>, and <math|H> is the time horizon. If
  <math|H\<less\>\<infty\>>, we call the MMDP finite horizon MMDP. The
  optimization is taken with respect to policies, which is defined as
  <math|\<pi\>=<around*|(|\<pi\><rsup|<around*|(|1|)>>,\<ldots\>,\<pi\><rsup|<around*|(|N|)>>|)>>
  and <math|\<pi\><rsup|<around*|(|i|)>>:S\<times\>\<bbb-R\><rsub|+>\<rightarrow\>\<Delta\><around*|(|A<rsub|i>|)>>.
  To simplify the discussion, we only consider two-player game in the
  following, i.e., <math|N=2>.

  <subsection|MMDP Formulation for Human-AI Collaboration>

  The same formulation of two-player MMDP can be used as a mathematical
  formulation for human-AI collaboration. Formally, we denote player <math|1>
  as the AI agent and player <math|2> as a human agent. The goal of the AI
  agent is to maximize the cumulative reward given a human agent. Formally,
  the problem is

  <\equation>
    <below|max.|\<pi\><rsup|<around*|(|1|)>>><space|1em>V<rsup|\<pi\><rsup|<around*|(|1|)>>,\<pi\><rsup|<around*|(|2|)>>><around*|(|s<rsub|1>|)>\<triangleq\>\<bbb-E\><around*|(|<above|<below|<big|sum>|h=1>|H>R<around*|(|s<rsub|h>,a<rsub|h><rsup|<around*|(|1|)>>,a<rsub|h><rsup|<around*|(|2|)>>,\<ldots\>,a<rsub|h><rsup|<around*|(|N|)>>|)>|)>,<label|eq:hai-goal>
  </equation>

  The only difference between <eqref|eq:mmdp-goal> and <eqref|eq:hai-goal> is
  that the maximize in <eqref|eq:hai-goal> is taken with respect to
  <math|\<pi\><rsup|<around*|(|1|)>>>, not
  <math|\<pi\>=<around*|(|\<pi\><rsup|<around*|(|1|)>>,\<pi\><rsup|<around*|(|2|)>>|)>>,
  this is the rule we set in this human-AI collaboration task: the AI agent
  cannot change the behavior of human. However, to make the problem
  tractable, we need to make the following assumption to the human agent:

  <\ass>
    A human agent is called <with|font-shape|italic|static> if she adopts a
    stationary policy, i.e., <math|\<pi\><rsup|<around*|(|2|)>>> is
    independet of time, \ <math|\<pi\><rsup|<around*|(|i|)>>:S\<rightarrow\>\<Delta\><around*|(|A<rsub|i>|)>>.<label|ass:static-human>
  </ass>

  Under Assumption <reference|ass:static-human>, we have the following
  proposition.

  <subsection|Single-Agent Reduction for MMDP>

  <\proposition>
    For a two-player MMDP, if player <math|2> is static, the MMDP reduces to
    a MDP in player <math|1>'s perspective.
  </proposition>

  <\proof>
    We denote the tuple for the reduced MDP as
    <math|<around*|(|S<rprime|'>,A<rprime|'>,R<rprime|'>,P<rprime|'>,\<gamma\><rprime|'>|)>>.
    The tuple follows the following construction rule

    <\itemize>
      <item><math|S<rprime|'>=S>.

      <item><math|A<rprime|'>=A<rsub|1>>.

      <item><math|R<rprime|'><around*|(|s,a|)>=R<around*|(|s,a,\<pi\><rsup|<around*|(|2|)>><around*|(|s|)>|)>\<triangleq\>\<bbb-E\><rsub|a<rsub|2>\<sim\>\<pi\><rsup|<around*|(|2|)>><around*|(|s|)>><around*|[|R<around*|(|s,a,a<rsub|2>|)>|]>>.

      <item><math|P<rprime|'><around*|(|s,a|)>=P<around*|(|s,a,\<pi\><rsup|<around*|(|2|)>><around*|(|s|)>|)>\<triangleq\>\<bbb-E\><rsub|a<rsub|2>\<sim\>\<pi\><rsup|<around*|(|2|)>><around*|(|s|)>><around*|[|P<around*|(|s,a,a<rsub|2>|)>|]>>.

      <item><math|\<gamma\><rprime|'>=\<gamma\>>.
    </itemize>
  </proof>

  By the above proposition, we know that the human-AI collaboration task
  reduces to a single-agent MDP when the human-agent is static. We have
  multiple model-free algorithms to solve a single-agent MDP. However, we
  need that our AI agent can collaborate with different people. Changing
  human agents means changing the environment (MDP) the AI agent interact
  with. For example, when a human agent and the AI work together to move a
  table, some human prefer to move the right side, while others prefer the
  left side. For a human agent who prefers moving the right side, the AI
  should move the left side, and vice versa. The problem can be formulated to
  a latent MDP

  <subsection|Latent MDP Formulation for Human-AI Collaboration with
  Multiple-Type of Humans>

  <\def>
    Consider a set of MDPs <math|<around*|(|M<rsub|1>,M<rsub|2>,\<ldots\>,M<rsub|N>|)>>,
    such that each <math|M<rsub|i>> is a tuple
    <math|<around*|(|S,A,R<rsub|i>,P<rsub|i>,\<gamma\>|)>>. A latent MDP
    (LMDP) <math|<with|font|cal|M>> defined on this set is a partially
    observable MDP with state being <math|S\<times\><around*|[|N|]>> with the
    same state and action space with reward function
    <math|R<around*|(|s,i,a|)>=R<rsub|i><around*|(|s,a|)>> and transition
    kernel <math|P<around*|(|s,i,a|)>=P<rsub|i><around*|(|s,a|)>>. The
    observation state is <math|S>.
  </def>

  For our task, to identify the human agent's policy is the same as
  identifying which MDP the AI agent interacts with, which is the same as
  determine the latent variable <math|i\<in\><around*|[|N|]>>. The
  representation of the human agents action serves as an latent variable in
  this case.

  In a word, we need the AI to quickly determine the human agent's preference
  and cooperate accordingly. With Assumption <reference|ass:static-human>,
  the problem reduce to:\ 

  <\itemize>
    <item><with|font-series|bold|How to help the AI agent to quickly
    determine the human agent's policy from the trajectory?>
  </itemize>

  <section|Policy Representation from Trajectory>

  An intuitive way to quickly determine the human agent's policy is to learn
  a representation for all humans. This is the key differerence between our
  problem with imitation learning. We discussed this in the following remark.

  <\remark>
    Imitation learning primarily focuses on mimicking the implicit policy
    embedded within a given set of trajectories. It seeks to learn a policy
    that reproduces the expert's behavior by observing and following their
    actions. In contrast, our work aims to quickly evaluate and understand
    the characteristics of a policy, given a single trajectory. Instead of
    learning to replicate the policy, our approach focuses on efficiently
    assessing the nature of the policy based on the available trajectory
    information. This allows for a more rapid understanding of the policy's
    structure and behavior.
  </remark>

  We treat trajectories as a language sequence, we give a brief introduction
  of contrastive learning to learn a representation of language sequences in
  the following.

  <subsection|Contrastive Learning>

  Contrastive learning is a learning paradigm that leverages the structure of
  data to learn useful representations by contrasting positive (similar) and
  negative (dissimilar) data samples. This learning framework has been
  successfully applied to a wide range of tasks, including learning language
  sequence representations. In this setting, the objective is to learn a
  function that maps a given input sequence to a low-dimensional
  representation that captures its semantic information.

  Let <math|X> be the set of all possible language sequences, where
  <math|x<rsub|i>\<in\> X> represents a single sequence. We have a dataset
  <math|D = {x<rsub|1>, x<rsub|2>, ..., x<rsub|N>}> containing <math|N>
  language sequences. Now, define a function <math|f: X \<rightarrow\> Z>
  that maps a language sequence <math|x<rsub|i>> to a representation
  <math|z<rsub|i>\<in\> Z> in a low-dimensional space. The function <math|f>
  is parameterized by <math|\<theta\>>, which are the learnable parameters of
  a neural network. To apply contrastive learning, we first define a
  similarity measure <math|sim: Z \<times\> Z \<rightarrow\> R> that
  quantifies the similarity between two representations <math|z<rsub|i>> and
  <math|z<rsub|j>> in the low-dimensional space <math|Z>.\ 

  For each sequence <math|x<rsub|i>> in the dataset, we construct a set of
  positive (similar) samples <math|P<rsub|i>> and a set of negative
  (dissimilar) samples <math|N<rsub|i>>. In our context, positive samples can
  be other sequences generated by the same policy, while negative samples can
  be sequences generated by different policies. The contrastive learning
  objective is to learn the function f such that the similarity between the
  representation of a sequence and its positive samples is higher than the
  similarity between the sequence and its negative samples:

  <\equation*>
    L(\<theta\>) = <below|<big|sum>|i> <below|<big|sum>|x<rsub|p>
    \<in\>P<rsub|i>><below|<big|sum>|x<rsub|n> \<in\> N<rsub|i>> [m -
    sim(f(x<rsub|i>, \<theta\>), f(x<rsub|p>, \<theta\>)) + sim(f(x<rsub|i>,
    \<theta\>), f(x<rsub|n>, \<theta\>))]<rsub|+>,
  </equation*>

  where <math|<around*|[|x|]><rsub|+>\<triangleq\>max<around*|(|x,0|)>> and
  <math|m \<gtr\> 0> is a margin parameter..

  <subsection|Policy Representation from Trajectories Using Contrastive
  Learning>

  Now, let's apply this setting to the task of inferring policies from
  trajectories by treating them as language sequences:

  <\enumerate>
    <item>Each trajectory <math|\<tau\><rsub|i>> is treated as a language
    sequence <math|x<rsub|i>>, and the dataset <math|D> contains <math|N>
    trajectories.

    <item>Construct the sets of positive samples <math|P<rsub|i>> and
    negative samples <math|N<rsub|i>> for each trajectory by comparing the
    policies that generated them. A positive sample can be another trajectory
    generated by the same policy, while a negative sample can be a trajectory
    generated by a different policy.

    <item>Train the neural network with contrastive learning to learn a
    function f that maps trajectories to a low-dimensional representation
    capturing their policy-related information.

    <item>Given a new trajectory <math|\<tau\><rsub|new>>, compute its
    low-dimensional representation <math|z<rsub|new> = f(\<tau\><rsub|new>,
    \<theta\>)>. Infer the policy of the agent by finding the policy
    corresponding to the most similar representations in the dataset:

    <\equation*>
      \<pi\><rsub|new> = <below|argmax|\<pi\>><space|1em> sim(z<rsub|new>,
      z<rsub|i>),\ 
    </equation*>

    where <math|\<tau\><rsub|i>> is generated by policy <math|\<pi\>> and
    <math|z<rsub|i>= f(\<tau\><rsub|i>, \<theta\>)>.
  </enumerate>

  By following these steps, we can use contrastive learning to learn
  representations of trajectories as language sequences and infer the
  policies that generated them.

  <\bibliography|bib|tm-plain|final>
    <\bib-list|4>
      <bibitem*|1><label|bib-meyn_control_2022>Sean Meyn.
      <newblock><with|font-shape|italic|Control Systems and Reinforcement
      Learning>. <newblock>Cambridge University Press, First<localize|
      edition>, may 2022.<newblock>

      <bibitem*|2><label|bib-nikolaidis_human-robot_2017>Stefanos Nikolaidis,
      David Hsu<localize|, and >Siddhartha Srinivasa. <newblock>Human-robot
      mutual adaptation in collaborative tasks: Models and experiments.
      <newblock><with|font-shape|italic|The International Journal of Robotics
      Research>, 36(5-7):618\U634, jun 2017.<newblock>

      <bibitem*|3><label|bib-yang_overview_2021>Yaodong Yang<localize| and
      >Jun Wang. <newblock>An Overview of Multi-Agent Reinforcement Learning
      from Game Theoretical Perspective. <newblock>mar 2021.<newblock>

      <bibitem*|4><label|bib-zhang_multi-agent_2021>Kaiqing Zhang, Zhuoran
      Yang<localize|, and >Tamer Ba³ar. <newblock>Multi-Agent Reinforcement
      Learning: A Selective Overview of Theories and Algorithms.
      <newblock>apr 2021.<newblock>
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
    <associate|ass:static-human|<tuple|3|2>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|2.1|2>>
    <associate|auto-4|<tuple|2.2|2>>
    <associate|auto-5|<tuple|2.3|3>>
    <associate|auto-6|<tuple|3|3>>
    <associate|auto-7|<tuple|3.1|4>>
    <associate|auto-8|<tuple|3.2|4>>
    <associate|auto-9|<tuple|4|?>>
    <associate|bib-meyn_control_2022|<tuple|1|4>>
    <associate|bib-nikolaidis_human-robot_2017|<tuple|2|4>>
    <associate|bib-yang_overview_2021|<tuple|3|4>>
    <associate|bib-zhang_multi-agent_2021|<tuple|4|4>>
    <associate|eq:hai-goal|<tuple|2|2>>
    <associate|eq:mmdp-goal|<tuple|1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      meyn_control_2022

      nikolaidis_human-robot_2017

      yang_overview_2021

      zhang_multi-agent_2021
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Problem
      Setup> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>MMDP Formulation for
      Human-AI Collaboration <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Single-Agent Reduction for
      MMDP <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Policy
      Representation from Trajectory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Contrastive Learning
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Policy Representation from
      Trajectories Using Contrastive Learning
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>