<TeXmacs|2.1.2>

<style|generic>

<\body>
  <\lemma>
    <label|lem:argmax>If <math|a=argmax<rsub|x\<in\>\<cal-X\>>
    <around*|[|f<around*|(|x|)>+g<around*|(|x|)>|]>> and
    <math|b=argmax<rsub|x\<in\>\<cal-X\>> f<around*|(|x|)>>, then,
    <math|f<around*|(|b|)>\<geq\>f<around*|(|a|)>> and

    <\equation*>
      f<around*|(|b|)>-f<around*|(|a|)>\<leq\>g<around*|(|a|)>-g<around*|(|b|)>.
    </equation*>
  </lemma>

  <\proof>
    By definition,

    <\equation*>
      f<around*|(|a|)>+g<around*|(|a|)>\<geq\>f<around*|(|x|)>+g<around*|(|x|)>
    </equation*>

    for all <math|x\<in\>\<cal-X\>>. Let <math|x=b>, we have

    <\equation*>
      f<around*|(|a|)>+g<around*|(|a|)>\<geq\>f<around*|(|b|)>+g<around*|(|b|)>.
    </equation*>

    Rearranging the above formula gives us

    <\equation*>
      f<around*|(|b|)>-f<around*|(|a|)>\<leq\>g<around*|(|a|)>-g<around*|(|b|)>.
    </equation*>

    Similarly, by definition

    <\equation*>
      f<around*|(|b|)>\<geq\>f<around*|(|x|)>
    </equation*>

    for all <math|x\<in\>\<cal-X\>>. Let <math|x=a> gives
    <math|f<around*|(|b|)>\<geq\>f<around*|(|a|)>>
  </proof>

  It is well-known that an optimal policies for an infinite horizon MDP is
  stationary, i.e., the policy can be independent of time. In the following,
  we will show that when the time horizon is large enough, the cumulative
  reward of a finite MDP that adopts an optimal stationary policy for an
  infinite counterpart is close to the cumulative reward of a finite MDP that
  adopts an non-stationary policy of its own.

  An optimal stationary policy <math|<around*|(|\<mu\><rsub|\<infty\>>,\<pi\><rsub|\<infty\>>|)>>
  for an infinite counterpart is defined as

  <\equation*>
    <around*|(|\<mu\><rsub|\<infty\>>,\<pi\><rsub|\<infty\>>|)>=<below|argmax|<around*|(|\<mu\>,\<pi\>|)>\<in\>\<cal-U\>\<times\>\<Pi\>><space|1em>\<bbb-E\><rsub|a<rsup|k><rsub|t>\<sim\>\<mu\><around*|(|s<rsup|k><rsub|t>,t|)>,b<rsup|k><rsub|t>\<sim\>\<pi\><around*|(|s<rsup|k><rsub|t>,t|)>><around*|[|<big|sum><rsub|t=1><rsup|\<infty\>>\<gamma\><rsup|t-1>r<around*|(|s<rsup|k><rsub|t>,a<rsup|k><rsub|t>,b<rsup|k><rsub|t>|)>\<mid\>a<rsup|k><rsub|1>=a<rsub|1>|]>
  </equation*>

  and an optimal nonstationary policy <math|<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>>
  is defined as\ 

  <\equation*>
    <around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>=<below|argmax|<around*|(|\<mu\>,\<pi\>|)>\<in\>\<cal-U\>\<times\>\<Pi\>><space|1em>\<bbb-E\><rsub|a<rsup|k><rsub|t>\<sim\>\<mu\><around*|(|s<rsup|k><rsub|t>,t|)>,b<rsup|k><rsub|t>\<sim\>\<pi\><around*|(|s<rsup|k><rsub|t>,t|)>><around*|[|<big|sum><rsub|t=1><rsup|H>\<gamma\><rsup|t-1>r<around*|(|s<rsup|k><rsub|t>,a<rsup|k><rsub|t>,b<rsup|k><rsub|t>|)>\<mid\>a<rsup|k><rsub|1>=a<rsub|1>|]>
  </equation*>

  Thus, applying Lemma <reference|lem:argmax>, we have
  <math|V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>\<geq\>V<around*|(|\<mu\><rsub|\<infty\>>,\<pi\><rsub|\<infty\>>|)>>
  and

  <\equation*>
    V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<mu\><rsub|\<infty\>>,\<pi\><rsub|\<infty\>>|)>\<leq\>g<around*|(|\<mu\><rsub|\<infty\>>,\<pi\><rsub|\<infty\>>|)>-g<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>,
  </equation*>

  where

  <\equation*>
    g<around*|(|\<mu\>,\<pi\>|)>\<triangleq\>\<bbb-E\><rsub|a<rsup|k><rsub|t>\<sim\>\<mu\><around*|(|s<rsup|k><rsub|t>,t|)>,b<rsup|k><rsub|t>\<sim\>\<pi\><around*|(|s<rsup|k><rsub|t>,t|)>><around*|[|<big|sum><rsub|t=H+1><rsup|\<infty\>>\<gamma\><rsup|t-1>r<around*|(|s<rsup|k><rsub|t>,a<rsup|k><rsub|t>,b<rsup|k><rsub|t>|)>\<mid\>a<rsup|k><rsub|1>=a<rsub|1>|]>.
  </equation*>

  Since <math|r:S\<times\>A<rsup|2>\<rightarrow\><around*|[|0,1|]>>, we have

  <\equation*>
    V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<mu\><rsub|\<infty\>>,\<pi\><rsub|\<infty\>>|)>\<leq\>2<big|sum><rsub|t=H+1><rsup|\<infty\>>\<gamma\><rsup|t-1>=<frac|\<gamma\><rsup|H>|1-\<gamma\>>.
  </equation*>

  The distance <math|\<gamma\><rsup|H>/<around*|(|1-\<gamma\>|)>> will be
  small if <math|H> is large.

  \;

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
    <associate|lem:argmax|<tuple|1|?>>
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