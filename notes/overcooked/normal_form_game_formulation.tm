<TeXmacs|2.1.2>

<style|generic>

<\body>
  <doc-data|<doc-title|Repeated Game Formulation>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<\author-email>
    yli340@uic.edu
  </author-email>>>>

  <section|Repeated Game Formulation for Deterministic MG>

  We consider a Markov game with a deterministic dynamics <math|f>, i.e,

  <\equation*>
    s<rsub|t+1>=f<around*|(|s<rsub|t>,a<rsub|t>,b<rsub|t>|)>,
  </equation*>

  where <math|s<rsub|t>\<in\>S>, <math|a<rsub|t>\<in\>A>, and
  <math|b<rsub|t>\<in\>B>. We separate the action space <math|A\<times\>B>
  into <math|A> and <math|B> to represent two players in this environment.
  The two player share a cost function <math|c> defined as a mapping map
  <math|S\<times\>A\<times\>B> into <math|<around*|[|0,1|]>>. We played the
  game <math|K> times, i.e., <math|K> episodes, on each episode the game ends
  at timestep <math|T>. We denote the actions taken by each player at episode
  <math|k> as vectors, i.e.,

  <\equation*>
    a<rsup|k>\<triangleq\><around*|(|a<rsup|k><rsub|1>,\<ldots\>,a<rsup|k><rsub|T>|)>\<in\>A<rsup|T>
  </equation*>

  and

  <\equation*>
    <with|font-series|bold|>b<rsup|k>\<triangleq\><around*|(|b<rsup|k><rsub|1>,\<ldots\>,b<rsup|k><rsub|T>|)>\<in\>B<rsup|T>.
  </equation*>

  The cumulative cost for episode <math|k> can further be defined as\ 

  <\equation*>
    <with|font|cal|C><around*|(|a<rsup|k>,b<rsup|k>|)>\<triangleq\><above|<below|<big|sum>|t=1>|T>c<around*|(|s<rsup|k><rsub|t>,a<rsup|k><rsub|t>,b<rsup|k><rsub|t>|)>,
  </equation*>

  where <math|s<rsub|t+1><rsup|k>=f<around*|(|s<rsub|t><rsup|k>,a<rsub|t><rsup|k>,b<rsub|t><rsup|k>|)>>
  and <math|s<rsub|1><rsup|k>=s<rsub|1>> for all <math|k>. We have
  reformulate the deterministic Markov game into a repeated game with action
  space <math|A<rsup|T>\<times\>B<rsup|T>> and cost function
  <math|<with|font|cal|C>>. In the next section, we will discuss the policy
  regret in our setting.

  <section|Policy Regret>

  Recall the policy regret defined in [Arora 2012] with loss function
  <math|c<rsub|k>>,

  <\equation>
    \<bbb-E\><around*|[|<above|<below|<big|sum>|k=1>|K>c<rsub|k><around*|(|a<rsub|1>,\<ldots\>,a<rsub|k>|)>|]>-<below|min|<wide|a|^>><above|<below|<big|sum>|k=1>|K>c<rsub|k><around*|(|<wide|a|^><rsub|1>,\<ldots\>,<wide|a|^><rsub|k>|)>,<label|eq:policy-regret>
  </equation>

  where <math|<wide|a|^>=<around*|(|<wide|a|^><rsub|1>,\<ldots\>,<wide|a|^><rsub|K>|)>>.
  In our case, we seek to minimize the dynamic regret defined as

  <\equation>
    \<bbb-E\><above|<below|<big|sum>|k=1>|K><with|font|cal|C><around*|(|a<rsup|k>,b<rsup|k>|)>-<below|min|<around*|(|<wide|a|^>,<wide|b|^>|)>><above|<below|<big|sum>|k=1>|K><with|font|cal|C><around*|(|<wide|a|^><rsup|k>,<wide|b|^><rsup|k>|)>,<label|eq:two-player-policy-regret>
  </equation>

  where <math|<around*|(|<wide|a|^>,<wide|b|^>|)>=<around*|(|<around*|(|<wide|a|^><rsup|1>,<wide|b|^><rsup|1>|)>,\<ldots\>,<around*|(|<wide|a|^><rsup|K>,<wide|b|^><rsup|K>|)>|)>>.

  <\question>
    Can we define <math|<with|font|cal|C><rsub|k><around*|(|a<rsup|k>|)>\<triangleq\><with|font|cal|C><around*|(|a<rsup|k>,b<rsup|k>|)>>,
    so the our policy regret defined in <eqref|eq:two-player-policy-regret>
    coincides with the policy regret defined in <eqref|eq:policy-regret>.
  </question>

  <\answer>
    No! <math|b<rsup|k>> depends on the choice of <math|a<rsup|k>> since the
    system states are affected by the joint actions. In a word,
    <math|<with|font|cal|C><around*|(|a<rsup|k>,b<rsup|k>|)>> and
    <math|<with|font|cal|C><around*|(|<wide|a|^><rsup|k>,<wide|b|^><rsup|k>|)>>
    is well-defined, but <math|<with|font|cal|C><around*|(|<wide|a|^><rsup|k>,b<rsup|k>|)>>
    is not.
  </answer>

  Here we try another way to look at the policy regret defined in [Arora
  2012] with loss function <math|c<rsub|t>>,

  <\equation>
    \<bbb-E\><around*|[|<above|<below|<big|sum>|t=1>|T>c<rsub|t><around*|(|a<rsub|1>,\<ldots\>,a<rsub|t>|)>|]>-<below|min|<wide|a|^>><above|<below|<big|sum>|t=1>|T>c<rsub|t><around*|(|<wide|a|^><rsub|1>,\<ldots\>,<wide|a|^><rsub|t>|)>,<label|eq:policy-regret-time>
  </equation>

  \;

  where <math|<wide|a|^>=<around*|(|<wide|a|^><rsub|1>,\<ldots\>,<wide|a|^><rsub|T>|)>>.
  The equation <eqref|eq:two-player-policy-regret> can be reformulated as\ 

  <\equation>
    \<bbb-E\><above|<below|<big|sum>|t=1>|T><with|font|cal|C><rsub|t><around*|(|a<rsub|t>,b<rsub|t>|)>-<below|min|<around*|(|<wide|a|^>,<wide|b|^>|)>><above|<below|<big|sum>|t=1>|T><with|font|cal|C><rsub|t><around*|(|<wide|a|^><rsup|><rsub|t>,<wide|b|^><rsub|t>|)>,<label|eq:two-player-policy-regret-time>
  </equation>

  where <math|<around*|(|<wide|a|^>,<wide|b|^>|)>=<around*|(|<around*|(|<wide|a<rsub|>|^><rsub|1><rsup|>,<wide|b|^><rsub|1>|)>,\<ldots\>,<around*|(|<wide|a|^><rsub|T>,<wide|b|^><rsub|T>|)>|)>>
  and

  <\equation*>
    <with|font|cal|C><rsub|t><around*|(|a<rsub|t>,b<rsub|t>|)>\<triangleq\><below|<big|sum>|k>c<around*|(|a<rsub|t><rsup|k>,b<rsub|t><rsup|k>|)>.
  </equation*>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|eq:policy-regret|<tuple|1|?>>
    <associate|eq:policy-regret-time|<tuple|3|?>>
    <associate|eq:two-player-policy-regret|<tuple|2|?>>
    <associate|eq:two-player-policy-regret-time|<tuple|4|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Repeated
      Game Formulation for Deterministic MG>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Policy
      Regret> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>