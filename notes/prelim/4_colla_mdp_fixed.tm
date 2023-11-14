<TeXmacs|2.1.2>

<project|main.tm>

<style|book>

<\body>
  <chapter|Collaborating With Fixed Partners in Markov Teams>

  <section|Episodic Finite Horizon MDP>

  <\remark>
    \;

    <\enumerate>
      <item><math|\<cal-H\>=<around*|{|\<pi\>\<mid\>\<pi\>:S\<times\><around*|[|H|]>\<rightarrow\>\<Delta\><around*|(|A|)>,\<ldots\>,|}>>

      <item><math|\<cal-H\>=<around*|{|r<around*|(|a|)>\<mid\>r<around*|(|a|)>
      is an \<varepsilon\>-IBR|}>>
    </enumerate>
  </remark>

  We consider a two-player episodic finite horizon Markov game defined as
  <math|<around*|(|S,A,\<bbb-P\>,H,K,r,\<gamma\>|)>>, where <math|S> is the
  joint state space and <math|A> is the action space for both players. In
  this paper, we only consider the tabular setting, i.e.,
  <math|<around*|\||S|\|>\<less\>\<infty\>> and
  <math|<around*|\||A|\|>\<less\>\<infty\>>. The transition kernel
  <math|\<bbb-P\>> and the expected reward <math|r> are defined as:

  <\equation*>
    \<bbb-P\>:S\<times\>A\<times\>A\<rightarrow\>\<Delta\><around*|(|S|)>,<space|1em>r:S\<times\>A\<times\>A\<rightarrow\><around*|[|0,1|]>,
  </equation*>

  where <math|\<Delta\><around*|(|S|)>> is the probability simplex on joint
  state space. The time horizon and the total number of episodes are denoted
  by <math|H> and <math|K>. Also, we consider a discounted setting with a
  discount factor <math|\<gamma\>\<less\>1>. We use <math|s<rsup|k><rsub|h>>
  to denote the joint state of episode <math|k> in time <math|h> and we use
  <math|a<rsup|k><rsub|h>> and <math|b<rsup|k><rsub|h>> to denote the action
  of episode <math|k> in time <math|h> for player <math|1> and player
  <math|2> respectively. The initial state is fixed for all episodes and
  denoted as <math|s<rsub|1>>, i.e., <math|s<rsup|k><rsub|0>=s<rsub|0>>.\ 

  <\remark>
    \;

    <\enumerate>
      <item><em|(Markov Teams)> <math|<around*|(|N,H,S,A<rsub|joint>,P,r,\<gamma\>|)>>

      <item>(In here) <math|<around*|(|2,H,S,A\<times\>A,P,r,\<gamma\>|)><big|cup><around*|(|K|)>>
    </enumerate>
  </remark>

  The policy for player <math|1> is denoted as <math|\<mu\>> and defined as

  <\equation*>
    \<mu\>:S\<times\><around*|[|H|]>\<rightarrow\>\<Delta\><around*|(|A|)>,
  </equation*>

  where <math|<around*|[|H|]>=<around*|{|0,1,\<ldots\>,H-1|}>>. The policy
  for player <math|2> is denoted as <math|\<pi\>> and defined as\ 

  <\equation*>
    \<pi\>:S\<times\><around*|[|H|]>\<rightarrow\>\<Delta\><around*|(|A|)>.
  </equation*>

  The set of all policies available to player 1 is denoted by
  <math|\<cal-U\>> and the set for player 2 is represented by <math|\<Pi\>>.
  Now, we define the cumulative reward given policies
  <math|<around*|(|\<mu\>,\<pi\>|)>> as

  <\equation*>
    V<around*|(|\<mu\>,\<pi\>|)>=\<bbb-E\><rsub|a<rsub|h>\<sim\>\<mu\><around*|(|s<rsub|h>,h|)>,b<rsub|h>\<sim\>\<pi\><around*|(|s<rsub|h>,h|)>><around*|[|<big|sum><rsub|h=0><rsup|H-1>\<gamma\><rsup|h>r<around*|(|s<rsub|h>,a<rsub|h>,b<rsub|h>|)>\<mid\>s<rsub|0>=s<rsub|0>,s<rsub|h+1>\<sim\>\<bbb-P\><around*|(|s<rsub|h>,a<rsub|h>,b<rsub|h>|)>|]>.
  </equation*>

  In this study, we explore a scenario where player <math|2> adopts a fixed
  but unknown policy through all episodes. The true policy adopted for player
  <math|2> is denoted as <math|\<pi\><rsup|\<ast\>>>. The primary objective
  is to develop a series of policies <math|<around*|{|\<mu\><rsup|k>|}><rsub|k\<in\><around*|[|K|]>>>
  for player <math|1><math|>, which aim to reduce the regret defined by the
  equation

  <\equation*>
    Reg<around*|(|K|)>=<big|sum><rsub|k=1><rsup|K>max<rsub|\<mu\>\<in\>\<cal-U\>>
    V<around*|(|\<mu\>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|\<ast\>>|)>.
  </equation*>

  <section|>

  For each player <math|2>'s policy <math|\<pi\>>, the set of all best
  response policies is denoted as <math|BR<around*|(|\<pi\>|)>>, i.e.,

  <\equation*>
    BR<around*|(|\<pi\>|)>=<below|argmax|\<mu\>\<in\>\<cal-U\>>
    V<around*|(|\<mu\>,\<pi\>|)>.
  </equation*>

  For any player <math|2>'s policy <math|\<pi\>>, we assume the existence of
  an oracle that can return a best response from
  <math|BR<around*|(|\<pi\>|)>>.\ 

  <\definition>
    <with|font-series|bold|(Oracle)> A best response oracle <math|\<psi\>>
    refers to a function that, upon receiving policies as input, yields a
    best response as its output, i.e., <math|\<psi\>> is a function
    <math|\<psi\>:\<cal-H\>\<rightarrow\>\<cal-U\>> such that

    <\equation*>
      \<psi\><around*|(|\<pi\>|)>\<in\>BR<around*|(|\<pi\>|)>.
    </equation*>
  </definition>

  With the definition of an oracle, we can categorize policies within a
  hypothesis set into various types.
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|3>
    <associate|page-first|15>
    <associate|page-medium|paper>
    <associate|section-nr|1>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|4|15>>
    <associate|auto-2|<tuple|4.1|15>>
    <associate|auto-3|<tuple|4.2|15>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Collaborating
      With Fixed Partners in Markov Decision Process>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      4.1<space|2spc>Episodic Finite Horizon MDP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      4.2<space|2spc> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>
    </associate>
  </collection>
</auxiliary>