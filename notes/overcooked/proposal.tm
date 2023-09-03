<TeXmacs|2.1.2>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|gol>
      Goal
    </new-remark>

    <\new-remark|def>
      Definition
    </new-remark>

    <\new-remark|ass>
      Assumption
    </new-remark>

    <\new-theorem|hyp>
      Hypothsis
    </new-theorem>
  </hide-preamble>

  <doc-data|<doc-title|Human-AI Collaboration Project
  Proposal>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|Some Definitions>

  We consider a two-player episodic Markov game defined as a
  <math|<around*|(|S,A,P,r,T|)>>, where <math|S> is the joint state space and
  <math|A\<triangleq\>A<rsup|<around*|(|1|)>>\<times\>A<rsup|<around*|(|2|)>>>
  is the joint action space for both players. The transition kernel <math|P>
  and the expected reward <math|r> are defined as functions:

  <\equation*>
    P:S\<times\>A\<rightarrow\>\<Delta\><around*|(|S|)>,<space|1em>r:S\<times\>A\<rightarrow\><around*|[|0,1|]>.
  </equation*>

  The total number of timesteps <math|T> is defined as <math|T=M H>, where
  <math|M> is the total number of episodes and <math|H> is the total number
  of timesteps per episode.\ 

  <\ass>
    The initial state <math|s<rsub|1><rsup|m>> for each episode is fixed,
    i.e., <math|s<rsub|1><rsup|m>=s<rsub|1>> for any
    <math|k\<in\><around*|[|K|]>>.
  </ass>

  In the following discussion, we assume player <math|1> as the AI agent and
  player <math|2> as the human agent. Now we define the policy as\ 

  <\def>
    The joint policy <math|\<pi\>\<in\>\<Pi\>> is defined as
    <math|\<pi\>=<around*|(|\<pi\><rsup|<around*|(|1|)>>.\<pi\><rsup|<around*|(|2|)>>|)>>,
    where

    <\equation*>
      \<pi\><rsup|<around*|(|i|)>>:<around*|[|M|]>\<times\><around*|[|H|]>\<times\>S\<rightarrow\>\<Delta\><around*|(|A<rsup|<around*|(|i|)>>|)>.
    </equation*>

    For simplicity, we denote <math|\<pi\><rsup|<around*|(|i|)>><around*|(|m,h,\<cdot\>|)>>
    as <math|\<pi\><rsup|<around*|(|i|)>,m><rsub|h><around*|(|\<cdot\>|)>>.
    We also denote the joint policy for episode <math|m> as
    <math|\<pi\><rsup|m>\<triangleq\>\<pi\><around*|(|m,\<cdot\>,\<cdot\>|)>>,
    the set of all joint policies is denoted as <math|\<Pi\><rsub|m>>. Thus,
    <math|\<Pi\>=\<otimes\><rsub|m\<in\><around*|[|M|]>>\<Pi\><rsub|m>>. The
    state value function in episode <math|m>,
    <math|V<rsup|m>:\<Pi\>\<times\><around*|[|H|]>\<times\>S\<rightarrow\>\<bbb-R\>>
    is defined as\ 

    <\equation*>
      V<rsub|h><rsup|m,\<pi\><rsup|m>><around*|(|s|)>\<triangleq\>\<bbb-E\><around*|[|<above|<below|<big|sum>|t=h>|H>r<around*|(|s<rsub|t><rsup|m>,\<pi\><rsup|<around*|(|1|)>,m><rsub|t><around*|(|s<rsub|t><rsup|m>|)>,\<pi\><rsup|<around*|(|2|)>,m><rsub|t><around*|(|s<rsub|t><rsup|m>|)>|)>\<mid\>s<rsub|h>=s|]>.
    </equation*>
  </def>

  <\def>
    <with|font-shape|italic|(Nash Equilibrium)> A Nash equilibrium in episode
    <math|m> is a joint policy <math|\<pi\><rsup|NE<rsub|m>>\<in\>\<Pi\><rsub|m>>
    defined as <math|\<pi\><rsup|NE<rsub|m>>=<around*|(|\<pi\><rsup|<around*|(|1|)>,
    NE<rsub|m>>.\<pi\><rsup|<around*|(|2|)>,NE<rsub|m>>|)>> that satisfies

    <\equation*>
      V<rsub|1><rsup|m,\<pi\><rsup|NE<rsub|m>>><around*|(|s|)>\<geq\>V<rsub|1><rsup|m,<around*|(|\<pi\><rsup|<around*|(|1|)>,m>.\<pi\><rsup|<around*|(|2|)>,NE<rsub|m>>|)>><around*|(|s|)><space|1em>and<space|1em>V<rsub|1><rsup|m,\<pi\><rsup|NE<rsub|m>>><around*|(|s|)>\<geq\>V<rsub|1><rsup|m,<around*|(|\<pi\><rsup|<around*|(|1|)>,NE<rsub|m>>.\<pi\><rsup|<around*|(|2|)>,m>|)>><around*|(|s|)>.
    </equation*>

    The set of all Nash equilibriums in episode <math|m> is denoted as
    <math|<with|font|cal|NE<rsub|>><rsub|m>>.
  </def>

  <\hyp>
    The set of Nash equilibriums in all episodes are the same, i.e.,
    <math|<with|font|cal|NE<rsub|>><rsub|m>=<with|font|cal|NE>>, for any
    <math|m>.
  </hyp>

  <\def>
    <with|font-shape|italic|(Nash Optimal Policy)> A Nash Optimal Policy
    <math|\<pi\><rsup|*\<star\>,m>> in episode <math|m> is a Nash equilibrium
    such that

    <\equation*>
      V<rsub|1><rsup|m,\<pi\><rsup|*\<star\>,m>><around*|(|s|)>\<geq\>V<rsub|1><rsup|m,\<pi\><rsup|NE<rsub|m>>><around*|(|s|)><space|1em>\<forall\>\<pi\><rsup|NE<rsub|m>>\<in\><with|font|cal|NE<rsub|>><rsub|m>.
    </equation*>
  </def>

  <\ass>
    The Nash Optimal Policy is unique in any episode <math|m>
  </ass>

  <\hyp>
    The Nash Optimal Policies in all episodes are the same, i.e.,
    <math|\<pi\><rsup|*\<star\>,m>=\<pi\><rsup|*\<star\>>>, for any <math|m>.
  </hyp>

  <\def>
    <with|font-shape|italic|(Nash Complementary Policy)> A Nash Complementary
    Policy in episode <math|m> for player <math|2> is an individual policy
    <math|\<pi\><rsup|<around*|(|2|)>,m>> for which there exist a
    <with|font-series|bold|unique> <math|\<pi\><rsup|<around*|(|1|)>,m>>,
    such that the joint policy <math|\<pi\><rsup|><rsup|(m)> =
    (\<pi\><rsup|(1),m>, \<pi\><rsup|(2),m>)> constitutes a Nash Equilibrium
    in episode <math|m>.
  </def>

  We make the following assumptions for the human agent.

  <\ass>
    The human agent consistently employs a Nash Complementary policy in each
    episode.
  </ass>

  <\algorithm>
    <\enumerate>
      <item>Identify the set of policies <math|<with|font|cal|NCE>> player
      <math|2> adopted.

      <item>Identify the stationary policy
      <math|\<pi\><rsup|<around*|(|2|)>,m>> used in episode <math|m> from
      <math|<with|font|cal|NCE>>

      <item>Learn <math|\<pi\><rsup|<around*|(|1|)>,m>> such that
      <math|\<pi\><rsup|><rsup|(m)> = (\<pi\><rsup|(1),m>,
      \<pi\><rsup|(2),m>)\<in\><with|font|cal|NE>>.
    </enumerate>
  </algorithm>

  <section|Problems When Given Policy Set>

  <subsection|Optimizing Within One Episode When Given Player 2's Policy Set>

  Consider in episode <math|m>, the player 2 adopts a stationary policy
  <math|\<pi\><rsup|m,<around*|(|2|)>,i>\<in\>\<Pi\><rsup|<around*|(|2|)>>>,
  where <math|\<Pi\><rsup|<around*|(|2|)>>\<triangleq\><around*|(|\<pi\><rsup|m,<around*|(|2|)>,1>,\<ldots\>,\<pi\><rsup|m,<around*|(|2|)>,N>|)>>.
  The policy set <math|\<Pi\><rsup|<around*|(|2|)>>> is given in hindsight.
  Our goal is to find a policy <math|\<pi\><rsup|m,<around*|(|1|)>>> that
  minimize the value function <math|V<rsub|1><rsup|<around*|(|\<pi\>,\<pi\><rsup|m,<around*|(|2|)>>|)>><around*|(|S<rsub|1>|)>>,
  i.e.,

  <\equation*>
    \<pi\><rsup|m,<around*|(|1|)>,i>=<below|argmax|\<pi\>\<in\>\<Pi\><rsup|>>
    V<rsub|1><rsup|<around*|(|\<pi\>,\<pi\><rsup|m,<around*|(|2|)>,i>|)>><around*|(|S<rsub|1>|)>=<below|argmax|\<pi\>\<in\>\<Pi\><rsup|>><above|<below|<big|sum>|t=1>|H>R<around*|(|s<rsub|t>,\<pi\><around*|(|s<rsub|t>|)>,\<pi\><rsup|m,<around*|(|2|)>,i><around*|(|s<rsub|t>|)>|)>.
  </equation*>

  <\question>
    Is it a solved problem?
  </question>

  <\answer>
    It is a solved problem.
  </answer>

  <subsection|Optimizing Among Episodes When Given Player 2's Policy Set>

  <\equation*>
    \<pi\><rsup|<around*|(|1|)>>=<below|argmax|\<pi\>\<in\>\<Pi\><rsup|m>><above|<below|<big|sum>|m=1>|M>
    V<rsub|1><rsup|<around*|(|\<pi\><rsup|m,<around*|(|1|)>>,\<pi\><rsup|m,<around*|(|2|)>>|)>><around*|(|S<rsub|1>|)>=<below|argmax|\<pi\>\<in\>\<Pi\><rsup|m>><above|<below|<big|sum>|m=1>|M>
    <above|<below|<big|sum>|t=1>|H>R<around*|(|s<rsub|t>,\<pi\><rsup|m,<around*|(|1|)>><around*|(|s<rsub|t>|)>,\<pi\><rsup|m,<around*|(|2|)>><around*|(|s<rsub|t>|)>|)>,
  </equation*>

  where <math|\<pi\><rsup|<around*|(|1|)>>=<around*|(|\<pi\><rsup|1,<around*|(|1|)>>,\<ldots\>,\<pi\><rsup|M,<around*|(|1|)>>|)>>
  and <math|\<pi\><rsup|m,<around*|(|2|)>>\<in\>\<Pi\><rsup|<around*|(|2|)>>>
  for all <math|m>.\ 

  <\remark>
    Our goal here is different with the goal in Kwon et.al. 2021, which is\ 

    <\equation*>
      \<pi\><rsup|\<star\>>=<below|argmax|\<pi\>\<in\>\<Pi\>><above|<below|<big|sum>|i=1>|N>\<bbb-P\><around*|(|\<pi\><rsup|m,<around*|(|2|)>,i>|)>V<rsub|1><rsup|<around*|(|\<pi\><rsup|m,<around*|(|1|)>>,\<pi\><rsup|m,<around*|(|2|)>,i>|)>><around*|(|S<rsub|1>|)>.
    </equation*>
  </remark>

  <\remark>
    The <math|\<delta\>>-Strongly Separated MDPs are too strong in our
    formulation.
  </remark>

  <\remark>
    We do not need to build <math|<wide|\<cal-M\>|~>>! So the problem might
    be solved! Just re-use the PBVI policy in each episode. Only update the
    belief state based on Bayesian filter.
  </remark>

  <subsection|Optimizing Among Episodes When Given the Size of Player 2's
  Policy Set>

  <\notation>
    <math|<wide|\<cal-M\>|~>=<around*|{|<wide|M|~><rsub|1>,\<ldots\>,<wide|M|~><rsub|m>,\<ldots\>,<wide|M|~><rsub|<around*|\||\<cal-M\>|\|>>|}>>,
    <math|><math|\<cal-M\>=<around*|{|M<rsub|1>,\<ldots\>,M<rsub|m>,\<ldots\>,M<rsub|<around*|\||\<cal-M\>|\|>>|}>>
  </notation>

  <\algorithm>
    <\enumerate>
      <item>Build an empirical LMDP <math|<wide|\<cal-M\><rsub|i>|~>>.

      <item>Run PBVI for <math|<wide|\<cal-M\><rsub|i>|~>> in episode
      <math|i>. (Note that the policy returned by PBVI here is a policy
      defined in belief space rather than history as in [Kown et. al. 2021])

      <item>Update <math|<wide|\<cal-M\>|~><rsub|i>> to
      <math|<wide|\<cal-M\>|~><rsub|i+1>> based on the data collected when
      running PBVI in episode <math|i> (This step also includes the belief
      state at time <math|H>, i.e., <math|N<around*|(|m|)>\<leftarrow\>N<around*|(|m|)>+b<rsub|H><around*|(|m|)>>).
    </enumerate>
  </algorithm>

  <\remark>
    The <math|\<delta\>>-strongly separable assumption guarantees a good
    initialization and a reliable estimate of belief over contexts.
  </remark>

  Denote\ 

  <\equation*>
    V<rsub|M<rsub|m>><rsup|\<pi\>>=\<bbb-E\><rsub|M<rsub|m>><rsup|\<pi\>><around*|(|<above|<below|<big|sum>|h=1>|H>r<rsub|h>|)>
  </equation*>

  as the value function for policy <math|\<pi\>> when the real MDP is
  <math|M<rsub|m>>, where <math|m\<in\><around*|[|<around*|\||\<cal-M\>|\|>|]>>.

  <\remark>
    <math|V<rsub|\<cal-M\>><rsup|\<pi\>>\<triangleq\><above|<below|<big|sum>|m=1>|<around*|\||\<cal-M\>|\|>>w<rsub|m>V<rsub|M<rsub|m>><rsup|\<pi\>>>
  </remark>

  <\remark>
    The regret that [Kown et. al. 2021] tries to minimize is\ 

    <\equation*>
      <above|<below|<big|sum>|k=1>|K><around*|(|\<rho\><rsub|1>V<rsub|\<cal-M\>><rsup|\<star\>>-\<rho\><rsub|2>|)>-V<rsub|\<cal-M\>><rsup|\<pi\><rsup|k>>.
    </equation*>
  </remark>

  Our goal is to minimize the following regret

  <\equation*>
    <below|max|\<pi\><rsup|k>><above|<below|<big|sum>|k=1>|K>V<rsub|M<rsup|k>><rsup|\<pi\><rsup|k>>-<above|<below|<big|sum>|k=1>|K>V<rsub|M<rsup|k>><rsup|\<pi\><rsup|k>>
  </equation*>

  <\proposition>
    for <math|m\<in\><around*|[|<around*|\||\<cal-M\>|\|>|]>>,
    <math|V<rsub|<wide|M|~><rsub|m>><rsup|\<pi\>>\<geq\>V<rsub|M<rsub|m>><rsup|\<pi\>>>
    for any <math|\<pi\>>.
  </proposition>

  <\proof>
    Follow the same proof as Proposition 3.2 in [Kown et. al. 2021]
  </proof>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|2.1|2>>
    <associate|auto-4|<tuple|2.2|2>>
    <associate|auto-5|<tuple|2.3|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Some
      Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Problems
      When Given Policy Set> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Optimizing Within One
      Episode When Given Player 2's Policy Set
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Optimizing Among Episodes
      When Given Player 2's Policy Set <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Optimizing Among Episodes
      When Given the Size of Player 2's Policy Set
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>
    </associate>
  </collection>
</auxiliary>