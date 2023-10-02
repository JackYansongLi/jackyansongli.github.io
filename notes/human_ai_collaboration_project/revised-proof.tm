<TeXmacs|2.1>

<style|generic>

<\body>
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

  Initializing a policy set <math|\<cal-H\><rsub|\<psi\>>\<leftarrow\>\<cal-H\><rsub|fin>>,
  for all <math|k>, <math|l\<in\><around*|[|K|]>> with <math|k\<gtr\>l>, if
  <math|\<pi\><rsup|k><above|\<sim\>|\<psi\>>\<pi\><rsup|l>>, we eliminate
  <math|\<pi\><rsup|l>> from <math|\<cal-H\><rsub|\<psi\>>>. The resulting
  <math|\<cal-H\><rsub|\<psi\>>> has the following property by its
  construction:

  <\itemize>
    <item><math|\<cal-H\><rsub|\<psi\>>\<subset\>\<cal-H\><rsub|fin>>.

    <item><math|n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|\<psi\>>|)>\<leq\>n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>>.
  </itemize>

  <\lemma>
    <label|lem:increasing-seq>If for all <math|k\<in\><around*|[|K|]>> such
    that <math|\<pi\><rsup|k>\<in\>\<cal-H\><rsub|\<psi\>>>, we have\ 

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>\<leq\>c<rsub|k>,
    </equation*>

    where <math|<around*|{|c<rsub|k>|}><rsub|k\<in\><around*|[|K|]>>> is a
    non-increasing sequence. Then, for all <math|k\<in\><around*|[|K|]>>, we
    have

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>\<leq\>c<rsub|k>.
    </equation*>
  </lemma>

  <\proof>
    By definition, for all <math|k>, <math|l\<in\><around*|[|K|]>> with
    <math|k\<gtr\>l> and <math|\<pi\><rsup|k><above|\<sim\>|\<psi\>>\<pi\><rsup|l>>,
    we have\ 

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>=V<around*|(|\<psi\><around*|(|\<pi\><rsup|l>|)>,\<pi\><rsup|l>|)>.
    </equation*>

    Thus,

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>=V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|l>|)>,\<pi\><rsup|l>|)>.
    </equation*>

    Note that for all <math|k\<in\><around*|[|K|]>> such that
    <math|\<pi\><rsup|k>\<in\>\<cal-H\><rsub|\<psi\>>>, we have\ 

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>\<leq\>c<rsub|k>,
    </equation*>

    which implies <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|l>|)>,\<pi\><rsup|l>|)>\<leq\>c<rsub|k>>.
    By the construction rule of <math|\<cal-H\><rsub|\<psi\>>>, for all
    <math|l\<in\><around*|[|K|]>> with <math|\<pi\><rsup|l>\<nin\>\<cal-H\><rsub|\<psi\>>>,
    we can always find a constant <math|k<rprime|'>> such that
    <math|k<rprime|'>\<gtr\>l> and <math|\<pi\><rsup|k<rprime|'>>\<in\>\<cal-H\><rsub|\<psi\>>>.
    Thus

    <\equation*>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|l>|)>,\<pi\><rsup|l>|)>\<leq\>c<rsub|k<rprime|'>>\<leq\>c<rsub|l>.
    </equation*>
  </proof>

  <\theorem>
    <label|thm:fin>Given an MDP with generalized eluder coefficient
    <math|d<rsub|GEC><around*|(|\<cdot\>|)>> and a finite hypothesis class
    <math|\<cal-H\><rsub|fin><rsup|>> with
    <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\><rsub|fin>>, by setting

    <\equation*>
      \<eta\>=<sqrt|<frac|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>|log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>\<cdot\>H
      K>>,
    </equation*>

    the regret of the MEX algorithm applying on <math|\<cal-H\><rsub|fin>>
    with oracle <math|\<psi\>> after <math|K> episodes is upper bounded by,
    with probability at least <math|1-\<delta\>>,

    <\equation*>
      Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>\<cdot\>log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>\<cdot\>H
      K>.
    </equation*>
  </theorem>

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
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>\<leq\>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>
    </equation*>

    for all <math|k\<in\><around*|[|K|]>>. Thus,

    <\equation>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>\<leq\>\<eta\><big|sum><rsub|h=1><rsup|H><around*|(|L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>|)>.<label|eq:gen-error>
    </equation>

    Applying Lemma <reference|lem:loss-upperbound>, we have that with
    probability at least <math|1-\<delta\>>, for any
    <math|<around*|(|h,k|)>\<in\><around*|[|H|]>\<times\><around*|[|K|]>><math|>
    and all <math|\<pi\>\<in\>\<cal-H\><rsub|\<psi\>>>,

    <\equation*>
      L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\>|)>\<leq\>-2<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<psi\><around*|(|\<pi\><rsup|s>|)>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2log<around*|(|H<around*|\||\<cal-H\><rsub|\<psi\>>|\|>/\<delta\>|)>.
    </equation*>

    Substituting the above equation into <eqref|eq:gen-error> gives us, with
    probability at least <math|1-\<delta\>>, for all
    <math|k\<in\><around*|[|K|]>> with <math|\<pi\><rsup|k>\<in\>\<cal-H\><rsub|\<psi\>>>,
    we have

    <\equation*>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>\<leq\>-2\<eta\><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<psi\><around*|(|\<pi\><rsup|s>|)>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>+2H\<eta\>log<around*|(|H<around*|\||\<cal-H\><rsub|\<psi\>>|\|>/\<delta\>|)>
    </equation*>

    We define <math|c<rsub|k>> as

    <\equation*>
      c<rsub|k>\<triangleq\>-2\<eta\><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<psi\><around*|(|\<pi\><rsup|s>|)>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>+2H\<eta\>log<around*|(|H<around*|\||\<cal-H\><rsub|\<psi\>>|\|>/\<delta\>|)>.
    </equation*>

    The sequnce <math|<around*|{|c<rsub|k>|}><rsub|k\<in\><around*|[|K|]>>>
    is a non-increasing sequence. Applying Lemma
    <reference|lem:increasing-seq> gives us, with probability at least
    <math|1-\<delta\>>, for all <math|k\<in\><around*|[|K|]>>, we have\ 

    <\equation*>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>\<leq\>c<rsub|k>.
    </equation*>

    Summing over <math|<around*|[|K|]>> gives us, with probability
    <math|1-\<delta\>>,

    <\align>
      <tformat|<table|<row|<cell|<text|Term
      (i)>\<leq\>>|<cell|<big|sum><rsub|k=1><rsup|K>c<rsub|k>>>|<row|<cell|=>|<cell|-2\<eta\><big|sum><rsub|k=1><rsup|K><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<psi\><around*|(|\<pi\><rsup|s>|)>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>+2H\<eta\>log<around*|(|H<around*|\||\<cal-H\><rsub|\<psi\>>|\|>/\<delta\>|)>>>|<row|<cell|\<leq\>>|<cell|-2\<eta\><big|sum><rsub|k=1><rsup|K><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<psi\><around*|(|\<pi\><rsup|s>|)>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>+2H\<eta\>log<around*|(|H
      n<rsub|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>.>>>>
    </align>

    \;

    <with|font-series|bold|Term (ii).> Follow the proof of Theorem 4.4 in
    <cite|liu_one_2023>,

    <\equation*>
      Term <around*|(|ii|)>\<leq\>2\<eta\><big|sum><rsub|k=1><rsup|K><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<psi\><around*|(|\<pi\><rsup|s>|)>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>+<frac|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>|8\<eta\>>+<sqrt|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>H
      K>+\<varepsilon\><rsub|conf>H K.
    </equation*>

    <with|font-series|bold|Combining Term (i) and Term (ii).>

    <\align>
      <tformat|<table|<row|<cell|Regret<around*|(|K|)>=>|<cell|<text|Term
      (i)>+<text|Term (ii)>>>|<row|<cell|\<leq\>>|<cell|2\<eta\> K H
      log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>+<frac|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>|8\<eta\>>+<sqrt|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>H
      K>+\<varepsilon\><rsub|conf>H K.>>>>
    </align>

    Set <math|\<varepsilon\><rsub|conf>=1/<sqrt|H K>> and

    <\equation*>
      \<eta\>=<sqrt|<frac|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>|log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>\<cdot\>H
      K>>
    </equation*>

    leads to the proof.
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
    <associate|auto-1|<tuple|3|2|../../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-liu_one_2023|<tuple|1|2|../../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:cond-exp|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:gen-error|<tuple|3|2|../../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:union-bound|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:increasing-seq|<tuple|2|?|../../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:loss-upperbound|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:fin|<tuple|3|1|../../../.TeXmacs/texts/scratch/no_name_3.tm>>
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
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>