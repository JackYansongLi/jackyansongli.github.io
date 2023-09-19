<TeXmacs|2.1.2>

<style|generic>

<\body>
  <section|Best stationary policy is close to optimal policy when time
  horizon is large>

  <\equation*>
    V<rsup|\<ast\>><around*|(|\<pi\><rsup|\<ast\>><rsub|\<infty\>>|)>\<triangleq\>V<rsup|\<ast\>><rsub|\<infty\>>
  </equation*>

  <\equation*>
    \<gamma\>\<less\>1,H=\<infty\>:station poli opt
  </equation*>

  <\equation*>
    \<gamma\>\<less\>1,H\<less\>\<infty\>:<around*|(|\<pi\><rsub|0>,\<pi\><rsub|1>,\<ldots\>|)>
  </equation*>

  <\equation*>
    V<rsub|fin><rsup|\<ast\>><around*|(|\<pi\>|)>\<triangleq\>\<bbb-E\><around*|[|<big|sum><rsub|h=0><rsup|H>r<rsub|h><around*|(|s<rsub|h>,a<rsub|h>|)>|]>
  </equation*>

  <\equation*>
    V<rsub|fin><rsup|\<ast\>><around*|(|\<pi\>|)>\<triangleq\>max<rsub|\<pi\>\<in\>\<Pi\><rsub|NS>>V<rsub|fin><rsup|*\<ast\>><around*|(|\<pi\>|)>
  </equation*>

  <\equation*>
    V<rsub|fin><rsup|\<ast\>><around*|(|<around*|(|\<pi\><rsub|\<infty\>><rsup|\<ast\>>,\<pi\><rsub|\<infty\>><rsup|\<ast\>>,\<ldots\>|)>|)>\<geq\>V<rsub|fin><rsup|\<ast\>>-\<gamma\><rsup|H>
  </equation*>

  It is well-known that an optimal policies for an infinite horizon MDP is
  stationary, i.e., the policy can be independent of time. In the following,
  we will show that when the time horizon is large enough, the cumulative
  reward of a finite MDP that adopts an optimal stationary policy for an
  infinite counterpart is close to the cumulative reward of a finite MDP that
  adopts an non-stationary policy of its own.

  \;

  <\proposition>
    \;
  </proposition>

  <\proof>
    \;

    An optimal stationary policy <math|<around*|(|\<mu\><rsub|\<infty\>>,\<pi\><rsub|\<infty\>>|)>>
    for an infinite counterpart is defined as

    <\equation*>
      <around*|(|\<mu\><rsub|\<infty\>>,\<pi\><rsub|\<infty\>>|)>=<below|argmax|<around*|(|\<mu\>,\<pi\>|)>\<in\>\<cal-U\>\<times\>\<Pi\>><space|1em>\<bbb-E\><rsub|a<rsup|k><rsub|t>\<sim\>\<mu\><around*|(|s<rsup|k><rsub|t>,t|)>,b<rsup|k><rsub|t>\<sim\>\<pi\><around*|(|s<rsup|k><rsub|t>,t|)>><around*|[|<big|sum><rsub|t=1><rsup|\<infty\>>\<gamma\><rsup|t-1>r<around*|(|s<rsup|k><rsub|t>,a<rsup|k><rsub|t>,b<rsup|k><rsub|t>|)>\<mid\>a<rsup|k><rsub|1>=a<rsub|1>|]>
    </equation*>

    and an optimal nonstationary policy <math|<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>>
    is defined as\ 

    <\equation*>
      <around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>=<below|argmax|<around*|(|\<mu\>,\<pi\>|)>><space|1em>\<bbb-E\><rsub|a<rsup|k><rsub|t>\<sim\>\<mu\><around*|(|s<rsup|k><rsub|t>,t|)>,b<rsup|k><rsub|t>\<sim\>\<pi\><around*|(|s<rsup|k><rsub|t>,t|)>><around*|[|<big|sum><rsub|t=1><rsup|H>\<gamma\><rsup|t-1>r<around*|(|s<rsup|k><rsub|t>,a<rsup|k><rsub|t>,b<rsup|k><rsub|t>|)>\<mid\>a<rsup|k><rsub|1>=a<rsub|1>|]>
    </equation*>

    Thus,\ 

    <\align>
      <tformat|<table|<row|<cell|V<around*|(|\<mu\><rsub|\<infty\>>,\<pi\><rsub|\<infty\>>|)>=>|<cell|\<bbb-E\><rsub|a<rsup|k><rsub|t>\<sim\>\<mu\><rsub|\<infty\>><around*|(|s<rsup|k><rsub|t>,t|)>,b<rsup|k><rsub|t>\<sim\>\<pi\><rsub|\<infty\>><around*|(|s<rsup|k><rsub|t>,t|)>><around*|[|<big|sum><rsub|t=1><rsup|H>\<gamma\><rsup|t-1>r<around*|(|s<rsup|k><rsub|t>,a<rsup|k><rsub|t>,b<rsup|k><rsub|t>|)>\<mid\>a<rsup|k><rsub|1>=a<rsub|1>|]>>>>>
    </align>

    \;
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
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Best
      stationary policy is close to optimal policy when time horizon is
      large> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>