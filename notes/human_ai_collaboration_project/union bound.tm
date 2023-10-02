<TeXmacs|2.1>

<style|generic>

<\body>
  <doc-data|<doc-title|Union Bound Tutorial>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|Union Bound>

  <\lemma>
    \;

    <\equation*>
      \<bbb-P\><around*|(|f<rsub|s>\<leq\>log<frac|1|\<delta\>>|)>\<geq\>1-\<delta\>\<Rightarrow\>\<bbb-P\><around*|(|<big|cap><rsub|h>f<rsub|s>\<leq\>log<frac|<around*|\||H|\|>|\<delta\>>|)>\<geq\>1-\<delta\>
    </equation*>
  </lemma>

  <\proof>
    \;

    <\equation*>
      \<bbb-P\><around*|(|f<rsub|s>\<leq\>log<frac|1|\<delta\>>|)>\<geq\>1-\<delta\>\<Leftrightarrow\>\<bbb-P\><around*|(|f<rsub|s>\<gtr\>log<frac|1|\<delta\>>|)>\<leq\>\<delta\>
    </equation*>

    and

    <\equation*>
      \<bbb-P\><around*|(|f<rsub|s>\<gtr\>log<frac|1|\<delta\>>|)>\<leq\>\<delta\>\<Leftrightarrow\>\<bbb-P\><around*|(|f<rsub|s>\<gtr\>log<frac|<around*|\||H|\|>|\<delta\>>|)>\<leq\><frac|\<delta\>|<around*|\||H|\|>>\<Leftrightarrow\><around*|\||S|\|>\<bbb-P\><around*|(|f<rsub|s>\<gtr\>log<frac|<around*|\||H|\|>|\<delta\>>|)>\<leq\>\<delta\>.
    </equation*>

    Thus,

    <\equation*>
      <around*|\||H|\|>\<bbb-P\><around*|(|f<rsub|s>\<gtr\>log<frac|<around*|\||H|\|>|\<delta\>>|)>\<leq\>\<delta\>\<Leftrightarrow\><big|sum><rsub|h>\<bbb-P\><around*|(|f<rsub|s>\<gtr\>log<frac|<around*|\||H|\|>|\<delta\>>|)>\<leq\>\<delta\>\<Rightarrow\>\<bbb-P\><around*|(|<big|cup><rsub|h>f<rsub|s>\<gtr\>log<frac|<around*|\||H|\|>|\<delta\>>|)>\<leq\>\<delta\>
    </equation*>

    \;

    \;
  </proof>

  <\lemma>
    for all <math|\<pi\>\<in\>\<cal-H\><rsub|i>>,

    <\equation*>
      \<bbb-P\><around*|(|f<around*|(|\<pi\>|)>\<leq\>log<around*|(|<frac|<around*|\||\<cal-H\><rsub|i>|\|>|\<delta\>>|)>|)>\<geq\>1-\<delta\>.
    </equation*>

    If <math|<around*|\||\<cal-H\><rsub|i>|\|>=<around*|\||\<cal-H\><rsub|j>|\|>=n<around*|(|\<cal-H\>|)>>
    for all <math|i>, <math|j>, then for all
    <math|\<pi\>\<in\><big|cup><rsub|i>\<cal-H\><rsub|i>>,

    <\equation*>
      \<bbb-P\><around*|(|f<around*|(|\<pi\>|)>\<leq\>log<around*|(|<frac|n<around*|(|\<cal-H\>|)>|\<delta\>>|)>|)>\<geq\>1-\<delta\>.
    </equation*>
  </lemma>

  <\proof>
    We have

    <\equation*>
      \<bbb-P\><around*|(|<big|cup><rsub|\<pi\>\<in\>\<cal-H\><rsub|i>>f<around*|(|\<pi\>|)>\<gtr\>log<around*|(|<frac|<around*|\||\<cal-H\><rsub|i>|\|>|\<delta\>>|)>|)>\<leq\>\<delta\>\<Leftrightarrow\>\<bbb-P\><around*|(|<big|cup><rsub|\<pi\>\<in\>\<cal-H\><rsub|i>>f<around*|(|\<pi\>|)>\<gtr\>log<around*|(|<frac|n<around*|(|\<cal-H\>|)>|\<delta\>>|)>|)>\<leq\>\<delta\>.
    </equation*>

    \;

    \;

    \;
  </proof>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-2|<tuple|1.1|1|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Union
      Bound> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>
    </associate>
  </collection>
</auxiliary>