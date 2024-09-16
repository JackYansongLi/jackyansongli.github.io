<TeXmacs|2.1.2>

<style|<tuple|generic|no-page-numbers|reduced-margins>>

<\body>
  <doc-data|<doc-title|Title>|<doc-author|<author-data|<author-name|Zheming
  Liu>|<author-email|>|<\author-affiliation>
    Stony Brook University
  </author-affiliation>>>>

  <section|Problem formulation>

  Consider the following minimax optimization problem

  <\equation*>
    <below|min.|x\<in\>\<cal-X\>> <space|1em>max<rsub|y\<in\>\<cal-Y\>>
    f<around*|(|x,y|)>.<label|eq:minimaxopt>
  </equation*>

  Denote the saddle point of <eqref|eq:minimaxopt> as
  <math|<around*|(|x<rsup|\<ast\>>,y<rsup|\<ast\>>|)>>. Denote
  <math|g<rsub|0><around*|(|x,y|)>> as a distribution over
  <math|\<cal-X\>\<times\>\<cal-Y\>>. The goal is to update <math|g<rsub|k>>
  such that

  <\equation*>
    g<rsub|k,l><around*|(|x,y|)>\<rightarrow\>g<rsup|\<ast\>>\<triangleq\>\<delta\><rsub|<around*|(|x<rsup|\<ast\>>,y<rsup|\<ast\>>|)>>.
  </equation*>

  Consider an natural exponential family, the goal may not be satisfied.

  <section|Algorithm>

  <\enumerate>
    <item>Initialize a NEF <math|<around*|{|f<rsub|\<theta\>><around*|(|\<cdot\>,\<cdot\>|)>|}><rsub|\<theta\>\<in\>\<Theta\>><rsub|>>.
    Choose an initial p.d.f. <math|g<rsub|1,1>=f<rsub|\<theta\><rsub|1,1>>>
    on <math|\<cal-X\>\<times\>\<cal-Y\>>. A non-decreasing
    <with|color|red|what fuction?> function
    <math|\<varphi\>:\<bbb-R\>\<rightarrow\><around*|[|0,R|]>>. Choose
    <math|<around*|{|\<alpha\><rsub|k,l>|}>>

    <item>Compute\ 

    <\equation*>
      \<theta\><rsub|k,l+1>\<leftarrow\><below|argmin|\<theta\>\<in\>\<Theta\>>
      \<cal-D\><rsub|KL><around*|(|<wide|g|~><rsub|k,l+1>;f<rsub|\<theta\>>|)>
    </equation*>

    <\equation*>
      \<theta\><rsub|k+1,l>\<leftarrow\><below|argmin|\<theta\>\<in\>\<Theta\>>
      \<cal-D\><rsub|KL><around*|(|<wide|g|~><rsub|k,l+1>;f<rsub|\<theta\>>|)>
    </equation*>

    <item>If a stopping rule
  </enumerate>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|page-screen-margin|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|eq:minimaxopt|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Problem
      formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Algorithm>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>