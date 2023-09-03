<TeXmacs|2.1.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|ass>
      Assumption
    </new-remark>
  </hide-preamble>

  <section|The Environment>

  We consider a two-player episodic Markov game defined as a
  <math|<around*|(|S,s<rsub|abs>,A,P,r,\<gamma\>|)>>, where <math|S> is the
  joint state space and <math|A<rsub|joint>\<triangleq\>A<rsup|<around*|(|1|)>>\<times\>A<rsup|<around*|(|2|)>>>
  is the joint action space for both players. The transition kernel
  <math|\<bbb-P\>> and the expected reward <math|r> are defined as functions:

  <\equation*>
    \<bbb-P\>:S\<cup\><around*|{|s<rsub|abs>|}>\<times\>A<rsub|joint>\<rightarrow\>S,<space|1em>r:S\<times\>A<rsub|joint>\<rightarrow\><around*|{|0,1|}>.
  </equation*>

  The game terminate when the state, denoted as <math|s>, reaches the
  absorbing state <math|s<rsub|abs>>. We can also define the dynamics in the
  absorbing state as following:

  <\equation*>
    \<bbb-P\><around*|(|s<rsub|abs>,a<rsub|joint>|)>=s<rsub|abs><space|1em>and<space|1em>r<around*|(|s<rsub|abs>,a<rsub|joint>|)>=0,<space|1em>for
    all a<rsub|joint>\<in\>A<rsub|joint>
  </equation*>

  <subsection|Simplified Overcooked Environment>

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

  The set of human player's policy <math|\<cal-H\>> is defined as\ 

  <\equation*>
    \<cal-H\>=<around*|{|\<pi\><rsup|<around*|(|2|)>><rsub|table>,\<pi\><rsup|<around*|(|2|)>><rsub|ll>,\<pi\><rsup|<around*|(|2|)>><rsub|rr>,\<pi\><rsup|<around*|(|2|)>><rsub|rl>,\<pi\><rsup|<around*|(|2|)>><rsub|lr>|}>
  </equation*>

  Now, with Assumption <reference|ass:policy-set>, the player 1 faces an
  episodic MDP <math|<around*|(|S,s<rsub|abs>,A<rsup|<around*|(|1|)>>,\<cal-T\><rsup|\<pi\><rsup|<around*|(|2|)>>>,r<rsup|\<pi\><rsup|<around*|(|2|)>>>,\<gamma\>|)>>,
  where

  <\equation*>
    \<cal-T\><rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|s,a<rsup|<around*|(|1|)>>|)>=\<bbb-P\><around*|(|s,a<rsup|<around*|(|1|)>>,\<pi\><rsup|<around*|(|2|)>><around*|(|s|)>|)>,<space|1em>r<rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|s,a<rsup|<around*|(|1|)>>|)>=r<around*|(|s,a<rsup|<around*|(|1|)>>,\<pi\><rsup|<around*|(|2|)>><around*|(|s|)>|)>.
  </equation*>

  Thus, we have\ 

  <\equation*>
    \<cal-T\>=<around*|{|\<cal-T\><rsub|table>,\<cal-T\><rsub|ll>,\<cal-T\><rsub|rr>,\<cal-T\><rsub|rl>,\<cal-T\><rsub|lr>|}>,<infix-and>\<cal-r\>=<around*|{|r<rsub|table>,r<rsub|ll>,r<rsub|rr>,r<rsub|rl>,r<rsub|lr>|}>.
  </equation*>

  <subsection|Human Policy Generator>

  We generate human policies set <math|\<cal-H\>> by the following algorithm

  <section|Best Response Generator>

  For any <math|\<pi\><rsup|<around*|(|2|)>>\<in\>\<cal-H\>>, the player
  <math|1> admits a best response. We denote a set of player <math|1>'s best
  response corresponds to <math|\<cal-H\>> as
  \ <math|BR<around*|(|\<cal-H\>|)>>. Thus,

  <\equation*>
    BR<around*|(|\<cal-H\>|)>=<around*|{|\<pi\><rsup|<around*|(|1|)>><rsub|table>,\<pi\><rsup|<around*|(|1|)>><rsub|ll>,\<pi\><rsup|<around*|(|1|)>><rsub|rr>,\<pi\><rsup|<around*|(|1|)>><rsub|rl>,\<pi\><rsup|<around*|(|1|)>><rsub|lr>|}>,
  </equation*>

  Note that in our simulation, we only generate one best response for each
  human policy <math|\<pi\><rsup|<around*|(|2|)>>>.

  <subsection|Value Iteration>

  The set <math|BR<around*|(|\<cal-H\>|)>> is generated by value iteration
  algorithm. For example, the bellman optimality update for player <math|1>
  when the player <math|2>'s policy is <math|\<pi\><rsup|<around*|(|1|)>><rsub|ll>>
  is given by

  <\equation*>
    Q<rsub|k+1><rsup|ll><around*|(|s,a|)>\<leftarrow\>r<around*|(|s,<around*|(|a,\<pi\><rsup|<around*|(|2|)>><rsub|ll><around*|(|s|)>|)>|)>+\<gamma\><below|max|a\<in\>A>Q<rsub|k><rsup|ll><around*|(|s<rprime|'>,a|)>,
  </equation*>

  where <math|s<rprime|'>=\<bbb-P\><around*|(|s,a|)>>. Define
  <math|V<rsup|ll><rsub|k><around*|(|s|)>\<triangleq\><below|max|a\<in\>A>Q<rsub|k><rsup|ll><around*|(|s,a|)>>.
  For the absorbing state <math|s<rsub|abs>>

  <\equation*>
    V<rsup|ll><around*|(|s<rsub|abs>|)>\<leftarrow\>0.
  </equation*>

  The update terminates until <math|<around*|\<\|\|\>|V<rsub|k+1>-V<rsub|k>|\<\|\|\>><rsub|\<infty\>>\<leq\>\<varepsilon\><rsub|tol>>,
  where <math|\<varepsilon\><rsub|tol>\<gtr\>0> is the tolerence constant. In
  our simulation, we set <math|\<varepsilon\><rsub|tol>=0.001>. The best
  response policy is taken as\ 

  <\equation>
    \<pi\><rsup|<around*|(|1|)>><rsub|ll><around*|(|s|)>=<below|argmax|a>Q<rsup|ll><rsub|K><around*|(|s,a|)>,<label|eq:policy-vi>
  </equation>

  where <math|K> is the total iteration number.

  <subsection|Minimum Step>

  Similary to <eqref|eq:policy-vi>, we generated a best response policy set
  <math|BR<around*|(|\<cal-H\>|)>=<around*|{|\<pi\><rsup|<around*|(|1|)>><rsub|table>,\<pi\><rsup|<around*|(|1|)>><rsub|ll>,\<pi\><rsup|<around*|(|1|)>><rsub|rr>,\<pi\><rsup|<around*|(|1|)>><rsub|rl>,\<pi\><rsup|<around*|(|1|)>><rsub|lr>|}>>.
  Denote the terminal step for the game to terminate as <math|T<rsub|ll>>
  when the two player adopts the joint policy
  <math|<around*|(|\<pi\><rsup|<around*|(|1|)>><rsub|ll>,\<pi\><rsup|<around*|(|1|)>><rsub|ll>|)>>.
  Similarly, define

  <\equation*>
    \<cal-T\>=<around*|{|T<rsub|table>,T<rsub|ll>,T<rsub|rr>,T<rsub|lr>,T<rsub|rl>|}>.
  </equation*>

  The simulation results shows us the minimum steps for the game to stop ares

  <\equation>
    T<rsub|table>=4,<space|1em>T<rsub|ll>=T<rsub|rr>=T<rsub|lr>=T<rsub|rl>=6.<label|eq:mim-step>
  </equation>

  <section|Algorithms>

  We compare the performance of each algorithms by the total iteration number
  when adopting the output policy will make the game terminate in a minimum
  step defined in <eqref|eq:mim-step>. For example, when the human player is
  adopting <math|\<pi\><rsup|<around*|(|2|)>><rsub|ll>>, the minimum step is
  <math|T<rsub|ll>=6>. Thus the performance of an algorithm is defined by the
  minimum number of iterations <math|K<rsub|algo><rsup|ll>> when the output
  policy <math|\<pi\><rsup|<around*|(|1|)>>> together with the human policy
  <math|\<pi\><rsup|<around*|(|2|)>><rsub|ll>> will make the game terminate
  within <math|6> steps. The random seed number for all simulations are set
  to <math|60607>.

  <subsection|<math|Q> Learning with UCB Exploration>

  The <math|Q> learning with UCB exploration algorithm is given in the
  following:

  <\equation*>
    <with|font-shape|small-caps|see \ pdf>
  </equation*>

  The parameters are set to <math|\<varepsilon\>=0.1>, <math|\<delta\>=0.1>,
  and <math|\<varepsilon\><rsub|2>=0.1>, these are parameters of confidence
  level that can be chosen randomly. Also, we set <math|c<rsub|2>=0.001>, the
  number <math|0.001> is chosen to make sure <math|b<rsub|k>> is not large
  compared with the cumulative reward. If we set <math|c<rsub|2>=0.1> or
  <math|c<rsub|2>=0.01>, <math|b<rsub|k>> will be too large so the algorithm
  will keep exploring and not converge. The minimum numbers of iterations for
  each human are

  <\equation*>
    K<rsub|Q><rsup|table>=200,K<rsub|Q><rsup|ll>=\<cdots\>=K<rsup|rr><rsub|Q>=900
  </equation*>

  <subsection|Maximize to Explore (MEX)>

  The MEX algorithm is given in the following:

  <\equation*>
    <with|font-shape|small-caps|see \ pdf>
  </equation*>

  The loss function <math|\<cal-L\><around*|(|\<cal-D\>|)>> is defined as

  <\equation*>
    \<cal-L\><rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|\<cal-D\>|)>=<big|sum><rsub|<around*|(|s,a,s<rprime|'>|)>\<in\>\<cal-D\>>L<rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|s,a,s<rprime|'>|)>,
  </equation*>

  where

  <\equation*>
    L<rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|s,a,s<rprime|'>|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|if<space|1em>\<bbb-P\><rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|s,a|)>=s<rprime|'>>>|<row|<cell|1>|<cell|if<space|1em>\<bbb-P\><rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|s,a|)>\<neq\>s<rprime|'>>>>>>.
  </equation*>

  The parameters are set to <math|\<eta\>=0.01,0.02,0.1,0.2,0.3,0.4,0.5>. The
  result are all the same for these choice. The minimum numbers of iterations
  for each human are

  <\equation*>
    K<rsub|MEX><rsup|table>=2,K<rsub|MEX><rsup|ll>=\<cdots\>=K<rsup|rr><rsub|MEX>=2.
  </equation*>

  <subsection|UCB Algorithm>

  The UCB algorithm is given in the following:

  <\equation*>
    <with|font-shape|small-caps|see \ pdf>
  </equation*>

  The parameters are set to <math|\<alpha\>=0.1>. The minimum numbers of
  iterations for each human are

  <\equation*>
    K<rsub|UCB><rsup|table>=2,K<rsub|UCB><rsup|ll>=\<cdots\>=K<rsup|rr><rsub|UCB>=17
  </equation*>

  The algorithm will converge to a suboptimal policy if we set
  <math|\<alpha\>\<less\>0.09>.\ 
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
    <associate|auto-10|<tuple|3.3|3>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|2|2>>
    <associate|auto-5|<tuple|2.1|2>>
    <associate|auto-6|<tuple|2.2|2>>
    <associate|auto-7|<tuple|3|2>>
    <associate|auto-8|<tuple|3.1|3>>
    <associate|auto-9|<tuple|3.2|3>>
    <associate|eq:mim-step|<tuple|2|2>>
    <associate|eq:policy-vi|<tuple|1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Environment> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Simplified Overcooked
      Environment <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Human Policy Generator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Best
      Response Generator> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Value Iteration
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Minimum Step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Algorithms>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc><with|mode|<quote|math>|Q>
      Learning with UCB Exploration <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Maximize to Explore (MEX)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>UCB Algorithm
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>
    </associate>
  </collection>
</auxiliary>