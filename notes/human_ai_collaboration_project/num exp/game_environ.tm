<TeXmacs|2.1.2>

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

  <doc-data|<doc-title|Numerical Experiment>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|Simplified Overcooked Environment <with|color|blue|(5 by 5 is
  needed)>>

  We consider a simplified version of the Overcooked environment. The
  environment is a <math|3\<times\>3> grid with two players (player <math|1>:
  robot player, player 2: human player) working together to deliver food
  (take food in <math|<around*|(|3,2|)>>, deliver food in
  <math|<around*|(|1,2|)>>). The action space for both players are
  <math|A<rsup|<around*|(|1|)>>=A<rsup|<around*|(|2|)>>=A> and
  <math|A<rsub|joint>=A\<times\>A>. The transition kernel <math|\<cal-T\>> is
  deterministic, i.e., <math|\<cal-T\>:S\<times\>A\<rightarrow\>S>. The
  reward <math|r> is defined as\ 

  <\equation*>
    r<around*|(|s,a<rsub|joint>|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|else>>|<row|<cell|1>|<cell|if<space|1em>\<cal-T\><around*|(|s,a<rsub|joint>|)>=s<rsub|abs>>>>>>.
  </equation*>

  The following is an example of a state in simplified Overcooked
  environment:

  <\python>
    state = {'player_positions': [(1,2), (3,2)], \ 'player_has_food': [False,
    False], 'table_position': (2, 2), 'table_has_food': True}
  </python>

  In this simplified Overcooked environment, the state space consists of the
  following components:

  <\enumerate>
    <item>Player positions: 8 possible positions (eliminate table position)
    for each player (<math|3\<times\>3> grid), so <math|8\<times\>8=64>
    combinations.

    <item>Player has food: 2 possibilities for each player (True or False),
    so <math|2\<times\>2=4> combinations.

    <item>Table has food: 2 possibilities (True or False), so 2 combinations.

    <item>An abosrbing state <math|s<rsub|abs>>.
  </enumerate>

  Total state space size: <math|<around|\||S|\|>=64\<times\>4\<times\>2+1=513>.
  Also, <math|<around|\||A|\|>=5>.

  <\ass>
    The initial state <math|s<rsub|1><rsup|k>> for each episode <math|k> is
    fixed, i.e., <math|s<rsub|1><rsup|k>=s<rsub|1>> for any
    <math|k\<in\><around*|[|K|]>>.
  </ass>

  <\ass>
    <label|ass:policy-set>Player 2 adopts a stationary policy denoted as
    <math|\<pi\><rsup|<around*|(|2|)>>>, which belongs to the set
    <math|\<cal-H\>>.
  </ass>

  <section|Comparative Analysis of Regret>

  We evaluate and compare the regret observed in the following algorithms:

  <\enumerate>
    <item>MEX.

    <item>MAB.

    <item>Q-UCB.

    <item>Model-based RL + UCB (MBRL+UCB).

    <item>Optimistic posterior sampling.
  </enumerate>

  For all these <math|5> algorithms, we provide them a finite hypothesis set
  <math|\<cal-H\><rsub|fin>>.

  <subsection|Finite Hypothesis Set>

  For this experiment, we let <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\><rsub|fin>>.
  Then, we generate the subsequent graph utilizing the following parameters
  for <math|5> algorithms:

  <\enumerate>
    <item>Horizontal axis: Episode number, denoted by <math|k>.

    <item>Vertical axis: <math|<big|sum><rsub|i=1><rsup|k>V<around*|(|\<psi\><around*|(|\<pi\><rsup|i>|)>,\<pi\>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>,
    where <math|\<psi\>> represents the value iteration algorithm.
  </enumerate>

  <subsection|Infinite Hypothesis Set>

  For the purposes of this experiment, we do not employ a true infinite
  hypothesis set. Instead, we arbitrarily select a policy from
  <math|\<cal-H\><rsub|fin>>, denote it as
  <math|\<pi\><rsup|\<ast\>><rsub|det>>, and choose
  <math|\<pi\><rsup|\<ast\>>\<nin\>\<cal-H\><rsub|fin>> such that
  <math|<around*|\<\|\|\>|\<pi\><rsup|\<ast\>><rsub|det>-\<pi\><rsup|\<ast\>>|\<\|\|\>>\<leq\>\<varepsilon\>>.\ 

  Keeping <math|\<varepsilon\>> constant, we construct the following graph
  utilizing the following parameters, applied across 5 different algorithms:

  <\enumerate>
    <item>Horizontal axis: Episode number, denoted by <math|k>.

    <item>Vertical axis: <math|<big|sum><rsub|i=1><rsup|k>V<around*|(|\<psi\><around*|(|\<pi\><rsup|i>|)>,\<pi\><rsup|i>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>,
    where <math|\<psi\>> represents the value iteration algorithm.
  </enumerate>

  Moreover, maintaining a fixed total episode count denoted by <math|K>, we
  develop another graph utilizing the subsequent parameters, again applied
  across 5 different algorithms:

  <\enumerate>
    <item>Horizontal axis: The covering distance, <math|\<varepsilon\>>

    <item>Vertical axis: <math|<big|sum><rsub|i=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|i>|)>,\<pi\><rsup|i>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>,
    where <math|\<psi\>> represents the value iteration algorithm.
  </enumerate>

  <section|Theoretical Analysis>

  We seek to build the following examples

  <\example>
    An example where the regret of MEX is smaller that of MAB/MBRL-UCB when
    <math|K> is sufficiently large, or conversely.
  </example>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|ass:policy-set|<tuple|2|1>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|2.1|1>>
    <associate|auto-4|<tuple|2.2|?>>
    <associate|auto-5|<tuple|3|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Game
      Environment> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Simplified Overcooked
      Environment <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Comparative
      Analysis of Regret> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>