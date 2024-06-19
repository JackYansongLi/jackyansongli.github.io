<TeXmacs|2.1.2>

<style|<tuple|generic|no-page-numbers|reduced-margins>>

<\body>
  <doc-data|<doc-title|Experiment>>

  <section|Toy case>

  The agent always receives a <math|0> reward unless reaches state
  <math|<around*|\||S|\|>> during <math|<with|font-family|tt|simulate>>.

  Consider use the UCB-like exploration strategy

  Bug:

  <\itemize>
    <item><with|font-family|tt|mapping{}> should not be created inside the
    <with|font-family|tt|simulate> function.
  </itemize>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|page-screen-margin|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../../../../Application
    Support/XmacsLabs/texts/scratch/no_name_10.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Toy
      case> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>