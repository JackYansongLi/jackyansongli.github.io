<TeXmacs|2.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Regret Analysis for MEX with Reduced
  Hypothesis>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|Reduced Hypothesis Set>

  Through this note, we denote <math|\<pi\><rsup|k>> as the guesses policy of
  player <math|2> in episode <math|k> and <math|\<pi\><rsup|\<ast\>>> as the
  true policy of player <math|2>. For each player <math|2>'s policy
  <math|\<pi\>>, the set of all best response policies is denoted as
  <math|BR<around*|(|\<pi\>|)>>. The hypothesis set of all possible policies
  of player <math|2> is denoted as <math|\<cal-H\>>.

  <\def>
    <label|def:same-type>We call two policies <math|\<pi\>> and
    <math|\<pi\><rprime|'>> to be of the same <with|font-shape|italic|type>
    if\ 

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<mu\>,\<pi\><rprime|'>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\><rprime|'>|)>
    </equation*>

    for all <math|\<mu\>\<in\>BR<around*|(|\<pi\>|)>> and
    <math|\<mu\><rprime|'>\<in\>BR<around*|(|\<pi\><rprime|'>|)>>.
  </def>

  Now, given a hypothesis set <math|\<cal-H\>>, for every
  <math|\<pi\><rsup|i>>, <math|\<pi\><rsup|j>\<in\>\<cal-H\>> that are in the
  same type, we eliminate <math|\<pi\><rsup|i>> or <math|\<pi\><rsup|j>>. The
  reduced hypothesis set is denoted as <math|\<cal-H\><rsub|type>>.

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

  <section|Regret Analysis>

  <\theorem>
    Given an MDP with generalized eluder coefficient
    <math|d<rsub|GEC><around*|(|\<cdot\>|)>> and a finite model-based
    hypothesis class <math|\<cal-H\>> and its corresponding reduced class
    <math|\<cal-H\><rsub|type>> with <math|f<rsup|\<ast\>>\<in\>\<cal-H\><rsub|type>>,
    by setting

    <\equation*>
      \<eta\>=<sqrt|<frac|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>|log<around*|(|H<around*|\||\<cal-H\><rsub|type>|\|>/\<delta\>|)>\<cdot\>H
      K>>,
    </equation*>

    then the regeret of the MEX algorithm after <math|K> episodes is upper
    bounded by, with probability at least <math|1-\<delta\>>,

    <\equation*>
      Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>\<cdot\>log<around*|(|H<around*|\||\<cal-H\><rsub|type>|\|>/\<delta\>|)>\<cdot\>H
      K>.
    </equation*>
  </theorem>

  <\proof>
    We decomposite the regret into two terms,\ 

    <\align>
      <tformat|<table|<row|<cell|Regret<around*|(|K|)>\<triangleq\>>|<cell|<big|sum><rsub|k=1><rsup|K><rsub|>V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|\<ast\>>|)>>>|<row|<cell|=>|<cell|<wide*|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>|\<wide-underbrace\>><rsub|<text|Term
      (i)> >+<wide*|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|\<ast\>>|)>|\<wide-underbrace\>><rsub|<text|Term
      <around*|(|ii|)>>>.>>>>
    </align>

    where <math|\<mu\><rsup|k>\<in\>BR<around*|(|\<pi\><rsup|k>|)>> and
    <math|\<mu\><rsup|\<ast\>>\<in\>BR<around*|(|\<pi\><rsup|\<ast\>>|)>>.

    <with|font-series|bold|Term (i).> By the choice of <math|\<pi\><rsup|k>>,
    we have\ 

    <\equation>
      V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>\<leq\>V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>.<label|eq:choice-pi>
    </equation>

    Rearraging <eqref|eq:choice-pi>, we can derive that

    <\equation*>
      <math|V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>.<label|eq:upper-bound><label|eq:measure-error-bound>
    </equation*>

    Suppose <math|\<pi\><rsup|k>> and <math|\<pi\><rsup|k<rprime|'>>> are of
    the same type. By Definition <reference|def:same-type>,\ 

    <\equation*>
      V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>=V<around*|(|\<mu\><rsup|k<rprime|'>>,\<pi\><rsup|k<rprime|'>>|)>
    </equation*>

    for all <math|\<mu\><rsup|k>\<in\>BR<around*|(|\<pi\><rsup|k>|)>> and
    <math|\<mu\><rsup|k<rprime|'>>\<in\>BR<around*|(|\<pi\><rsup|k<rprime|'>>|)>>.
    Thus, an upper bound for <math|V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>>
    is also an upper bound for <math|V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k<rprime|'>>,\<pi\><rsup|k<rprime|'>>|)>>.
    Formally, for any constanct <math|c> such that

    <\equation*>
      c\<geq\>V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>
    </equation*>

    we also have

    <\equation*>
      c\<geq\>V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k<rprime|'>>,\<pi\><rsup|k<rprime|'>>|)>
    </equation*>

    and vice versa. Thus, to upper bound \ <math|<math|V<around*|(|\<mu\><rsup|\<ast\>><rsup|*>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>>
    for all <math|\<pi\><rsup|k>\<in\>\<cal-H\>> is the same as upper
    bounding \ <math|<math|V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>>
    for all <math|\<pi\><rsup|k>\<in\>\<cal-H\><rsub|type>>. Applying Lemma
    <reference|lem:loss-upperbound>, we have that with probability at least
    <math|1-\<delta\>>, for any any <math|<around*|(|h,k|)>\<in\><around*|[|H|]>\<times\><around*|[|K|]>><math|>,
    <math|\<mu\><rsup|s>\<in\>BR<around*|(|\<pi\><rsup|s>|)>> and
    <math|\<pi\><rsup|k>\<in\>\<cal-H\><rsub|type>>,

    <\align>
      <tformat|<table|<row|<cell|L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>\<leq\>>|<cell|-2<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2log<around*|(|H<around*|\||\<cal-H\><rsub|type>|\|>/\<delta\>|)>.>>>>
    </align>

    Substituting the above equation into <eqref|eq:measure-error-bound> gives
    us

    <\equation*>
      <math|V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>-2\<eta\><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2H\<eta\>log<around*|(|H<around*|\||\<cal-H\><rsub|type>|\|>/\<delta\>|)>
    </equation*>

    Now, sum over <math|<around*|[|K|]>> gives us

    <\equation*>
      <text|Term (i)>\<leq\>-2\<eta\><big|sum><rsub|k=1><rsup|K><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2\<eta\>
      K H log<around*|(|H<around*|\||\<cal-H\><rsub|type>|\|>/\<delta\>|)><with|color|red|+K\<varepsilon\><rsub|\<psi\>>>.
    </equation*>

    <with|font-series|bold|Term (ii).> Follow the proof of Theorem 4.4 in
    <cite|liu_one_2023>, we have that for all
    <math|\<mu\><rsup|s>\<in\>BR<around*|(|\<pi\><rsup|s>|)>>

    <\equation*>
      Term <around*|(|ii|)>\<leq\>2\<eta\><big|sum><rsub|k=1><rsup|K><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+<frac|d<rsub|GEC><around*|(|\<varepsilon\>|)>|8\<eta\>>+<sqrt|d<rsub|GEC><around*|(|\<varepsilon\>|)>H
      K>+\<varepsilon\>H K.
    </equation*>

    <with|font-series|bold|Combining Term (i) and Term (ii).>

    <\align>
      <tformat|<table|<row|<cell|Regret<around*|(|K|)>=>|<cell|<text|Term
      (i)>+<text|Term (ii)>>>|<row|<cell|\<leq\>>|<cell|2\<eta\> K H
      log<around*|(|H<around*|\||\<cal-H\><rsub|type>|\|>/\<delta\>|)>+<frac|d<rsub|GEC><around*|(|\<varepsilon\>|)>|8\<eta\>>+<sqrt|d<rsub|GEC><around*|(|\<varepsilon\>|)>H
      K>+\<varepsilon\>H K<with|color|red|+K\<varepsilon\><rsub|\<psi\>>>.>>>>
    </align>

    By taking <math|\<varepsilon\>=1/<sqrt|H K>>,
    <math|\<eta\>=<sqrt|<frac|d<rsub|GEC><around*|(|\<varepsilon\>|)>|log<around*|(|H<around*|\||\<cal-H\><rsub|type>|\|>/\<delta\>|)>\<cdot\>H
    K>>>, we can derive that, with probability at least <math|1-\<delta\>>,
    it holds that

    <\equation*>
      Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>\<cdot\>log<around*|(|H<around*|\||\<cal-H\><rsub|type>|\|>/\<delta\>|)>\<cdot\>H
      K>.
    </equation*>

    This finishes the proof of this Theorem.
  </proof>

  <\bibliography|bib|tm-plain|human_ai>
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
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|3>>
    <associate|bib-liu_one_2023|<tuple|1|3>>
    <associate|def:same-type|<tuple|1|1>>
    <associate|eq:choice-pi|<tuple|3|2>>
    <associate|eq:cond-exp|<tuple|2|1>>
    <associate|eq:measure-error-bound|<tuple|3|2>>
    <associate|eq:union-bound|<tuple|1|1>>
    <associate|eq:upper-bound|<tuple|3|2>>
    <associate|lem:loss-upperbound|<tuple|2|1>>
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
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Reduced
      Hypothesis Set> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Regret
      Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>