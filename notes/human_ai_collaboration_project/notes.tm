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
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>