<TeXmacs|2.1>

<style|generic>

<\body>
  <doc-data|<doc-title|Lipschitz Proof>>

  For any policy <math|\<pi\>\<in\>\<Pi\>>, define
  <math|<around*|\<\|\|\>|\<pi\>|\<\|\|\>><rsub|\<infty\>>> as\ 

  <\equation*>
    <around*|\<\|\|\>|\<pi\>|\<\|\|\>><rsub|\<infty\>>\<triangleq\>max<rsub|<around*|(|s,a|)>\<in\>S\<times\>A>\<pi\><around*|(|a\<mid\>s|)>.
  </equation*>

  Define a metric on <math|S> and <math|A> as\ 

  <\equation*>
    d<rsub|S><around*|(|s,s<rprime|'>|)>=<with|font|Bbb*|1><around*|(|s=s<rprime|'>|)>,<space|1em>d<rsub|A><around*|(|a,a<rprime|'>|)>=<with|font|Bbb*|1><around*|(|a=a<rprime|'>|)>,
  </equation*>

  and\ 

  <\equation*>
    d<rsub|S\<times\>A><around*|(|<around*|(|s,a|)>,<around*|(|s<rprime|'>,a<rprime|'>|)>|)>=d<rsub|S><around*|(|s,s<rprime|'>|)>+d<rsub|A><around*|(|s,s<rprime|'>|)>.
  </equation*>

  Now fix <math|\<mu\>\<in\>\<cal-U\>>, define

  <\equation*>
    \<bbb-P\><rsub|\<mu\>><around*|(|\<cdot\>\<mid\>s,a|)>\<triangleq\>\<bbb-P\><around*|(|\<cdot\>\<mid\>s,\<mu\><around*|(|s|)>,a|)>
  </equation*>

  and

  <\equation*>
    r<rsub|\<mu\>>\<triangleq\>r<around*|(|s,\<mu\><around*|(|s|)>,a|)>.
  </equation*>

  It is easy to verify that the following inequalities holds:

  <\equation>
    \<forall\><around*|(|s,s<rprime|'>,a,a<rprime|'>|)>\<in\>S<rsup|2>\<times\>A<rsup|2>,<space|2em>\<cal-K\><around*|(|\<bbb-P\><rsub|\<mu\>><around*|(|\<cdot\>\<mid\>s,a|)>,\<bbb-P\><rsub|\<mu\>><around*|(|\<cdot\>\<mid\>s<rprime|'>,a<rprime|'>|)>|)>\<leq\>d<rsub|S\<times\>A><around*|(|<around*|(|s,a|)>,<around*|(|s<rprime|'>,a<rprime|'>|)>|)>,<label|eq:lip-prob>
  </equation>

  and

  <\equation>
    \<forall\><around*|(|s,s<rprime|'>,a,a<rprime|'>|)>\<in\>S<rsup|2>\<times\>A<rsup|2>,<space|2em><around*|\||r<rsub|\<mu\>><around*|(|s,a|)>-r<rsub|\<mu\>><around*|(|s<rprime|'>,a<rprime|'>|)>|\|>\<leq\>d<rsub|S\<times\>A><around*|(|<around*|(|s,a|)>,<around*|(|s<rprime|'>,a<rprime|'>|)>|)>.<label|eq:lip-reward>
  </equation>

  The term <math|\<cal-K\>> is the Kantorovich metric defined as\ 

  <\equation*>
    \<cal-K\><around*|(|p,q|)>=sup<rsub|f><around*|{|<around*|\||<big|sum><rsub|i=1><rsup|<around*|\||S|\|>>f<around*|(|s<rsub|i>|)><around*|(|p<rsub|i>-q<rsub|i>|)>|\|>:<around*|\<\|\|\>|f|\<\|\|\>><rsub|L>\<leq\>1|}>,
  </equation*>

  where <math|p\<in\>\<Delta\><around*|(|S|)>>,
  <math|q\<in\>\<Delta\><around*|(|S|)>>, and
  <math|f:S\<rightarrow\>\<bbb-R\>>. The constrain
  <math|<around*|\<\|\|\>|f|\<\|\|\>><rsub|L>\<leq\>1> means that the
  function <math|f> is <math|1-Lipschitz>, i.e.,

  <\equation*>
    <around*|\||f<around*|(|s|)>-f<around*|(|s<rprime|'>|)>|\|>\<leq\>d<rsub|S><around*|(|s,s<rprime|'>|)>
  </equation*>

  for all <math|s>, <math|s<rprime|'>\<in\>S>. Inequalities
  <eqref|eq:lip-prob> and <eqref|eq:lip-reward> implies that the MDP defined
  by <math|<around*|(|S,A,\<gamma\>,\<bbb-P\><rsub|\<mu\>>,r<rsub|\<mu\>>|)>>,
  is a <math|<around*|(|1,1|)>>-Lipschitz continous MDP. Also, the following
  inequalities holds:

  <\equation*>
    \<forall\><around*|(|s,s<rprime|'>|)>\<in\>S<rsup|2>,<space|2em>\<cal-K\><around*|(|\<pi\><around*|(|\<cdot\>\<mid\>s|)>,\<pi\><around*|(|\<cdot\>\<mid\>s<rprime|'>|)>|)>\<leq\>d<rsub|S><around*|(|s,s<rprime|'>|)>,
  </equation*>

  and

  <\equation*>
    \<forall\>s\<in\>S,<space|1em>\<forall\><around*|(|\<pi\>,\<pi\><rprime|'>|)>\<in\>\<Pi\><rsup|2>,<space|2em>\<cal-K\><around*|(|\<pi\><around*|(|\<cdot\>\<mid\>s|)>,\<pi\><rprime|'><around*|(|\<cdot\>\<mid\>s|)>|)>\<leq\>
    d<rsub|\<Pi\>><around*|(|\<pi\>,\<pi\><rprime|'>|)>.
  </equation*>

  where <math|d<rsub|\<Pi\>><around*|(|\<pi\>,\<pi\><rprime|'>|)>\<triangleq\><around*|\<\|\|\>|\<pi\>-\<pi\><rprime|'>|\<\|\|\>><rsub|\<infty\>>>.
  Now, applying Proposition 1, Lemma 2 and Lemma <math|3> in
  <cite|pirotta_policy_2015> gives us

  <\equation*>
    <around*|\||V<around*|(|\<mu\>,\<pi\>|)>-V<around*|(|\<mu\>,\<pi\><rprime|'>|)>|\|>\<leq\><frac|1|1-\<gamma\>><around*|(|<around*|\<\|\|\>|\<pi\>-\<pi\><rprime|'>|\<\|\|\>><rsub|\<infty\>>+<frac|2\<gamma\>|1-\<gamma\>><around*|\<\|\|\>|\<pi\>-\<pi\><rprime|'>|\<\|\|\>><rsub|\<infty\>>|)>.
  </equation*>

  <\bibliography|bib|tm-plain|reference>
    <\bib-list|1>
      <bibitem*|1><label|bib-pirotta_policy_2015>Matteo Pirotta, Marcello
      Restelli<localize|, and >Luca Bascetta. <newblock>Policy gradient in
      Lipschitz Markov Decision Processes.
      <newblock><with|font-shape|italic|Mach Learn>, 100(2):255\U283, sep
      2015.<newblock>
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
    <associate|auto-1|<tuple|2|1>>
    <associate|bib-pirotta_policy_2015|<tuple|1|1>>
    <associate|eq:lip-prob|<tuple|1|1>>
    <associate|eq:lip-reward|<tuple|2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      pirotta_policy_2015
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>