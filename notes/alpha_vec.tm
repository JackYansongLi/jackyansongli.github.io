<TeXmacs|2.1.2>

<style|<tuple|generic|no-page-numbers|reduced-margins>>

<\body>
  <\itemize>
    <item>Infinite-horizon MDP: stationary state-dependent, i.e.,
    <math|\<pi\><rsup|\<ast\>>:S\<rightarrow\>\<Delta\><around*|(|A|)>>.

    <item>Finite-horizon MDP: non-stationary state-dependent, i.e.,
    <math|\<pi\><rsup|\<ast\>>:S\<times\><around*|[|H|]>\<rightarrow\>\<Delta\><around*|(|A|)>>.

    <item>POMDP: History-dependent: <math|\<pi\><rsup|\<ast\>>:\<bbb-H\>\<rightarrow\>\<Delta\><around*|(|A|)>>,
    where <math|\<bbb-H\>=<around*|(|S\<times\>A\<times\>S|)><rsup|H-1>>.\ 
  </itemize>

  <section|<math|\<alpha\>>-vector>

  <\definition>
    A belief state <math|b> is a probability distribution on state space
    <math|b\<in\>\<Delta\><around*|(|S|)>>. For finite state space,
    <math|b\<in\><around*|[|0,1|]><rsup|S>>. Thus,
    <math|b<around*|(|s|)>\<in\><around*|[|0,1|]>>.
    <math|<big|int><rsub|s\<in\>S>b<around*|(|s|)>d s=1>.
  </definition>

  <\theorem>
    Consider the value function for a history-dependent policy <math|\<pi\>>
    defined as

    <\equation*>
      V<around*|(|\<pi\>|)><around*|(|s|)>\<triangleq\>\<bbb-E\><around*|(|<big|sum><rsub|h=1><rsup|\<infty\>>r<around*|(|s<rsub|h>,a<rsub|h>|)>\<mid\>s<rsub|1>=s,s<rsub|h+1>\<sim\>\<bbb-P\><around*|(|s<rsub|h>,a<rsub|h>|)>,a<rsub|h>\<sim\>\<pi\><around*|(|\<tau\><rsub|h>|)>|)>.
    </equation*>

    There exists <math|\<alpha\>>-vector,
    <math|\<alpha\>\<in\>\<bbb-R\><rsup|S>> such that

    <\equation*>
      V<around*|(|\<pi\>|)><around*|(|s|)><above|=|rep><big|int><rsub|s\<in\>S>\<alpha\><rsub|s>
      b<around*|(|s|)> d s.
    </equation*>
  </theorem>

  <em|Goal>: update <math|\<alpha\>>-vector\ 
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|page-screen-margin|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../Library/Application
    Support/XmacsLabs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc><with|mode|<quote|math>|\<alpha\>>-vector>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>