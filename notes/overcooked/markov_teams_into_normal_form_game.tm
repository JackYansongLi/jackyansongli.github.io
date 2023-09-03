<TeXmacs|2.1>

<style|generic>

<\body>
  <doc-data|<doc-title|Normal-Form Game Formulation for Overcooked>>

  <section|Policy Set Construction>

  A two-player Markov game can be defined as
  <math|<around*|(|S,A<rsub|joint>=A<rsup|<around*|(|1|)>><rsub|>\<times\>A<rsup|<around*|(|2|)>>,P,R|)>>,
  where <math|S> represents the state space, and <math|A<rsub|joint>> is the
  joint action space composed of two individual action spaces
  <math|A<rsup|<around*|(|1|)>><rsub|>> and <math|A<rsup|<around*|(|2|)>>>.
  The transition kernel <math|P> and the reward function <math|R> are defined
  as follows:\ 

  <\equation*>
    P:S\<times\>A<rsub|joint>\<rightarrow\>S<space|1em>R:S\<times\>A<rsub|joint>\<rightarrow\>\<bbb-R\><rsub|+>.
  </equation*>

  <\remark>
    We only consider deterministic transition in this scenario.
  </remark>

  To reformulate this problem as a two-player normal-form game, let's denote
  <math|S=<around*|{|s<rsub|1>,s<rsub|2>,s<rsub|3>,\<ldots\>,s<rsub|<around*|\||S|\|>>|}>>.

  <\definition>
    For player <math|<around*|(|k|)>>, a vector formulation for a
    deterministic policy <math|\<pi\><rsup|<around*|(|k|)>>> is a vector
    <math|\<Pi\><rsup|<around*|(|k|)>>> <math|>of size
    <math|<around*|\||S|\|>>. Each entry <math|i > of
    <math|\<Pi\><rsup|<around*|(|k|)>>> is represented as
    <math|<around*|[|\<Pi\><rsup|<around*|(|k|)>>|]><rsub|i>=\<pi\><rsup|<around*|(|k|)>><around*|(|s<rsub|i>|)>.>
    Furthermore, <math|\<Pi\><rsup|<around*|(|k|)>>\<in\>A<rsup|<around*|(|k|)>><rsup|<around*|\||S|\|>>>.
  </definition>

  A normal-form game reformulation of the two-player Markov game can be
  defined as:

  <\enumerate>
    <item>The two players in the Markov game remain the same, indexed by
    <math|<around*|(|1|)>> and <math|<around*|(|2|)>>.

    <item>The set of strategies for each player is defined as
    <math|A<rsup|<around*|(|k|)>><rsup|<around*|\||S|\|>>>.

    <item>The payoff <math|R<rsub|normal>:A<rsup|<around*|(|1|)>><rsup|<around*|\||S|\|>>\<times\>A<rsup|<around*|(|2|)>><rsup|<around*|\||S|\|>>\<rightarrow\>\<bbb-R\><rsub|+>>
    for both player is the same, defined as\ 

    <\equation*>
      R<rsub|normal><around*|(|\<Pi\><rsup|<around*|(|1|)>>,\<Pi\><rsup|<around*|(|2|)>>|)>=<above|<below|<big|sum>|t=1>|\<infty\>>R<around*|(|s<rsup|t>,\<pi\><rsup|<around*|(|1|)>><around*|(|s<rsup|t>|)>,\<pi\><rsup|<around*|(|2|)>><around*|(|s<rsup|t>|)>|)>=<above|<below|<big|sum>|t=1>|\<infty\>>R<around*|(|s<rsup|t>,1<rsub|s<rsup|t>><rsup|\<top\>>\<Pi\><rsup|<around*|(|1|)>>,1<rsub|s<rsup|t>><rsup|\<top\>>\<Pi\><rsup|<around*|(|2|)>>|)>,
    </equation*>

    where <math|s<rsup|t>> is the state at time <math|t>,
    <math|1<rsub|s<rsup|t>>> is a vector with entry <math|i> be
    <math|1<rsub|s<rsup|t>=s<rsub|i>>>, and
    <math|s<rsup|t+1>=P<around*|(|s<rsup|t>,1<rsub|s<rsup|t>><rsup|\<top\>>\<Pi\><rsup|<around*|(|1|)>>,1<rsub|s<rsup|t>><rsup|\<top\>>\<Pi\><rsup|<around*|(|2|)>>|)>>.
  </enumerate>

  Now, let us assume <math|A<rsup|<around*|(|1|)>>=A<rsup|<around*|(|2|)>>\<triangleq\>A>.
  We represent the set <math|A<rsup|><rsup|<around*|\||S|\|>>> with\ 

  <\equation*>
    A<rsup|><rsup|<around*|\||S|\|>>=<around*|{|\<Pi\><rsub|1>,\<Pi\><rsub|2>,\<ldots\>,\<Pi\><rsub|<around*|\||A|\|><rsup|<around*|\||S|\|>>>|}>.
  </equation*>

  The payoff matrix <math|\<cal-R\><rsub|normal>\<in\>\<bbb-R\><rsub|+><rsup|<around*|\||A|\|><rsup|<around*|\||S|\|>>\<times\><around*|\||A|\|><rsup|<around*|\||S|\|>>>>
  is defined as

  <\equation*>
    <around*|[|\<cal-R\><rsub|normal>|]><rsub|i,j>=R<rsub|normal><around*|(|\<Pi\><rsub|i>,\<Pi\><rsub|j>|)>=<above|<below|<big|sum>|t=1>|\<infty\>>R<around*|(|s<rsup|t>,1<rsub|s<rsup|t>><rsup|\<top\>>\<Pi\><rsub|i>,1<rsub|s<rsup|t>><rsup|\<top\>>\<Pi\><rsub|j>|)>.
  </equation*>

  To construct the set of all possible policies, we first need to determine
  the size of the state space and action space. Since the state space is a
  dictionary, we need to calculate the number of possible states, and since
  the action space is a tuple, we need to calculate the number of possible
  actions.

  In my simplified Overcooked environment, the state space consists of the
  following components:

  <\enumerate>
    <item>Player positions: <math|8> possible positions for each player
    (<math|3\<times\>3> grid), so <math|8\<times\>8 = 64> combinations.

    <item>Player orientations: <math|4> orientations for each player (up,
    down, left, right), so <math|4\<times\>4 = 16> combinations.

    <item>Player has food: <math|2> possibilities for each player (True or
    False), so <math|2\<times\>2 = 4> combinations.

    <item>Table has food: <math|2> possibilities (True or False), so <math|2>
    combinations.
  </enumerate>

  Total state space size: <math|<around*|\||S|\|>=64\<times\>16\<times\>4\<times\>2=8192>.
  Also, <math|<around*|\||A|\|>=4>. Thus,
  <math|<around*|\||A<rsup|<around*|\||S|\|>>|\|>=4<rsup|8192>>, which is too
  large.

  <section|Action Sequence Construction>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Normal-Form
      Game Formulation for Overcooked> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>