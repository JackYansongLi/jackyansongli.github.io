<TeXmacs|2.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>

    <\new-remark|ass>
      Assumption
    </new-remark>

    <\new-theorem|hyp>
      Hypothesis
    </new-theorem>

    \;
  </hide-preamble>

  <doc-data|<doc-title|Finite Reduced Hypothesis
  Set>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|Reduced Hypothesis Set in Regret Analysis>

  We consider the following three definitions for policies be of the same
  type:

  <\def>
    <label|def:strong-type><with|font-shape|italic|(Strong)> We call two
    policies <math|\<pi\>> and <math|\<pi\><rprime|'>> to be of the same
    <with|font-shape|italic|s-type> if\ 

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<mu\>,\<pi\><rprime|'>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\><rprime|'>|)><label|eq:st-condition>
    </equation*>

    for all <math|\<mu\>\<in\>BR<around*|(|\<pi\>|)>> and
    <math|\<mu\><rprime|'>\<in\>BR<around*|(|\<pi\><rprime|'>|)>>. The
    relationship are denoted as <math|\<pi\><above|\<sim\>|s>\<pi\><rprime|'>>.
  </def>

  <\def>
    <with|font-shape|italic|<label|def:sweak-type>(Middle)> We call two
    policies <math|\<pi\>> and <math|\<pi\><rprime|'>> to be of the same
    <with|font-shape|italic|m-type> if there exist an
    <math|\<mu\>\<in\>BR<around*|(|\<pi\>|)>\<cap\>BR<around*|(|\<pi\><rprime|'>|)>>
    such that

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<mu\>,\<pi\><rprime|'>|)>.
    </equation*>

    The relationship are denoted as <math|\<pi\><above|\<sim\>|m>\<pi\><rprime|'>>.
  </def>

  <\def>
    <with|font-shape|italic|<label|def:weak-type>(Weak)> We call two policies
    <math|\<pi\>> and <math|\<pi\><rprime|'>> to be of the same
    <with|font-shape|italic|w-type> if there exist an
    <math|\<mu\>\<in\>BR<around*|(|\<pi\>|)>> and
    <math|\<mu\><rprime|'>\<in\>BR<around*|(|\<pi\><rprime|'>|)>> such that

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<mu\>,\<pi\><rprime|'>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\><rprime|'>|)>.
    </equation*>

    The relationship are denoted as <math|\<pi\><above|\<sim\>|w>\<pi\><rprime|'>>.
  </def>

  Using the above definitions, we can construct a reduced size hypothesis set
  based on the elimination of policies of the same type. The definition if
  given in the following:

  <\def>
    Given a hypothesis set <math|\<cal-H\>>, for any <math|\<pi\>> and
    <math|\<pi\><rprime|'>> be of the same type, we randomly eliminate one of
    them from <math|\<cal-H\>>. The size of the remaining set is denoted as
    <math|n<rsub|stype><around*|(|\<cal-H\>|)>>,
    <math|n<rsub|mtype><around*|(|\<cal-H\>|)>>, and
    <math|n<rsub|wtype><around*|(|\<cal-H\>|)>> depends on the definition of
    type.
  </def>

  By definition, we have the following Corollary.

  <\corollary>
    \ <math|n<rsub|stype><around*|(|\<cal-H\>|)>\<geq\>n<rsub|mtype><around*|(|\<cal-H\>|)>\<geq\>n<rsub|wtype><around*|(|\<cal-H\>|)>>.
  </corollary>

  Recall that the regret of MEX algorithm is upper bounded by

  <\equation>
    Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
    K>|)>\<cdot\>log<around*|(|H n<rsub|stype><around*|(|\<cal-H\>|)>/\<delta\>|)>\<cdot\>H
    K>.<label|eq:reg-strong>
  </equation>

  The term <math|log<around*|(|H n<rsub|stype><around*|(|\<cal-H\>|)>/\<delta\>|)>>
  comes from the fact that <math|V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\><rprime|'>|)>>
  for any <math|\<pi\><above|\<sim\>|s>\<pi\><rprime|'>>, where
  <math|\<mu\>=\<psi\><around*|(|\<pi\>|)>> and
  <math|\<mu\><rprime|'>=\<psi\><around*|(|\<pi\><rprime|'>|)>>. The function
  <math|\<psi\>> is an oracle provided by the algorithm that returns a best
  response. In the following, let us define type under the oracle
  <math|\<psi\>>.

  <\def>
    <label|def:ty-ora>(<with|font-shape|italic|Oracle>) We call two policies
    <math|\<pi\>> and <math|\<pi\><rprime|'>> to be of the same
    <with|font-shape|italic|type> under oracle <math|\<psi\>> if for
    <math|\<mu\>=\<psi\><around*|(|\<pi\>|)>> and
    <math|\<mu\><rprime|'>=\<psi\><around*|(|\<pi\><rprime|'>|)>> we have

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\><rprime|'>|)>
    </equation*>

    The relationship are denoted as <math|\<pi\><above|\<sim\>|\<psi\>>\<pi\><rprime|'>>.
    Similarly, the size of a reduced hypothesis set is denoted by
    <math|n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>>.
  </def>

  With Definition <reference|def:ty-ora>, we can reduce the upper bound in
  <eqref|eq:reg-strong> by\ 

  <\equation*>
    Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
    K>|)>\<cdot\>log<around*|(|H n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>\<cdot\>H
    K>
  </equation*>

  Also, follow the Definition <reference|def:ty-ora>, we have the following
  Corollaries:

  <\corollary>
    <math|n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>\<leq\>n<rsub|stype><around*|(|\<cal-H\>|)>>
    if <math|\<psi\>> is a best response oracle, i.e.,
    <math|\<psi\><around*|(|\<pi\>|)>\<in\>BR<around*|(|\<pi\>|)>> for any
    <math|\<pi\>\<in\>\<cal-H\>>.
  </corollary>

  <\corollary>
    <math|n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>\<leq\>n<rsub|mtype><around*|(|\<cal-H\>|)>>
    if <math|\<psi\>> is a best response oracle and
    <math|\<psi\><around*|(|\<pi\>|)>=\<psi\><around*|(|\<pi\><rprime|'>|)>>
    for any <math|\<pi\><above|\<sim\>|m>\<pi\><rprime|'>>.
  </corollary>

  <\corollary>
    <math|n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>\<leq\>n<rsub|wtype><around*|(|\<cal-H\>|)>>
    if <math|\<psi\>> is a best response oracle and
    <math|V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>=V<around*|(|\<psi\><around*|(|\<pi\><rprime|'>|)>,\<pi\><rprime|'>|)>>
    for any <math|\<pi\><above|\<sim\>|w>\<pi\><rprime|'>>.
  </corollary>

  <section|Response Distance>

  For a hypothesis set <math|\<cal-H\>>, we define
  <math|\<cal-H\><rsup|\<varepsilon\>>> as follows:

  <\equation*>
    \<cal-H\><rsup|\<varepsilon\>>\<triangleq\><around*|{|\<pi\><rsub|\<varepsilon\>>:<around*|\<\|\|\>|\<pi\>-\<pi\><rsub|\<varepsilon\>>|\<\|\|\>>\<leq\>\<varepsilon\>,\<pi\>\<in\>\<cal-H\>|}>.
  </equation*>

  Directly apply the upper bound in <eqref|eq:reg-strong> gives us

  <\equation*>
    Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
    K>|)>\<cdot\>log<around*|(|H n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\><rsup|\<varepsilon\>>|)>/\<delta\>|)>\<cdot\>H
    K>.<label|eq:inf-upper>
  </equation*>

  The term <math|n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\><rsup|\<varepsilon\>>|)>>
  might be infinite. To deal with the infinity, let us make the following
  definition:

  <\def>
    The response distance between two policies <math|\<pi\>> and
    <math|\<pi\><rprime|'>> under oracle <math|\<psi\>> is defined as\ 

    <\equation*>
      d<rsub|\<psi\>><around*|(|\<pi\>,\<pi\><rprime|'>|)>\<triangleq\><around*|\||V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rprime|'>|)>,\<pi\><rprime|'>|)>|\|>.
    </equation*>
  </def>

  With the response distance, we can make a weaker definition than the type
  under oracle.

  <\def>
    <label|def:appro-type>We call two policies <math|\<pi\>> and
    <math|\<pi\><rprime|'>> to be of the same
    <math|\<varepsilon\><rsub|\<psi\>>>-<with|font-shape|italic|type> under
    oracle <math|\<psi\>> if <math|d<rsub|\<psi\>><around*|(|\<pi\>,\<pi\><rprime|'>|)>\<leq\>\<varepsilon\><rsub|\<psi\>>>.
    The relationship are denoted as <math|\<pi\><above|\<sim\>|\<varepsilon\><rsub|\<psi\>>>\<pi\><rprime|'>>.
    Similarly, the size of a reduced hypothesis set is denoted by
    <math|n<rsub|type><rsup|\<varepsilon\><rsub|\<psi\>>><around*|(|\<cal-H\>|)>>.
  </def>

  <\corollary>
    <math|n<rsub|type><rsup|\<varepsilon\><rsub|\<psi\>>><around*|(|\<cal-H\>|)>\<leq\>n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>>.
  </corollary>

  <\lemma>
    <label|cor:transition>If <math|\<pi\><above|\<sim\>|\<psi\>>\<pi\><rprime|'>>,
    <math|\<pi\><above|\<sim\>|\<varepsilon\><rsub|\<psi\>>>\<pi\><rsub|\<varepsilon\>>>,
    and <math|\<pi\><rprime|'><above|\<sim\>|\<varepsilon\><rsub|\<psi\>>>\<pi\><rsub|\<varepsilon\>><rprime|'>>.
    Then, <math|\<pi\><rsub|\<varepsilon\>><above|\<sim\>|2\<varepsilon\><rsub|\<psi\>>>\<pi\><rsub|\<varepsilon\>><rprime|'>>.
  </lemma>

  Now, we make the following assumption.

  <\ass>
    (Covering and completeness)<label|ass:oracle-distance> The oracle
    <math|\<psi\>> and the <math|\<varepsilon\>> satisfies the following
    condition: There exist a constant <math|\<varepsilon\><rsub|\<psi\>>\<geq\>0>
    such that for all <math|\<pi\><rsub|\<varepsilon\>>\<in\>\<cal-H\><rsup|\<varepsilon\>>>,
    there exist a <math|\<pi\><rsub|>\<in\>\<cal-H\><rsup|>> such that
    <math|d<rsub|\<psi\>><around*|(|\<pi\>,\<pi\><rsub|\<varepsilon\>>|)>\<leq\>\<varepsilon\><rsub|\<psi\>>\<less\>1/<around*|(|2<sqrt|H
    K>|)>>. We also require such a mapping from
    <math|\<cal-H\><rsup|\<varepsilon\>>> to <math|\<cal-H\><rsup|>> be
    surjective, i.e., for all <math|\<pi\><rsub|>\<in\>\<cal-H\>>, there is a
    subset <math|\<cal-H\><rsub|sub><rsup|\<varepsilon\>>> of
    <math|\<cal-H\><rsup|\<varepsilon\>>>, such that for all
    <math|\<pi\><rsub|\<varepsilon\>>\<in\>\<cal-H\><rsup|\<varepsilon\>><rsub|sub>>,
    <math|d<rsub|\<psi\>><around*|(|\<pi\>,\<pi\><rsub|\<varepsilon\>>|)>\<leq\>\<varepsilon\><rsub|\<psi\>>\<less\>1/<around*|(|2<sqrt|H
    K>|)>>.
  </ass>

  <\question>
    If <math|\<varepsilon\>> increases, will condition
    <math|d<rsub|\<psi\>><around*|(|\<pi\>,\<pi\><rsub|\<varepsilon\>>|)>\<leq\>\<varepsilon\><rsub|\<psi\>>\<less\>1/<around*|(|2<sqrt|H
    K>|)>> easier to be satisfied?
  </question>

  With Definition <reference|def:appro-type> and Assumption
  <reference|ass:oracle-distance>, we can prove that the upper bound in
  <eqref|eq:inf-upper> can be replaced by\ 

  <\equation*>
    Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|<with|color|red|1/<sqrt|H
    K>-2\<varepsilon\><rsub|\<psi\>>>|)>\<cdot\>log<around*|(|H
    <with|color|red|n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>>/\<delta\>|)>\<cdot\>H
    K>.
  </equation*>

  Before we prove the above result, let us introduce the following lemma.

  <\lemma>
    <label|lem:same-size>With Assumption <reference|ass:oracle-distance>,
    <math|n<rsub|type><rsup|2\<varepsilon\><rsub|\<psi\>>><around*|(|\<cal-H\><rsup|\<varepsilon\>>|)>\<leq\>n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>>.
  </lemma>

  <\proof>
    By Assumption <reference|ass:oracle-distance>, for all
    <math|\<pi\><rsub|>\<in\>\<cal-H\>>, there is a subset
    <math|\<cal-H\><rsub|sub><rsup|\<varepsilon\>>> of
    <math|\<cal-H\><rsup|\<varepsilon\>>>, such that for all
    <math|\<pi\><rsub|\<varepsilon\>>\<in\>\<cal-H\><rsup|\<varepsilon\>><rsub|sub>>,
    <math|d<rsub|\<psi\>><around*|(|\<pi\>,\<pi\><rsub|\<varepsilon\>>|)>\<leq\>\<varepsilon\><rsub|\<psi\>>\<less\>1/<around*|(|2<sqrt|H
    K>|)>>. By Lemma <reference|cor:transition>, for all
    <math|\<pi\><rsub|\<varepsilon\>>\<in\>\<cal-H\><rsub|sub><rsup|\<varepsilon\>>>
    and <math|\<pi\><rsub|\<varepsilon\>><rprime|'>\<in\>\<cal-H\><rsub|sub><rsup|\<varepsilon\>>>,
    <math|\<pi\><rsub|\<varepsilon\>><above|\<sim\>|2\<varepsilon\><rsub|\<psi\>>>\<pi\><rsub|\<varepsilon\>><rprime|'>>.
  </proof>

  Now we prove the upper bound for the regret.

  <\theorem>
    Suppose the oracle <math|\<psi\>> and the distance <math|\<varepsilon\>>
    satisfies Assumption <reference|ass:oracle-distance>. Given an MDP with
    generalized eluder coefficient <math|d<rsub|GEC><around*|(|\<cdot\>|)>>
    and a finite model-based hypothesis class <math|\<cal-H\><rsup|>> and its
    corresponding infinite hypothesis class
    <math|\<cal-H\><rsup|\<varepsilon\>>> with
    <math|f<rsup|\<ast\>>\<in\>\<cal-H\><rsup|\<varepsilon\>>>, by setting

    <\equation*>
      \<eta\>=<sqrt|<frac|d<rsub|GEC><around*|(|1/<sqrt|H
      K>-2\<varepsilon\><rsub|\<psi\>>|)>|log<around*|(|H<around*|\||n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>|\|>/\<delta\>|)>\<cdot\>H
      K>>,
    </equation*>

    then the regret of the MEX algorithm applying on
    <math|\<cal-H\><rsup|\<varepsilon\>>> with oracle <math|\<psi\>> after
    <math|K> episodes is upper bounded by, with probability at least
    <math|1-\<delta\>>,

    <\equation*>
      Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
      K>-2\<varepsilon\><rsub|\<psi\>>|)>\<cdot\>log<around*|(|H<around*|\||n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>|\|>/\<delta\>|)>\<cdot\>H
      K>.
    </equation*>
  </theorem>

  <\proof>
    We decompose the regret into two terms,\ 

    <\align>
      <tformat|<table|<row|<cell|Regret<around*|(|K|)>\<triangleq\>>|<cell|<big|sum><rsub|k=1><rsup|K><rsub|>V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|\<ast\>>|)>>>|<row|<cell|=>|<cell|<wide*|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>|\<wide-underbrace\>><rsub|<text|Term
      (i)> >+<wide*|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|\<ast\>>|)>|\<wide-underbrace\>><rsub|<text|Term
      <around*|(|ii|)>>>.>>>>
    </align>

    where <math|\<mu\><rsup|k>=\<psi\><around*|(|\<pi\><rsup|k>|)>> and
    <math|\<mu\><rsup|\<ast\>>=\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>>.

    <with|font-series|bold|Term (i).> By the choice of <math|\<pi\><rsup|k>>,
    we have\ 

    <\equation>
      V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>\<leq\>V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>.<label|eq:choice-pi>
    </equation>

    Rearranging <eqref|eq:choice-pi>, we can derive that

    <\equation*>
      <math|V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>.<label|eq:upper-bound><label|eq:measure-error-bound>
    </equation*>

    By Definition <reference|def:appro-type>, for any
    <math|\<pi\><rsup|k><above|\<sim\>|2\<varepsilon\><rsub|\<psi\>>>\<pi\><rsup|k<rprime|'>>>,
    we have

    <\equation*>
      <around*|\||V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-V<around*|(|\<mu\><rsup|k<rprime|'>>,\<pi\><rsup|k<rprime|'>>|)>|\|>\<leq\>2\<varepsilon\><rsub|\<psi\>>
    </equation*>

    where <math|\<mu\><rsup|k>=\<psi\><around*|(|\<pi\><rsup|k>|)>> and
    <math|\<mu\><rsup|k<rprime|'>>=\<psi\><around*|(|\<pi\><rsup|k<rprime|'>>|)>>.
    Thus, an upper bound for <math|V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>>
    is also an upper bound for <math|V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k<rprime|'>>,\<pi\><rsup|k<rprime|'>>|)>+2\<varepsilon\><rsub|\<psi\>>>.
    Formally, for any constant <math|c> such that

    <\equation*>
      c\<geq\>V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>
    </equation*>

    we also have

    <\equation*>
      c+2\<varepsilon\><rsub|\<psi\>>\<geq\>V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k<rprime|'>>,\<pi\><rsup|k<rprime|'>>|)>.
    </equation*>

    Applying Lemma <reference|lem:loss-upperbound> and Lemma
    <reference|lem:same-size>, we have that with probability at least
    <math|1-\<delta\>>, for any any <math|<around*|(|h,k|)>\<in\><around*|[|H|]>\<times\><around*|[|K|]>><math|>,
    <math|\<mu\><rsup|s>=\<psi\><around*|(|\<pi\><rsup|s>|)>> and
    <math|\<pi\><rsup|k>\<in\>\<cal-H\><rsup|\<varepsilon\>>>,

    <\align>
      <tformat|<table|<row|<cell|L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>\<leq\>>|<cell|-2<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2log<around*|(|H
      n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>.>>>>
    </align>

    Substituting the above equation into <eqref|eq:measure-error-bound> gives
    us

    <\equation*>
      <math|V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>-2\<eta\><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2H\<eta\>log<around*|(|H
      n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>+<with|color|red|2H\<varepsilon\><rsub|\<psi\>>>
    </equation*>

    Now, sum over <math|<around*|[|K|]>> gives us

    <\equation*>
      <text|Term (i)>\<leq\>-2\<eta\><big|sum><rsub|k=1><rsup|K><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2\<eta\>
      K H log<around*|(|H n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>+<with|color|red|2H
      K\<varepsilon\><rsub|\<psi\>>>.
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
      K>+\<varepsilon\><rsub|conf>H K+<with|color|red|2H
      K\<varepsilon\><rsub|\<psi\>>>.>>>>
    </align>

    By taking <math|<with|color|red|\<varepsilon\><rsub|conf>=1/<sqrt|H
    K>-2\<varepsilon\><rsub|\<psi\>>>>, <math|\<eta\>=<sqrt|<frac|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>|log<around*|(|H
    n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>\<cdot\>H
    K>>>, we can derive that, with probability at least <math|1-\<delta\>>,
    it holds that

    <\equation*>
      Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
      K>-2\<varepsilon\><rsub|\<psi\>>|)>\<cdot\>log<around*|(|H
      n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>\<cdot\>H
      K>.
    </equation*>

    \ Note that <math|\<varepsilon\><rsub|conf>\<gtr\>0> by Assumption
    <reference|ass:oracle-distance>.
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

  \ 

  <section|Finite Reduced Hypothesis Set (Do not read)>

  <\question>
    Is <math|n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\><rsup|\<varepsilon\>>|)>\<less\>\<infty\>>?
  </question>

  <\corollary>
    <math|n<rsub|stype><around*|(|\<cal-H\><rsup|\<varepsilon\>>|)>\<less\>\<infty\>\<Rightarrow\>><math|n<rsub|type><rsup|\<psi\>><around*|(|\<cal-H\><rsup|\<varepsilon\>>|)>\<less\>\<infty\>>,
    if <math|\<psi\>> is a best response oracle.
  </corollary>

  <\hyp>
    <label|hyp:equi-when-small-epsilon><math|\<pi\><rsub|\<varepsilon\><rprime|'>><above|\<sim\>|s>\<pi\><rsub|\<varepsilon\><rprime|''>>>
    for <math|0\<less\>\<varepsilon\><rprime|'>\<less\>\<alpha\>> and
    <math|0\<less\>\<varepsilon\><rprime|''>\<less\>\<alpha\>>\ 
  </hyp>

  <\theorem>
    If Hypothesis <reference|hyp:equi-when-small-epsilon> holds, we have
    <math|n<rsub|stype><around*|(|\<cal-H\>|)>\<less\>\<infty\>>.
  </theorem>

  <with|proof-text|<macro|<localize|Proof> Idea>|<\proof>
    \;

    <\enumerate>
      <item><math|\<pi\><rsub|\<varepsilon\><rprime|'>><above|\<sim\>|s>\<pi\><rsub|\<varepsilon\><rprime|''>>>
      for <math|0\<less\>\<varepsilon\><rprime|'>\<less\>\<alpha\>> and
      <math|0\<less\>\<varepsilon\><rprime|''>\<less\>\<alpha\>>\ 

      <item>Thus, <math|n<rsub|stype><around*|(|\<cal-H\><rsup|\<varepsilon\>>|)>\<leq\><frac|\<varepsilon\>|\<alpha\>>n<rsub|stype><around*|(|\<cal-H\>|)>\<less\>\<infty\>>
    </enumerate>
  </proof>>

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
    <associate|ass:oracle-distance|<tuple|14|3>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|5>>
    <associate|auto-4|<tuple|4|5>>
    <associate|auto-5|<tuple|2|5>>
    <associate|bib-liu_one_2023|<tuple|1|5>>
    <associate|cor:transition|<tuple|13|2>>
    <associate|def:appro-type|<tuple|11|2>>
    <associate|def:strong-type|<tuple|1|1>>
    <associate|def:sweak-type|<tuple|2|1>>
    <associate|def:ty-ora|<tuple|6|2>>
    <associate|def:weak-type|<tuple|3|1>>
    <associate|eq:choice-pi|<tuple|2|3>>
    <associate|eq:cond-exp|<tuple|4|5>>
    <associate|eq:inf-upper|<tuple|2|2>>
    <associate|eq:measure-error-bound|<tuple|2|4>>
    <associate|eq:reg-strong|<tuple|1|1>>
    <associate|eq:st-condition|<tuple|1|1>>
    <associate|eq:union-bound|<tuple|3|5>>
    <associate|eq:upper-bound|<tuple|2|4>>
    <associate|hyp:equi-when-small-epsilon|<tuple|19|5>>
    <associate|lem:loss-upperbound|<tuple|17|5>>
    <associate|lem:same-size|<tuple|15|3>>
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
      Hypothesis Set in Regret Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Response
      Distance> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Finite
      Reduced Hypothesis Set (Do not read)>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>