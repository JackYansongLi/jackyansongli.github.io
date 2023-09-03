<TeXmacs|2.1>

<style|generic>

<\body>
  <section|MEX on infinite hypothesis set>

  Given an infinity hypothesis set <math|\<cal-H\><rsub|inf>>, how to run MEX
  algorithm on it? In this case, we can get a regret

  <\equation*>
    Reg<around*|(|K|)>\<lesssim\><sqrt|H K>+K\<varepsilon\><rsub|\<psi\>>
  </equation*>

  by running MEX on a random set <math|\<cal-H\>> where

  <\equation*>
    \<varepsilon\><rsub|\<psi\>>\<triangleq\>min<rsub|\<pi\>\<in\>\<cal-H\>><around*|\||<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>>|)>,\<pi\>|)>-<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>|\|>.
  </equation*>

  We also denote

  <\equation*>
    \<pi\><rsup|\<ast\>><rsub|det>\<triangleq\>argmin<rsub|\<pi\>\<in\>\<cal-H\>><around*|\||<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>>|)>,\<pi\>|)>-<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>|\|>
  </equation*>

  <\lemma>
    If <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\>>,
    <math|Reg<around*|(|K|)>\<lesssim\><sqrt|H K>>.
  </lemma>

  <section|Proof of the regret bound>

  <\proof>
    We decompose the regret into two terms,\ 

    <\align>
      <tformat|<table|<row|<cell|Regret<around*|(|K|)>\<triangleq\>>|<cell|<big|sum><rsub|k=1><rsup|K><rsub|>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>>>|<row|<cell|=>|<cell|<wide*|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>|\<wide-underbrace\>><rsub|<text|Term
      (i)> >+<wide*|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>|\<wide-underbrace\>><rsub|<text|Term
      <around*|(|ii|)>>>.>>>>
    </align>

    <with|font-series|bold|Term (i).> By the choice of <math|\<pi\><rsup|k>>,
    we have

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>,\<pi\><rsup|\<ast\>><rsub|det>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>\<leq\>V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>
    </equation*>

    for all <math|k\<in\><around*|[|K|]>>. By definition

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>,\<pi\><rsup|\<ast\>><rsub|det>|)>\<geq\>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-\<varepsilon\><rsub|\<psi\>>.
    </equation*>

    Thus,

    <\equation>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>+\<varepsilon\><rsub|\<psi\>>.<label|eq:gen-error>
    </equation>

    \;

    for any <math|\<pi\><rsup|k><above|\<sim\>|\<psi\>>\<pi\><rsup|k<rprime|'>>>,
    we have\ 

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>=V<around*|(|\<psi\><around*|(|\<pi\><rsup|k<rprime|'>>|)>,\<pi\><rsup|k><rprime|'>|)>.
    </equation*>

    Thus, an upper bound for <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>>
    is also an upper bound for <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k<rprime|'>>,\<pi\><rsup|k<rprime|'>>|)>>.
    Applying Lemma <reference|lem:loss-upperbound>, we have that with
    probability at least <math|1-\<delta\>>, for any
    <math|<around*|(|h,k|)>\<in\><around*|[|H|]>\<times\><around*|[|K|]>><math|>,
    <math|\<mu\><rsup|s>=\<psi\><around*|(|\<pi\><rsup|s>|)>> and
    <math|\<pi\><rsup|k>\<in\>\<cal-H\>>,

    <\align>
      <tformat|<table|<row|<cell|L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>\<leq\>>|<cell|-2<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2log<around*|(|H
      n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>.>>>>
    </align>

    Substituting the above equation into <eqref|eq:gen-error> gives us that
    with probability at least <math|1-\<delta\>>, for any
    <math|k\<in\><around*|[|K|]>>, <math|\<mu\><rsup|s>=\<psi\><around*|(|\<pi\><rsup|s>|)>>
    and <math|\<pi\><rsup|k>\<in\>\<cal-H\>>

    <\equation*>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>-2\<eta\><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2H\<eta\>log<around*|(|H
      n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>+<with|color|blue|\<varepsilon\><rsub|\<psi\>>>.
    </equation*>

    Summing over <math|<around*|[|K|]>> gives us

    <\equation*>
      <text|Term (i)>\<leq\>-2\<eta\><big|sum><rsub|k=1><rsup|K><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2\<eta\>
      K H log<around*|(|H n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>+<with|color|blue|K\<varepsilon\><rsub|\<psi\>>>.
    </equation*>

    <with|font-series|bold|Term (ii).> Follow the proof of Theorem 4.4 in
    <cite|liu_one_2023>, we have that for all
    <math|\<mu\><rsup|s>=\<psi\><around*|(|\<pi\><rsup|s>|)>>

    <\equation*>
      Term <around*|(|ii|)>\<leq\>2\<eta\><big|sum><rsub|k=1><rsup|K><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+<frac|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>|8\<eta\>>+<sqrt|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>H
      K>+\<varepsilon\><rsub|conf>H K.
    </equation*>

    <with|font-series|bold|Combining Term (i) and Term (ii).>

    <\align>
      <tformat|<table|<row|<cell|Regret<around*|(|K|)>=>|<cell|<text|Term
      (i)>+<text|Term (ii)>>>|<row|<cell|\<leq\>>|<cell|2\<eta\> K H
      log<around*|(|H n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>+<frac|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>|8\<eta\>>+<sqrt|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>H
      K>+\<varepsilon\><rsub|conf>H K+<with|color|blue|K\<varepsilon\><rsub|\<psi\>>>.>>>>
    </align>

    Set <math|\<varepsilon\><rsub|conf>=<frac|1|<sqrt|H
    K>>-<frac|\<varepsilon\><rsub|\<psi\>>|H>>. For
    <math|\<varepsilon\><rsub|conf>\<gtr\>0>, we need

    <\equation*>
      \<varepsilon\><rsub|\<psi\>>\<leq\><sqrt|<frac|H|K>>
    </equation*>

    \;
  </proof>

  <section|Appendix>

  <\lemma>
    <label|lem:loss-upperbound>With probability at least <math|1-\<delta\>>,
    for any <math|<around*|(|h,k|)>\<in\><around*|[|H|]>\<times\><around*|[|K|]>>,
    <math|\<mu\><rsup|s>\<in\>BR<around*|(|\<pi\><rsup|s>|)>>, and
    <math|\<pi\>\<in\>\<Pi\>>

    <\equation*>
      L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\>|)>\<leq\>-2<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2log<around*|(|H<around*|\||\<Pi\>|\|>/\<delta\>|)>.
    </equation*>
  </lemma>

  <\proof>
    Given <math|\<pi\>\<in\>\<cal-H\>>, we denote the random variable
    <math|X<rsup|k><rsub|h,\<pi\>>> as

    <\equation*>
      X<rsup|k><rsub|h,\<pi\>>=log<around*|(|<frac|\<bbb-P\><rsub|h,\<pi\><rsup|\<ast\>>><around*|(|s<rsub|h+1><rsup|k>\<mid\>s<rsub|h><rsup|k>,a<rsub|h><rsup|k>|)>|\<bbb-P\><rsub|h,\<pi\>><around*|(|s<rsub|h+1><rsup|k>\<mid\>s<rsub|h><rsup|k>,a<rsub|h><rsup|k>|)>>|)>.
    </equation*>

    Now we define a filtration <math|<around*|{|\<cal-F\><rsub|h,k>|}><rsub|k=1><rsup|K>>
    as (B.25) in <cite|liu_one_2023>. Thus we have
    <math|X<rsub|h,\<pi\>><rsup|k>\<in\>\<cal-F\><rsub|h,k>>. Therefore, by
    applying Lemma D.1 in <cite|liu_one_2023>, we have that with probability
    at least <math|1-\<delta\>>, for any <math|<around*|(|h,k|)>\<in\><around*|[|H|]>\<times\><around*|[|K|]>>,
    and <math|\<pi\>\<in\>\<Pi\>>, we have

    <\equation>
      -<frac|1|2><big|sum><rsub|s=1><rsup|k-1>X<rsub|h,\<pi\>><rsup|s>\<leq\><big|sum><rsub|s=1><rsup|k-1>log\<bbb-E\><around*|[|exp<around*|{|-<frac|1|2>X<rsub|h,\<pi\>><rsup|s>|}>\<mid\>\<cal-F\><rsub|h,s-1>|]>+log<around*|(|H<around*|\||\<Pi\>|\|>/\<delta\>|)>.<label|eq:union-bound>
    </equation>

    Meanwhile, by (B.27) in <cite|liu_one_2023>, for any
    <math|\<mu\><rsup|s>\<in\>BR<around*|(|\<pi\><rsup|s>|)>>, the
    conditional expectation equals to

    <\equation>
      \<bbb-E\><around*|[|exp<around*|{|-<frac|1|2>X<rsub|h,\<pi\>><rsup|s>|}>\<mid\>\<cal-F\><rsub|h,s-1>|]>=1-\<bbb-E\><rsub|<around*|(|s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)>\<sim\>\<mu\><rsup|s>><around*|[|D<rsub|H><around*|(|\<bbb-P\><rsub|h,\<pi\><rsup|\<ast\>>><around*|(|\<cdot\>\<mid\>s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)><around*|\|||\|>\<bbb-P\><rsub|h,\<pi\>><around*|(|\<cdot\>\<mid\>s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)>|)>|]>.<label|eq:cond-exp>
    </equation>

    Denote <math| \<bbb-E\><rsub|<around*|(|s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)>\<sim\>\<mu\><rsup|s>><around*|[|D<rsub|H><around*|(|\<bbb-P\><rsub|h,\<pi\><rsup|\<ast\>>><around*|(|\<cdot\>\<mid\>s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)><around*|\|||\|>\<bbb-P\><rsub|h,\<pi\><rsup|s>><around*|(|\<cdot\>\<mid\>s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)>|)>|]>>
    as <math|\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>>.
    Using the fact <math|log<around*|(|x|)>\<leq\>x-1> and substituting
    <eqref|eq:cond-exp> into <eqref|eq:union-bound> finishes the proof.
  </proof>

  <\bibliography|bib|tm-plain|reference>
    <\bib-list|1>
      <bibitem*|1><label|bib-liu_one_2023>Zhihan Liu, Miao Lu, Wei Xiong, Han
      Zhong, Hao Hu, Shenao Zhang, Sirui Zheng, Zhuoran Yang<localize|, and
      >Zhaoran Wang. <newblock>One Objective to Rule Them All: A Maximization
      Objective Fusing Estimation and Planning for Exploration. <newblock>may
      2023.<newblock>
    </bib-list>
  </bibliography>
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
    <associate|auto-4|<tuple|3|2>>
    <associate|bib-liu_one_2023|<tuple|1|2>>
    <associate|eq:cond-exp|<tuple|3|2>>
    <associate|eq:gen-error|<tuple|1|1>>
    <associate|eq:union-bound|<tuple|2|2>>
    <associate|lem:loss-upperbound|<tuple|2|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      liu_one_2023

      liu_one_2023

      liu_one_2023

      liu_one_2023
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>MEX
      on infinite hypothesis set> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Proof
      of the regret bound> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>