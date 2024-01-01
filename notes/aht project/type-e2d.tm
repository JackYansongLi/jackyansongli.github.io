<TeXmacs|2.1.2>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>

    <\new-remark|ass>
      Assumption
    </new-remark>

    <\new-theorem|infhyp>
      Informal Hypothesis
    </new-theorem>

    <\new-theorem|hyp>
      Hypothesis
    </new-theorem>
  </hide-preamble>

  <doc-data|<doc-title|Type Analysis With Decision-Estimation
  Coefficient>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<\author-affiliation>
    <inactive*|>University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|Complexity Measure>

  <\def>
    <math|<around*|(|H,K,S,A,\<bbb-P\>,R,\<gamma\>,\<cal-H\>|)>>
  </def>

  <\def>
    <math|<around*|(|H,K,S,A,\<gamma\>,\<cal-F\>|)>>
  </def>

  <\def>
    <math|<around*|(|H,K,S,A,\<gamma\>,\<cal-F\><rsub|\<cal-H\>>|)>>
  </def>

  <\def>
    <math|<around*|(|H,K,S,A,\<gamma\>,\<cal-F\><rsub|\<psi\>,\<cal-H\>>|)>>
  </def>

  The current complexity measure for episodic MDP with a given hypothesis set
  of models can not be directly applied in our case.

  <\equation*>
    d<around*|(|H,K,S,A,\<gamma\>,\<cal-F\><rsub|\<psi\>,\<cal-H\>\<cup\>\<pi\><rprime|'>>|)>=Reg<around*|(|\<cal-H\>|)>-\<gamma\>D<rsub|H><around*|(|\<psi\>,\<cal-H\>|)>
  </equation*>

  <section|Decision-estimation coefficient>

  <\def>
    \;

    <\equation*>
      D<rsub|H><around*|(|\<pi\>,<wide|\<pi\>|\<bar\>>|)>\<triangleq\>D<rsub|H><around*|(|<around*|(|\<bbb-P\><rsub|\<pi\>>,R<rsub|\<pi\>>|)>,<around*|(|\<bbb-P\><rsub|<wide|\<pi\>|\<bar\>>>,R<rsub|<wide|\<pi\>|\<bar\>>>|)>|)>
    </equation*>
  </def>

  <\def>
    The decision-estimation coefficient <math|d<rsub|\<gamma\>><around*|(|\<cal-H\>|)>>
    is defined as <math|sup<rsub|<wide|\<pi\>|\<bar\>>\<in\>\<cal-H\>>
    d<rsub|\<gamma\>><around*|(|\<cal-H\>,<wide|\<pi\>|\<bar\>>|)>> such that

    <\equation*>
      d<rsub|\<gamma\>><around*|(|\<cal-H\>,<wide|\<pi\>|\<bar\>>|)>\<triangleq\>inf<rsub|p\<in\>\<Delta\><around*|(|\<cal-U\>|)>>sup<rsub|\<pi\>\<in\>\<cal-H\>>
      \<bbb-E\><rsub|\<mu\>\<sim\>p><around*|[|V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>-V<around*|(|\<mu\>,\<pi\>|)>-\<gamma\>\<cdot\>D<rsub|H><rsup|2><around*|(|\<pi\>,<wide|\<pi\>|\<bar\>>|)>|]>,
    </equation*>

    where <math|\<gamma\>\<gtr\>0> is a scale parameter and <math|D<rsub|H>>
    is the Hellinger distance.
  </def>

  <\proposition>
    For all <math|\<gamma\>\<gtr\>0>, <math|d<rsub|\<gamma\>><around*|(|\<cal-H\>\<cup\>\<pi\><rprime|'>|)>\<geq\>d<rsub|\<gamma\>><around*|(|\<cal-H\>|)>>
    for <math|\<pi\><rprime|'>> that satisfies:
    <math|\<exists\>\<pi\>\<in\>\<cal-H\>>, such that
    <math|\<pi\><above|\<sim\>|\<psi\>>\<pi\><rprime|'>>.
  </proposition>

  <\def>
    \;

    <\equation*>
      D<rsub|H><around*|(|\<psi\><around*|(|\<pi\>|)>,\<psi\><around*|(|<wide|\<pi\>|\<bar\>>|)>|)>\<triangleq\>D<rsub|H><around*|(|<around*|(|\<bbb-P\><rsub|\<psi\><around*|(|\<pi\>|)>>,R<rsub|\<psi\><around*|(|\<pi\>|)>>|)>,<around*|(|\<bbb-P\><rsub|\<psi\><around*|(|<wide|\<pi\>|\<bar\>>|)>>,R<rsub|\<psi\><around*|(|<wide|\<pi\>|\<bar\>>|)>>|)>|)>.
    </equation*>
  </def>

  <\def>
    The type-estimation coefficient under a best response oracle
    <math|\<psi\>> is defined <math|d<rsub|\<gamma\>><rsup|\<psi\>><around*|(|\<cal-H\>|)>>
    is defined as\ 

    <\equation*>
      d<rsub|\<gamma\>><rsup|\<psi\>><around*|(|\<cal-H\>,<wide|\<pi\>|\<bar\>>|)>\<triangleq\>inf<rsub|p\<in\>\<Delta\><around*|(|\<cal-U\>|)>>sup<rsub|\<pi\>\<in\>\<cal-H\>>
      \<bbb-E\><rsub|\<mu\>\<sim\>p><around*|[|V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>-V<around*|(|\<mu\>,\<pi\>|)>-\<gamma\>\<cdot\>D<rsub|H><rsup|2><around*|(|\<psi\><around*|(|\<pi\>|)>,\<psi\><around*|(|<wide|\<pi\>|\<bar\>>|)>|)>|]>
    </equation*>
  </def>

  <\lemma>
    For all <math|\<pi\><rprime|'><above|\<sim\>|s>\<pi\>>,
    <math|d<rsub|\<gamma\>><rsup|\<psi\>><around*|(|\<cal-H\>\<cup\>\<pi\><rprime|'>,<wide|\<pi\>|\<bar\>>|)>=d<rsub|\<gamma\>><rsup|\<psi\>><around*|(|\<cal-H\>,<wide|\<pi\>|\<bar\>>|)>>
  </lemma>

  <\remark>
    For <math|\<pi\><rprime|'><above|\<sim\>|\<psi\>>\<pi\>>,
    <math|d<rsub|\<gamma\>><rsup|\<psi\>><around*|(|\<cal-H\>\<cup\>\<pi\><rprime|'>,<wide|\<pi\>|\<bar\>>|)>\<neq\>d<rsub|\<gamma\>><rsup|\<psi\>><around*|(|\<cal-H\>,<wide|\<pi\>|\<bar\>>|)>>.
    Thus, we need a new definition of regret
    <math|Reg<rsub|\<psi\>><around*|(|K,\<pi\>|)>> such that for
    <math|\<pi\><rprime|'><above|\<sim\>|\<psi\>>\<pi\>>,\ 

    <\equation*>
      Reg<rsub|\<psi\>><around*|(|K,\<pi\>|)>=Reg<rsub|\<psi\>><around*|(|K,\<pi\><rprime|'>|)>
    </equation*>
  </remark>

  <\infhyp>
    The decision-estimation coefficient depends only on the type number of
    <math|\<cal-H\>>.
  </infhyp>

  <\remark>
    This hypothesis is impossible to hold based on current version of DEC.
    For <math|\<pi\>\<sim\><wide|\<pi\>|\<bar\>>>, it is a pretty bad idea to
    use <math|D<rsub|H><rsup|2><around*|(|\<pi\>,<wide|\<pi\>|\<bar\>>|)>> as
    a measure to distinguish types.
  </remark>

  <section|Difference between models and induced models>

  <\itemize>
    <item>The key idea to classify models to find models that are distinct on
    several state-action pairs. However, two same type policies may lead to
    two pretty different induced models.

    <item>A measure measures the type distance rather than the induced model
    distance should be introduced. Several previous works using the induced
    model distance that the model is induced by the best response rather than
    the partner's policy. I am not sure if it can be a good choice of induced
    models.

    <item>The complexity measure should satisfy:
    <math|d<around*|(|\<cal-H\>|)>=d<around*|(|\<cal-H\>\<cup\>\<pi\><rprime|'>|)>>,
    if there exist <math|\<pi\>\<in\>\<cal-H\>> such that
    <math|\<pi\>\<sim\>\<pi\><rprime|'>>.
  </itemize>

  <section|Complexity for types>

  <\def>
    Two policies <math|\<pi\>> and <math|\<pi\><rprime|'>> are of the same
    <math|\<psi\>>-type if

    <\equation*>
      \<psi\><around*|(|\<pi\>|)>=\<psi\><around*|(|\<pi\><rprime|'>|)>
    </equation*>

    where <math|\<psi\>> is a best response oracle. The relationship is
    denoted as <math|\<pi\><above|\<sim\>|\<psi\>>\<pi\><rprime|'>>.<active*|<active*|<active*|<active*|<active*|<hgroup|<hgroup|<hgroup|<hgroup|<hgroup|>>>>>>>>>>
    Similarly, we can define <math|\<psi\>>-type independent and
    <math|n<rsub|\<psi\>><around*|(|\<cal-H\>|)>>.
  </def>

  The <math|\<psi\>>-type definition does not satisfies
  <math|V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>=V<around*|(|\<psi\><around*|(|\<pi\><rprime|'>|)>,\<pi\><rprime|'>|)>>.
  However, it provides a measure on the induced model by the best responses
  under the best response oracle <math|\<psi\>>. It is clear that\ 

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Complexity
      Measure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Decision-estimation
      coefficient> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Difference
      between models and induced models> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Complexity
      for types> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>