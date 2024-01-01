<TeXmacs|2.1.2>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>

    <\new-theorem|infohypo>
      Informal Hypothesis
    </new-theorem>

    <\new-theorem|hypo>
      Hypothesis
    </new-theorem>
  </hide-preamble>

  <doc-data|<doc-title|Regret Analysis of Type>>

  <section|One big issue>

  Recall that in episode <math|k>, the MEX algorithm select
  <math|\<pi\><rsup|k>> such that:

  <\equation>
    \<pi\><rsup|k>=<below|arg max|\<pi\>\<in\>\<cal-H\>>
    V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>-\<eta\>L<rsup|k><around*|(|\<pi\>|)>.<label|eq:mex-update-rule>
  </equation>

  The algorithm assumes that:

  <\itemize>
    <item>A best response oracle <math|\<psi\>>.

    <item>The cumulative value oracle <math|V>, i.e., when
    <math|<around*|(|\<mu\>,\<pi\>|)>> is given, the value
    <math|V<around*|(|\<mu\>,\<pi\>|)>> is known.
  </itemize>

  There is no need to ignore the same type of policies when we have these two
  oracles, <math|\<psi\>> and <math|V>. With the oracles of <math|\<psi\>>
  and <math|V>, we can simply eliminate the same type of policies from the
  given hypothesis set. This process requires only
  <math|<around*|\||\<cal-H\>|\|>> calls of the oracles, which is equivalent
  to one update of the MEX algorithm without the elimination of the same type
  of policies. Consequently, we must present a different narrative about our
  current work.\ 

  <section|Definition of types>

  A proper definition of type relationship (denoted as <math|\<sim\>>)
  together with an online algorithm should satisfy:

  <\itemize>
    <item>(Ignoring) For <math|\<pi\>\<sim\>\<pi\><rprime|'>>, where
    <math|\<pi\>\<in\>\<cal-H\>> and <math|\<pi\><rprime|'>\<in\>\<cal-H\>>,
    the online algorithm does not need to explore both <math|\<pi\>> and
    <math|\<pi\><rprime|'>> to achieve a higher level of optimality.

    <item>(Glancing) For <math|\<pi\>\<sim\>\<pi\><rprime|'>>, where
    <math|\<pi\>\<in\>\<cal-H\>> but <math|\<pi\><rprime|'>\<nin\>\<cal-H\>>,
    if the online algorithm guarantees sublinear regret when
    <math|\<pi\><rsup|\<ast\>>=\<pi\>>, then it also guarantees sublinear
    regret when <math|\<pi\><rsup|\<ast\>>=\<pi\><rprime|'>>.
  </itemize>

  <\remark>
    As discussed in the previous section, we may focus on the glancing
    property of the MEX algorithm.\ 
  </remark>

  <\def>
    An online algorithm is called <em|glancing under the type relationship
    ><math|\<sim\>> if the algorithm satisfies the following condition: for
    every <math|\<pi\>\<sim\>\<pi\><rprime|'>>, if the algorithm guarantees
    sublinear regret on <math|\<pi\>>, then it also guarantees sublinear
    regret on <math|\<pi\><rprime|'>>.
  </def>

  Now, we list several definitions of types.

  <\def>
    Two policies <math|\<pi\>> and <math|\<pi\><rprime|'>> are of the same
    <math|V>-type if\ 

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>=V<around*|(|\<psi\><around*|(|\<pi\><rprime|'>|)>,\<pi\><rprime|'>|)>,
    </equation*>

    where <math|\<psi\>> is a best response oracle. The relationship is
    denoted as <math|\<pi\><above|\<sim\>|V>\<pi\><rprime|'>>.
  </def>

  <\def>
    A set of partners' policies <math|\<cal-H\>> is said to be <math|V>-type
    independent if no two policies in <math|\<cal-H\>> are of the same
    <math|V>-type.
  </def>

  <\def>
    The cardinality of the smallest <math|V>-type independent subset of
    <math|\<cal-H\>> is called the <math|V>-type number of <math|\<cal-H\>>,
    denoted as <math|n<rsub|V><around*|(|\<cal-H\>|)>>.
  </def>

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

  <\def>
    Two policies <math|\<pi\>> and <math|\<pi\><rprime|'>> are of the same
    <math|s>-type if <math|\<pi\><above|\<sim\>|V>\<pi\><rprime|'>> and
    <math|\<pi\><above|\<sim\>|\<psi\>>\<pi\><rprime|'>>. The relationship is
    denoted as <math|\<pi\><above|\<sim\>|s>\<pi\><rprime|'>>.<active*|<active*|<active*|<active*|<active*|<hgroup|<hgroup|<hgroup|<hgroup|<hgroup|>>>>>>>>>>
    Similarly, we can define <math|s>-type independent and
    <math|n<rsub|s><around*|(|\<cal-H\>|)>>.
  </def>

  <\lemma>
    <math|n<rsub|s><around*|(|\<cal-H\>|)>\<geq\>n<rsub|\<psi\>><around*|(|\<cal-H\>|)>>
    and <math|n<rsub|s><around*|(|\<cal-H\>|)>\<geq\>n<rsub|V><around*|(|\<cal-H\>|)>>.
  </lemma>

  <section|Glancing property of MEX>

  The regret of the game is defined as

  <\equation*>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>,
  </equation*>

  which can be decomposed into the sum of\ 

  <\equation>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)><label|eq:valueerror><active*|<active*|<active*|<active*|<active*|<active*|<active*|>>>>>>>
  </equation>

  and\ 

  <\equation>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)><label|eq:prederror>.
  </equation>

  In the following, we call <eqref|eq:valueerror> the <em|value guessed
  error> and <eqref|eq:prederror> the <em|prediction error>. We have already
  proved the following result.<inactive*|>

  <\infohypo>
    The MEX algorithm is <with|color|red|not> an online glancing algorithm
    under the <math|<math|s>>-type relation.
  </infohypo>

  <with|proof-text|<macro|<localize|Proof> Idea>|<\proof>
    Denote <math|\<pi\><rsub|\<cal-H\>>> as an arbitrary policy in
    <math|\<cal-H\>> such that <math|\<pi\><rsub|\<cal-H\>><above|\<sim\>|s>\<pi\><rsup|\<ast\>>>.
    By <eqref|eq:mex-update-rule>, the <em|<em|prediction error>>
    <eqref|eq:prederror> is upper bounded by

    <\equation*>
      <big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsub|\<cal-H\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>,
    </equation*>

    which is the sum of

    <\equation*>
      <big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>
    </equation*>

    and

    <\equation*>
      <big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsub|\<cal-H\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>.
    </equation*>

    Note that the term <math|<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>>
    can be upper bounded using the martingale exponential inequality. If the
    realizability assumption hold, <math|<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsub|\<cal-H\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>=0>.
    However, in the case <math|\<pi\><rsup|\<ast\>>\<nin\>\<cal-H\>>, we can
    <with|color|blue|construct an example> such that
    <math|\<pi\><rsub|\<cal-H\>><above|\<sim\>|s>\<pi\><rsup|\<ast\>>> but
    the term\ 

    <\equation*>
      <big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsub|\<cal-H\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>
    </equation*>

    grows linearly w.r.t. <math|K>.
  </proof>>

  <\remark>
    Why MEX is not an online glancing algorithm even under the <math|s>-type
    relation? The reason is that: for <math|\<pi\><rsub|\<cal-H\>><above|\<sim\>|s>\<pi\><rsup|\<ast\>>>,
    the <math|s>-type relationship does not guarantee the models induced by
    these two policies be close<\footnote>
      In fact, the distance between the models induced by two policies is not
      an effective metric for distinguishing different types of policies.
      Consider two players in a simplified <math|3\<times\>3> Overcooked-AI
      environment: one takes food from the left, and the other takes food
      from the right.
    </footnote>.
  </remark>

  <section|Maximize to collaborate algorithm>

  We modify the MEX algorithm into the Maximize to collaborate (MCO)
  algorithm as follows:

  <\equation*>
    \<pi\><rsup|k>=<below|arg max|\<pi\>\<in\>\<cal-H\>>
    V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>-\<eta\>L<rsup|k><around*|(|\<psi\><around*|(|\<pi\>|)>|)>,
  </equation*>

  where <math|L<rsup|k><around*|(|\<psi\><around*|(|\<pi\>|)>|)>> is defined
  as

  <\equation*>
    L<rsup|k><around*|(|\<psi\><around*|(|\<pi\>|)>|)>=<big|sum><rsub|s\<in\><around*|[|k-1|]>>L<around*|(|\<psi\><around*|(|\<pi\>|)>,s<rsub|s>,b<rsub|s>,r<rsub|s>,s<rsub|s+1>|)>.
  </equation*>

  The loss function <math|L> is defined as

  <\equation*>
    L<around*|(|\<mu\>,s,b,r,s<rprime|'>|)>=-log
    <around*|(|\<bbb-P\><around*|(|s<rprime|'>\<mid\>s,\<mu\><around*|(|s|)>,b|)>+R<around*|(|r\<mid\>s,\<mu\><around*|(|s|)>,b|)>|)>.
  </equation*>

  The modification is: instead of measuring the distance between the model
  induced by partner policies, we measure the distance between the model
  induced by the best responses to these partner policies. The discrepancy
  measure used in the GEC needs also be modified.

  <\hypo>
    MCO is an online glancing algorithm under <math|s>-type relationship.
  </hypo>

  <section|DO NOT READ>

  <\theorem>
    <em|(From our AAMAS paper) >The upper bound of the value guessed error
    <eqref|eq:valueerror> depends on <math|n<rsub|V><around*|(|\<cal-H\>|)>>
    instead of <math|<around*|\||\<cal-H\>|\|>>.
  </theorem>

  We state the following informal hypothesis

  <\infohypo>
    The upper bound of the prediction error <eqref|eq:prederror> depends on
    <math|n<rsub|\<psi\>><around*|(|\<cal-H\>|)>> instead of
    <math|<around*|\||\<cal-H\>|\|>>.
  </infohypo>

  <\equation*>
    \;
  </equation*>
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
    <associate|auto-4|<tuple|4|3>>
    <associate|auto-5|<tuple|5|3>>
    <associate|eq:mex-update-rule|<tuple|1|1>>
    <associate|eq:prederror|<tuple|3|2>>
    <associate|eq:valueerror|<tuple|2|2>>
    <associate|footnote-1|<tuple|1|3>>
    <associate|footnr-1|<tuple|1|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>One
      big issue> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Definition
      of types> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Glancing
      property of MEX> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Maximize
      to collaborate algorithm> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>DO
      NOT READ> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>