<TeXmacs|2.1.2>

<style|generic>

<\body>
  <section|>

  <subsection|Objective>

  <\definition>
    (Dec-POMDP)

    <\equation*>
      <around*|<left|(|-1>|S,A<rsub|joint>,P<rsub|T>,O<rsub|joint>,P<rsub|O>,R,h|<right|)|-1>>
    </equation*>
  </definition>

  <\remark>
    Optimal policies depend on each agent's entire history of observations
  </remark>

  <\remark>
    Even Dec-POMDP is known, planning is <strong|NEXP-complete>. \ \ 
  </remark>

  \;

  Alternative: MARL, non-stationarity, CTDE

  <\definition>
    (CTDE)\ 
  </definition>

  <hrule>

  <subsection|Subjective: Treat other agents as part of the environment>

  <\enumerate>
    <item>IPOMDP

    <item>Best-response model

    <item>Cognitive Hierarchies/ level-k reasoning
  </enumerate>

  <\question>
    \;

    <\enumerate>
      <item>Which prior over other agents?

      <item>What if other agents are just as adaptable as ours is?
    </enumerate>
  </question>

  <section|Theoretical Frameworks for AHT>

  <\definition>
    (Targeted Learning Criteria)

    <\enumerate>
      <item>Targeted Optimality\ 

      <item>Compatibility

      <item>Safety
    </enumerate>
  </definition>

  <subsection|>

  <\example>
    The grim-switch policy <math|\<phi\><rsub|i>> is not learnable
  </example>

  <\lemma>
    <math|\<phi\><rsub|i>\<nin\>>flexible partner
  </lemma>

  <\lemma>
    <math|Finite memory partner\<subset\>Flexible partner>
  </lemma>

  <\theorem>
    ficticious play parter <math|\<in\>> Flexible partner
  </theorem>

  <\definition>
    Open-ended partner: weaker than flexible partner
  </definition>

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
    <associate|auto-1|<tuple|1|1|../../../.Xmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-2|<tuple|1.1|1|../../../.Xmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-3|<tuple|1.2|1|../../../.Xmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-4|<tuple|2|1|../../../.Xmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-5|<tuple|2.1|?|../../../.Xmacs/texts/scratch/no_name_8.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Objective
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Subjective: Treat other
      agents as part of the environment <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Theoretical
      Frameworks for AHT> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>