<TeXmacs|2.1.1>

<style|notes>

<\body>
  <notes-header><chapter*|Independent Learning Notes>

  <section|Worst-case cost and worst-case regret cost>

  Consider a function <math|g<around*|(|x|)>\<triangleq\><below|max
  |y>f<around*|(|x,y|)>>. The optimization problem defined as

  <\equation>
    <below|minimize|x><space|1em>g<around*|(|x|)>\<equiv\><below|minimize|x><space|1em><below|max|y>f<around*|(|x,y|)>
  </equation>

  can be viewed as a worst-case optimization problem, and
  <math|g<around*|(|x|)>> is called <with|font-shape|italic|worst-case cost>.
  For example, <math|f<around*|(|x,y|)>> represents the time needed to drive
  a car from one place to another place, <math|x> represents the driver's
  policy (speed up or not, the choice of roads), and <math|y> represents it
  is raining or not. Then, <math|<below|max|y>f<around*|(|x,y|)>=f<around*|(|x,rain|)>>.
  Thus, <math|g<around*|(|x|)>> represents the time needed to drive a car
  from one place to another place in the worst case, i.e., raining days.

  Now, consider <math|g<rprime|'><around*|(|x|)>\<triangleq\><below|max|y><around*|(|f<around*|(|x,y|)>-<below|min|x<rprime|'>>f<around*|(|x<rprime|'>,y|)>|)>>.
  We call <math|g<rprime|'><around*|(|x|)>> the
  <with|font-shape|italic|worst-case regret cost>. Unlike worst-case cost,
  the regret cost mesures the maximum achivement <with|font-series|bold|it
  can be improved> in the past days. For example, if a driver cannot drive in
  the rainy days due to some reason. Then there is no difference between
  <math|f<around*|(|x,rain|)>> and <math|f<around*|(|x<rprime|'>,rain|)>> for
  any <math|x> and <math|x<rprime|'>>, which makes
  <math|g<rprime|'><around*|(|x|)>=0>. No cost at all! Because nothing can be
  improved in the worst-case.

  <section|An example that minimize regret cost leads to a better policy>

  \;

  Consider the function <math|f<around*|(|x,y|)>> as follows:

  <\equation*>
    <block*|<tformat|<table|<row|<cell|>|<cell|>|<cell|x>|<cell|y>>|<row|<cell|>|<cell|<subtable|<tformat|<cwith|1|1|1|1|cell-hyphen|n>|<table|<row|<cell|>>>>>>|<cell|0>|<cell|1>>|<row|<cell|x>|<cell|0>|<cell|100>|<cell|0>>|<row|<cell|y>|<cell|1>|<cell|100>|<cell|99>>>>>.
  </equation*>

  \;

  The worst-case cost <math|g<around*|(|x|)>> in this example is
  <math|<below|max|y>f<around*|(|x,y|)>=f<around*|(|x,0|)>=100> for any
  <math|x>. Thus,

  <\equation>
    arg<below|min|x>g<around*|(|x|)>=0\<vee\>1.
  </equation>

  But for the worst-case regret cost <math|g<rprime|'><around*|(|0|)>=0> and
  <math|g<rprime|'><around*|(|1|)>=99>. Thus

  <\equation>
    arg<below|min|x>g<rprime|'><around*|(|x|)>=0.
  </equation>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1|..\\..\\..\\AppData\\Roaming\\TeXmacs\\texts\\scratch\\no_name_2.tm>>
    <associate|auto-2|<tuple|1|1|..\\..\\..\\AppData\\Roaming\\TeXmacs\\texts\\scratch\\no_name_2.tm>>
    <associate|auto-3|<tuple|2|1|..\\..\\..\\AppData\\Roaming\\TeXmacs\\texts\\scratch\\no_name_2.tm>>
    <associate|auto-4|<tuple|3|2|..\\..\\..\\AppData\\Roaming\\TeXmacs\\texts\\scratch\\no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      vapnik_overview_1999

      shalev-shwartz_online_2011-1
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Why
      using regret in online learning> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      1.<space|2spc>Worst-case cost and worst-case regret cost
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      2.<space|2spc>An example that minimize regret cost leads to a better
      policy <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      3.<space|2spc>Why using regret in online learning?
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>
    </associate>
  </collection>
</auxiliary>