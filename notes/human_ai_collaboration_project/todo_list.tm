<TeXmacs|2.1.2>

<style|generic>

<\body>
  <doc-data|<doc-title|TODO List>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>>>>

  <section|Regret Analysis>

  Revisit the analysis of MEX algorithm with finite hypothesis set (while the
  true policy is in an infinite hypothesis set), check the following stuffs:

  <subsection|>

  <\equation*>
    Reg<around*|(|K|)>=log<around*|(|<around*|\||\<cal-H\><rsub|inf>|\|>|)><sqrt|K>.
  </equation*>

  Reduct <math|\<cal-H\><rsub|inf>> into <math|\<cal-H\>>,
  <math|<around*|\||\<cal-H\>|\|>\<less\>\<infty\>>,

  <\equation*>
    Reg<around*|(|K|)>=log<around*|(|<around*|\||\<cal-H\>|\|>|)><sqrt|K>+K\<varepsilon\><rsub|\<psi\>>.
  </equation*>

  Directly apply MEX on <math|\<cal-H\>> gives

  <\equation*>
    Reg<around*|(|K|)>=log<around*|(|<around*|\||n<rsub|type><around*|(|\<cal-H\>|)>|\|>|)><sqrt|K>+K\<varepsilon\><rsub|\<psi\>>.
  </equation*>

  <section|Algorithms>

  In theory, compare MEX algorithm with Q-UCB, MAB, MBRL-UCB, and optimistic
  posterior sampling. Few things need to be cared:

  <\enumerate>
    <item>Simply compare big-O notation may not lead to a desired result.

    <item>Try to constrcut some examples where MEX algorithm dominates (in
    the sense of regret) the above algorithms or MEX algorithm does not
    perform better than the above algorithms.
  </enumerate>

  <section|Certainty Equivalence Principle>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|2|1>>
    <associate|auto-4|<tuple|3|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Regret
      Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Algorithms>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Certainty
      Equivalence Principle> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>