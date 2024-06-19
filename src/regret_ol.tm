<TeXmacs|2.1.2>

<style|notes>

<\body>
  <notes-header><chapter*|Why using regret in online learning>

  Regret analysis is broadly adopted in learning with online interactions.
  However, why using regret minimization instead of cost minimization as in
  other learning tasks such as batch learning? In this short note, we will
  give an example that by minimizing the regret, the learner gets a better
  reward.

  <section|Worst-case cost and worst-case regret cost>

  Consider the function <math|g> defined as
  <math|g<around*|(|x|)>\<triangleq\><below|max. |y>f<around*|(|x,y|)>>,
  where <math|f> is an arbitrary function. The optimization problem defined
  as

  <\equation>
    <below|min.|x><space|1em>g<around*|(|x|)>\<equiv\><below|min.|x><space|1em><below|max.|y>f<around*|(|x,y|)>
  </equation>

  can be viewed as a worst-case optimization problem, and
  <math|g<around*|(|x|)>> is called <with|font-shape|italic|worst-case cost>.

  Let's consider a scenario where we have <math|f<around*|(|x,y|)>> that
  represents the time required to drive a car from one location to another
  given policy <math|x> and environment <math|y>. In this context, <math|x>
  represents the driver's driving pattern, which encompass decisions like
  adjusting speed, selecting lanes (left or right), and other driving
  strategies. On the other hand, <math|y> represents a binary condition
  indicating whether it's currently raining (<math|y = 1>) or not (<math|y =
  0>). Together, this function captures how the driver's decisions and
  weather conditions collectively impact the time it takes for the journey.

  It's a widely acknowledged fact that driving takes more time on days when
  it's raining. Thus, <math|<below|max.|y>f<around*|(|x,y|)>=f<around*|(|x,1|)>>.
  By definition, the function <math|g<around*|(|x|)>> currently represents
  the time required for driving on rainy days.

  Now, define <math|g<rprime|'><around*|(|x|)>\<triangleq\><below|max|y><around*|(|f<around*|(|x,y|)>-<below|min|x<rprime|'>>f<around*|(|x<rprime|'>,y|)>|)>>.
  We call <math|g<rprime|'><around*|(|x|)>> the
  <with|font-shape|italic|worst-case regret cost>. Unlike worst-case cost,
  the regret cost measures the maximum achievement <with|font-series|bold|it
  can be improved> in the past days. For example, if a driver cannot drive in
  the rainy day due to rheumatoid arthritis. Then there is no difference
  between <math|f<around*|(|x,rain|)>> and
  <math|f<around*|(|x<rprime|'>,rain|)>> for any <math|x> and
  <math|x<rprime|'>>, which makes <math|g<rprime|'><around*|(|x|)>=0>. No
  regret at all! Because nothing can be improved in the worst-case.

  <section|An example that minimizes regret cost results in a better policy>

  Consider the function <math|f<around*|(|x,y|)>> as follows:

  <\equation*>
    <block*|<tformat|<table|<row|<cell|>|<cell|>|<cell|x>|<cell|y>>|<row|<cell|>|<cell|<subtable|<tformat|<cwith|1|1|1|1|cell-hyphen|n>|<table|<row|<cell|>>>>>>|<cell|0>|<cell|1>>|<row|<cell|x>|<cell|0>|<cell|100>|<cell|0>>|<row|<cell|y>|<cell|1>|<cell|100>|<cell|99>>>>>.
  </equation*>

  \;

  The worst-case cost <math|g<around*|(|x|)>> in this example is
  <math|<below|max|y>. f<around*|(|x,y|)>=f<around*|(|x,0|)>=100> for any
  <math|x>. Thus,

  <\equation>
    arg<below|min|x> g<around*|(|x|)>=0\<vee\>1.
  </equation>

  But for the worst-case regret cost, <math|g<rprime|'><around*|(|0|)>=0> and
  <math|g<rprime|'><around*|(|1|)>=99>. Thus

  <\equation>
    arg<below|min|x> g<rprime|'><around*|(|x|)>=0.
  </equation>

  <section|Data correlation>

  The fundamental assumption of standard offline machine learning is that the
  collected data are independently and identically distributed, stemming from
  an unknown distribution <cite|vapnik_overview_1999>. However, this
  assumption can be easily compromised in the realm of online learning
  <cite|shalev-shwartz_online_2011-1>. For instance, let's reconsider a
  scenario involving a driver who refrains from driving on rainy days. In
  this case, data points (representing the time taken to travel between
  places) within a one-hour time-frame might have a probability of collection
  as low as <math|0>. Conversely, data points beyond one hour might possess a
  probability of collection greater than <math|0>. This implies that data
  collected on different dates adhere to distinct distributions. This
  distinction underscores a crucial difference between traditional offline
  learning and online learning.

  <\bibliography|bib|tm-plain|OL>
    <\bib-list|2>
      <bibitem*|1><label|bib-shalev-shwartz_online_2011-1>Shai
      Shalev-Shwartz. <newblock>Online Learning and Online Convex
      Optimization. <newblock><with|font-shape|italic|Foundations and Trends
      in Machine Learning>, 4(2):107\U194, 2011.<newblock>

      <bibitem*|2><label|bib-vapnik_overview_1999>V.N.<nbsp>Vapnik.
      <newblock>An overview of statistical learning theory.
      <newblock><with|font-shape|italic|IEEE Transactions on Neural
      Networks>, 10(5):988\U999, sep 1999.<newblock>
    </bib-list>
  </bibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|1|1>>
    <associate|auto-3|<tuple|2|2>>
    <associate|auto-4|<tuple|3|2>>
    <associate|auto-5|<tuple|3|3>>
    <associate|bib-shalev-shwartz_online_2011-1|<tuple|1|3>>
    <associate|bib-vapnik_overview_1999|<tuple|2|3>>
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

      2.<space|2spc>An example that minimizes regret cost results in a better
      policy <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      3.<space|2spc>Data correlation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>