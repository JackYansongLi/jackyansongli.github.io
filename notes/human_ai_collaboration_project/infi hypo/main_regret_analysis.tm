<TeXmacs|2.1.2>

<style|generic>

<\body>
  <doc-data|<doc-title|Regret Analysis for
  MEX>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<author-email|yli340@uic.edu>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>>>>

  <section|Regret Analysis for Finite Hypothesis Set>

  Through this note, we denote <math|\<pi\><rsup|k>> as the guesses policy of
  player <math|2> in episode <math|k> and <math|\<pi\><rsup|\<ast\>>> as the
  true policy of player <math|2>. For each player <math|2>'s policy
  <math|\<pi\>>, the set of all best response policies is denoted as
  <math|BR<around*|(|\<pi\>|)>>, i.e.,

  <\equation*>
    BR<around*|(|\<pi\>|)>=<below|argmax|\<mu\>\<in\>\<cal-U\>>
    V<around*|(|\<mu\>,\<pi\>|)>,
  </equation*>

  where <math|\<cal-U\>> is the set of all possible policies for player
  <math|1>. The hypothesis set of all possible policies of player <math|2> is
  denoted as <math|\<cal-H\>>.\ 

  <subsection|Oracle and Type Number>

  For any player <math|2>'s policy <math|\<pi\>>, we assume the existence of
  an oracle that can return a best response from
  <math|BR<around*|(|\<pi\>|)>>.\ 

  <\definition>
    <with|font-series|bold|(Oracle)> A best response oracle <math|\<psi\>>
    refers to a function that, upon receiving policies as input, yields a
    best response as its output, i.e., <math|\<psi\>> is a function
    <math|\<psi\>:\<cal-H\>\<rightarrow\>\<cal-U\>> such that

    <\equation*>
      \<psi\><around*|(|\<pi\>|)>\<in\>BR<around*|(|\<pi\>|)>.
    </equation*>
  </definition>

  With the definition of an oracle, we can categorize policies within a
  hypothesis set into various types.

  <\definition>
    <with|font-series|bold|(<math|\<psi\>>-type)> We call two policies
    <math|\<pi\>> and <math|\<pi\><rprime|'>> to be of the same
    <with|font-shape|italic|type> under oracle <math|\<psi\>> if for any
    <math|\<mu\>=\<psi\><around*|(|\<pi\>|)>> and
    <math|\<mu\><rprime|'>=\<psi\><around*|(|\<pi\><rprime|'>|)>> we have

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\><rprime|'>|)>.
    </equation*>

    The relationship is denoted as <math|\<pi\><above|\<sim\>|\<psi\>>\<pi\><rprime|'>>.
    On the contrary, two policies <math|\<pi\>> and <math|\<pi\><rprime|'>>
    not of the same <with|font-shape|italic|type> under oracle <math|\<psi\>>
    is denoted as <math|\<pi\><above|\<nsim\>|\<psi\>>\<pi\><rprime|'>>.
  </definition>

  <\definition>
    We call a set of policies <math|\<Pi\>> be type-independent under oracle
    <math|\<psi\>> if for all <math|\<pi\>\<in\>\<Pi\>> and
    <math|\<pi\><rprime|'>\<in\>\<Pi\>> such that
    <math|\<pi\>\<neq\>\<pi\><rprime|'>>, we have
    <math|\<pi\><above|\<nsim\>|\<psi\>>\<pi\><rprime|'>>.\ 
  </definition>

  The <math|\<psi\>>-type characterization gives rise to a measurement of
  quantity for the set of policies <math|\<cal-H\>>, denoted by
  <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>>.\ 

  <\definition>
    Given a hypothesis set <math|\<cal-H\>>, the type number
    <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>> under oracle <math|\<psi\>>
    is defined as the size of a largest type-independent subset of
    <math|\<cal-H\>>, i.e.,

    <\equation*>
      n<rsup|\<psi\>><around*|(|\<cal-H\>|)>=max<around*|\||\<Pi\>|\|>,
    </equation*>

    where <math|\<Pi\>\<subset\>\<cal-H\>> and <math|\<Pi\>> is
    type-independent under oracle <math|\<psi\>>.
  </definition>

  <subsection|Regret Analysis>

  In this subsection, we restrict our discussion to cases where the
  cardinality of the hypothesis set is finite, i.e.,
  <math|<around*|\||\<cal-H\>|\|>\<less\>\<infty\>>. This condition is
  emphasized through the notation <math|\<cal-H\><rsub|fin>>. We also assume
  that the realization assumption holds, i.e.,
  <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\><rsub|fin>>.

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
    See Appendix <reference|app:thm-fin>
  </proof>

  The sole term pertaining to the size of the hypothesis set is
  <math|n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>>. Consequently, the
  magnitude of regret is solely influenced by the type number associated with
  a hypothesis set, as opposed to the cardinality of the hypothesis set. This
  phenomenon occurs because policies that are categorized under the same type
  by policy <math|\<psi\>> yield identical rewards when implemented in the
  MEX algorithm.

  The type number <math|n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>>
  depends on the choice of the oracle <math|\<psi\>>, which makes it hard to
  verify when the explicit form of <math|\<psi\>> is not given. However, we
  can introduce a stronger notion of type and verify the upper bound of
  <math|n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>>.

  <\definition>
    <with|font-shape|italic|(Strong)> We call two policies <math|\<pi\>> and
    <math|\<pi\><rprime|'>> to be of the same <with|font-shape|italic|s-type>
    if\ 

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<mu\>,\<pi\><rprime|'>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\><rprime|'>|)><label|eq:st-condition>
    </equation*>

    for all <math|\<mu\>\<in\>BR<around*|(|\<pi\>|)>> and
    <math|\<mu\><rprime|'>\<in\>BR<around*|(|\<pi\><rprime|'>|)>>. The
    relationship are denoted as <math|\<pi\><above|\<sim\>|s>\<pi\><rprime|'>>.
  </definition>

  Similar to the definition of type number under oracle <math|\<psi\>>, we
  can define strong type number <math|n<rsub|stype><around*|(|\<cal-H\>|)>>.

  <\lemma>
    <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>\<leq\>n<rsub|stype><around*|(|\<cal-H\>|)>>
    for all <math|\<psi\>> be a best response oracle.
  </lemma>

  <section|Regret Analysis for Infinite Hypothesis Set>

  In this subsection, we discuss the cases where the cardinality of the
  hypothesis set is infinite, i.e., <math|<around*|\||\<cal-H\>|\|>=\<infty\>>.
  This condition is emphasized through the notation
  <math|\<cal-H\><rsub|inf>>. We keep assume that the realization assumption
  holds, i.e., <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\><rsub|inf>>.

  <subsection|Approximate an Infinite Hypothesis Set by a Finite Hypothesis
  Set>

  A direct approach to handling an infinite hypothesis set is to approximate
  it as a finite hypothesis set. First, we outline what makes a good
  approximation.

  <\definition>
    <label|def:fin-cover>(<math|\<varepsilon\><rsub|\<psi\>>>-optimal
    approximation) A finite hypothesis set <math|\<cal-H\><rsub|fin>> is
    called an <math|\<varepsilon\><rsub|\<psi\>>>-optimal approximation of
    <math|\<cal-H\><rsub|inf>> if

    <\equation*>
      min<rsub|\<pi\>\<in\>\<cal-H\>><around*|\||<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>>|)>,\<pi\>|)>-<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>|\|>\<leq\>\<varepsilon\><rsub|\<psi\>>
    </equation*>

    We denote <math|\<pi\><rsup|\<ast\>><rsub|det>> as
    <math|\<varepsilon\><rsub|\<psi\>>>-optimal policy defined as

    <\equation*>
      \<pi\><rsup|\<ast\>><rsub|det>\<triangleq\><below|argmin|\<pi\>\<in\>\<cal-H\>>
      <around*|\||<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>>|)>,\<pi\>|)>-<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>|\|>.
    </equation*>
  </definition>

  In the following, we list some examples of the
  <math|\<varepsilon\><rsub|\<psi\>>>-optimal approximation. These examples
  are established based on the following lemma.

  <\lemma>
    For any best response oracle <math|\<psi\>>, if
    <math|<around*|\<\|\|\>|\<pi\>-\<pi\><rsup|\<ast\>>|\<\|\|\>>\<leq\>\<varepsilon\>>,
    then

    <\equation*>
      <around*|\||<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>>|)>,\<pi\>|)>-<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>|\|>\<leq\>L<rsub|\<psi\>>
      \<varepsilon\>,
    </equation*>

    where <math|L<rsub|\<psi\>>\<gtr\>0> is a constant.
  </lemma>

  <\example>
    Given a finite hypothesis set <math|\<cal-H\><rsub|fin>>. For
    <math|\<varepsilon\>\<gtr\>0>, Define an infinite hypothesis
    <math|\<cal-H\><rsub|inf>> as

    <\equation*>
      \<cal-H\><rsub|inf>\<triangleq\><around*|{|\<pi\>\<mid\><around*|\<\|\|\>|\<pi\>-\<pi\><rprime|'>|\<\|\|\>>\<leq\>\<varepsilon\>,\<pi\><rprime|'>\<in\>\<cal-H\><rsub|fin>|}>.
    </equation*>

    For the constructed <math|\<cal-H\><rsub|inf>>,
    <math|\<cal-H\><rsub|fin>> is an <math|L<rsub|\<psi\>>
    \<varepsilon\>>-optimal approximation of <math|\<cal-H\><rsub|inf>>.
  </example>

  <\example>
    Given a specific neural network structure <math|\<cal-N\>>, we define
    <math|\<cal-H\><rsub|inf>> as the set comprising all neural networks
    characterized by the set all possible parameters <math|\<Theta\>> that is
    in accordance with the specified structure, formally represented as,

    <\equation*>
      \<cal-H\><rsub|inf>=<around*|{|\<pi\>\<mid\>\<pi\>\<in\>\<cal-N\><around*|(|\<theta\>|)>,\<theta\>\<in\>\<Theta\>|}>.
    </equation*>

    We proceed to create a discretization of <math|\<Theta\>>, denoted as
    <math|<wide|\<Theta\>|^>>. The finite approximation set
    <math|\<cal-H\><rsub|fin>> is defined as

    <\equation*>
      \<cal-H\><rsub|fin>=<around*|{|\<pi\>\<mid\>\<pi\>\<in\>\<cal-N\><around*|(|\<theta\>|)>,\<theta\>\<in\><wide|\<Theta\>|^>|}>.
    </equation*>

    By the choice of discretization interval, we can ensure that
    <math|<around*|\<\|\|\>|\<pi\>-\<pi\><rsup|\<ast\>>|\<\|\|\>>\<leq\>\<varepsilon\>>.
    Consequently, the discretized set <math|\<cal-H\><rsub|fin>> serves as
    <math|L<rsub|\<psi\>> \<varepsilon\>>-optimal approximation of
    <math|\<cal-H\><rsub|inf>>.
  </example>

  <subsection|Regret Analysis>

  Now, given an infinite hypothesis set <math|\<cal-H\><rsub|inf>> with an
  <math|\<varepsilon\><rsub|\<psi\>>>-optimal approximation set
  <math|\<cal-H\><rsub|fin>>, we are prepared to execute the MEX algorithm
  within the confines of <math|\<cal-H\><rsub|fin>>. The regret analysis is
  given in the following Theorem.

  <\theorem>
    <label|thm:inf>Given an MDP with generalized eluder coefficient
    <math|d<rsub|GEC><around*|(|\<cdot\>|)>> and an infinite hypothesis class
    <math|\<cal-H\><rsub|inf><rsup|>> with
    <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\><rsub|inf>>. For any
    <math|\<varepsilon\><rsub|\<psi\>>>-optimal approximation
    <math|\<cal-H\><rsub|fin><rsup|>> of <math|\<cal-H\><rsub|inf><rsup|>>,
    by setting

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
      K>+<with|color|blue|K\<varepsilon\><rsub|\<psi\>>>.
    </equation*>
  </theorem>

  <\proof>
    By the choice of <math|\<pi\><rsup|k>>, we have

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>,\<pi\><rsup|\<ast\>><rsub|det>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>\<leq\>V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>
    </equation*>

    for all <math|k\<in\><around*|[|K|]>>. By Definition
    <reference|def:fin-cover>,

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>,\<pi\><rsup|\<ast\>><rsub|det>|)>\<geq\>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-\<varepsilon\><rsub|\<psi\>>.
    </equation*>

    Thus,

    <\equation*>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>+\<varepsilon\><rsub|\<psi\>>.
    </equation*>

    Follow the same procedure in the proof of Theorem <reference|thm:fin>
    leads to the proof.
  </proof>

  <\remark>
    The linear term <math|K\<varepsilon\><rsub|\<psi\>>> cannot be
    eliminated. Consider the best case where
    <math|\<pi\><rsup|k>=\<pi\><rsup|\<ast\>><rsub|det>> for all
    <math|k\<in\><around*|[|K|]>>. The regret is

    <\align>
      <tformat|<table|<row|<cell|Regret<around*|(|K|)>=>|<cell|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>,\<pi\><rsup|\<ast\>><rsub|det>|)>-<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>>|<row|<cell|=>|<cell|K<around*|(|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>,\<pi\><rsup|\<ast\>><rsub|det>|)>-<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>|)>>>|<row|<cell|\<leq\>>|<cell|K\<varepsilon\><rsub|\<psi\>>.>>>>
    </align>
  </remark>

  <section|Appendix>

  <subsection|Lemmas>

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

  <subsection|Proof of Theorem <reference|thm:fin>><label|app:thm-fin>

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
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>\<leq\>V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>
    </equation*>

    for all <math|k\<in\><around*|[|K|]>>. Thus,

    <\equation>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>.<label|eq:gen-error>
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
    <math|\<pi\><rsup|k>\<in\>\<cal-H\><rsub|fin>>,

    <\align>
      <tformat|<table|<row|<cell|L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>\<leq\>>|<cell|-2<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2log<around*|(|H
      n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>.>>>>
    </align>

    Substituting the above equation into <eqref|eq:gen-error> gives us that
    with probability at least <math|1-\<delta\>>, for any
    <math|k\<in\><around*|[|K|]>>, <math|\<mu\><rsup|s>=\<psi\><around*|(|\<pi\><rsup|s>|)>>
    and <math|\<pi\><rsup|k>\<in\>\<cal-H\><rsub|fin>>

    <\equation*>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>-2\<eta\><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2H\<eta\>log<around*|(|H
      n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>.
    </equation*>

    Summing over <math|<around*|[|K|]>> gives us

    <\equation*>
      <text|Term (i)>\<leq\>-2\<eta\><big|sum><rsub|k=1><rsup|K><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2\<eta\>
      K H log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>.
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

  <\bibliography|bib|tm-plain|../reference>
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
    <associate|app:thm-fin|<tuple|3.2|4>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|3|5>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|2|2>>
    <associate|auto-5|<tuple|2.1|2>>
    <associate|auto-6|<tuple|2.2|3>>
    <associate|auto-7|<tuple|3|4>>
    <associate|auto-8|<tuple|3.1|4>>
    <associate|auto-9|<tuple|3.2|4>>
    <associate|bib-liu_one_2023|<tuple|1|5>>
    <associate|def:fin-cover|<tuple|8|2>>
    <associate|eq:cond-exp|<tuple|2|4>>
    <associate|eq:gen-error|<tuple|3|5>>
    <associate|eq:st-condition|<tuple|6|2>>
    <associate|eq:union-bound|<tuple|1|4>>
    <associate|lem:loss-upperbound|<tuple|14|4>>
    <associate|thm:fin|<tuple|5|2>>
    <associate|thm:inf|<tuple|12|3>>
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
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Regret
      Analysis for Finite Hypothesis Set>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Oracle and Type Number
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Regret Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Regret
      Analysis for Infinite Hypothesis Set>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Approximate an Infinite
      Hypothesis Set by a Finite Hypothesis Set
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Regret Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Lemmas
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Proof of Theorem
      <reference|thm:fin> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>