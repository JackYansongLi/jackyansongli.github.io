<TeXmacs|2.1.2>

<style|generic>

<\body>
  <doc-data|<doc-title|Case Study: Realizability Case>>

  Consider a normal-form game defined as <math|<around*|(|2,A<rsub|joint>=<around*|[|N|]><rsup|2>,r<rsub|joint>=<around*|(|V,V|)>|)>>.
  The shared reward function <math|r> is defined as\ 

  <\equation*>
    V<around*|(|a,b|)>=<choice|<tformat|<table|<row|<cell|1>|<cell|if<space|1em>a=b>>|<row|<cell|0>|<cell|if<space|1em>a\<neq\>b>>>>>.
  </equation*>

  Now, assume the player <math|2> only takes pure strategy, i.e.,
  <math|\<cal-H\><rsup|\<ast\>>=<around*|[|N|]>>. From player <math|1>'s
  perspective, the possible reward functions assigned to her are

  <\equation*>
    \<cal-F\>\<triangleq\><around*|{|V<rsub|b>\<mid\>V<rsub|b><around*|(|\<cdot\>|)>=V<around*|(|\<cdot\>,b|)>,b\<in\><around*|[|N|]>|}>.
  </equation*>

  In the following, we will reduce the proof used for regret bound of MEX
  algorithm in this simple example. We set <math|\<cal-H\>=<around*|[|N|]>>
  and <math|\<pi\><rsup|\<ast\>>=N>. Also, since there is no state
  transition, we apply the Hellinger distance and the loss function for
  estimation on the reward.

  <section|GEC term>

  First to note that the Hellinger distance defined as

  <\equation*>
    \<ell\><around*|(|\<pi\><rsup|k>;<around*|(|a,r|)>|)>\<triangleq\>D<rsub|H><around*|(|V<around*|(|\<cdot\>\<mid\>a,\<pi\><rsup|k>|)>,V<around*|(|\<cdot\>\<mid\>a,\<pi\><rsup|\<ast\>>|)>|)>
  </equation*>

  always equals <math|1/<sqrt|2>> for all <math|k\<in\><around*|[|K|]>> where
  <math|\<pi\><rsup|k>\<neq\>\<pi\><rsup|\<ast\>>>. <with|color|red|Denote
  <math|n<around*|(|K|)>> as <math|<around*|\||<around*|{|\<pi\><rsup|k<rprime|'>>\<mid\>\<pi\><rsup|k<rprime|'>>\<neq\>\<pi\><rsup|\<ast\>>,\<pi\><rsup|k<rprime|'>>\<in\><around*|{|\<pi\><rsup|k>|}><rsub|k=1><rsup|K>|}>|\|>>>.
  The training error <math|\<cal-L\><rsub|train><around*|(|\<pi\><rsup|k>|)>>
  defined as

  <\equation*>
    \<cal-L\><rsub|train><around*|(|\<pi\><rsup|k>|)>=<big|sum><rsub|k=1><rsup|K><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|a\<sim\>\<psi\><around*|(|\<pi\><rsup|k>|)>><around*|[|\<ell\><around*|(|\<pi\><rsup|k>;<around*|(|a,r|)>|)>|]>
  </equation*>

  equals

  <\equation*>
    \<cal-L\><rsub|train><around*|(|\<pi\><rsup|k>|)>=<big|sum><rsub|k=1><rsup|K><frac|n<around*|(|k-1|)>|<sqrt|2>>.
  </equation*>

  Also, define <math|\<varphi\>> as

  <\equation*>
    \<varphi\><around*|(|\<alpha\>,\<varepsilon\>,K|)>\<triangleq\><frac|d<around*|(|\<varepsilon\>|)>|2\<alpha\>>+<sqrt|d<around*|(|\<varepsilon\>|)>
    K>+\<varepsilon\>K.
  </equation*>

  Now, the GEC assumption states that: there exist an
  <math|d<around*|(|\<varepsilon\>|)>\<gtr\>0>, such that for all
  <math|<around*|{|\<pi\><rsup|k>|}>\<subset\>\<cal-H\>>,

  <\equation*>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>\<leq\>inf<rsub|\<alpha\>\<gtr\>0><around*|{|<frac|\<alpha\>|2>\<cal-L\><rsub|train><around*|(|\<pi\><rsup|k>|)>+\<varphi\><around*|(|\<alpha\>,\<varepsilon\>,K|)>|}>.
  </equation*>

  Combining all above equations gives us

  <\align>
    <tformat|<table|<row|<cell|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>\<leq\>>|<cell|inf<rsub|\<alpha\>\<gtr\>0><around*|{|\<alpha\><big|sum><rsub|k=1><rsup|K><frac|n<around*|(|k-1|)>|2<sqrt|2>>+<frac|d<around*|(|\<varepsilon\>|)>|2\<alpha\>>+<sqrt|d<around*|(|\<varepsilon\>|)>
    K>+\<varepsilon\>K|}>>>|<row|<cell|=>|<cell|<sqrt|<frac|<big|sum><rsub|k=1><rsup|K>n<around*|(|k-1|)>d<around*|(|\<varepsilon\>|)>|<sqrt|2>>>+<sqrt|d<around*|(|\<varepsilon\>|)>
    K>+\<varepsilon\>K.>>>>
  </align>

  It is clear that\ 

  <\equation*>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>\<leq\>K.
  </equation*>

  Thus, a sufficient condition for GEC assumption to hold is to make

  <\equation*>
    K\<leq\><sqrt|<frac|<big|sum><rsub|k=1><rsup|K>n<around*|(|k-1|)>d<around*|(|\<varepsilon\>|)>|<sqrt|2>>>+<sqrt|d<around*|(|\<varepsilon\>|)>
    K>+\<varepsilon\>K.
  </equation*>

  Note that <math|n<around*|(|k-1|)>\<less\>k-1>. Thus, a sufficient
  condition for the above inequality is

  <\equation*>
    K\<leq\><sqrt|<frac|<around*|(|K<rsup|2>-K|)>d<around*|(|\<varepsilon\>|)>|2<sqrt|2>>>+<sqrt|d<around*|(|\<varepsilon\>|)>
    K>+\<varepsilon\>K.
  </equation*>

  Rearranging the above inequality gives

  <\equation*>
    d<around*|(|\<varepsilon\>|)>\<geq\><around*|(|<frac|<around*|(|1-\<varepsilon\>|)>K|<sqrt|<frac|<around*|(|K<rsup|2>-K|)>|2<sqrt|2>>>+<sqrt|
    K>>|)><rsup|2>.
  </equation*>

  <section|Type term>

  The estimation loss function <math|L> is defined as\ 

  <\equation*>
    L<rsup|k><around*|(|\<pi\>|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|if
    r<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\><rsup|\<ast\>>|)>=1>>|<row|<cell|1>|<cell|if
    r<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\><rsup|\<ast\>>|)>=0>>>>>.
  </equation*>

  It is clear that <math|L<rsup|k><around*|(|\<pi\>|)>=1> for all
  <math|k\<in\><around*|[|K|]>> such that
  <math|\<pi\>\<neq\>\<pi\><rsup|\<ast\>>> in our setting. By on the choice
  of <math|\<pi\><rsup|k>> (based on the MEX algorithm), the type term is
  bounded by

  <\equation*>
    V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>\<leq\>\<eta\><big|sum><rsub|k><around*|(|L<rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsup|k-1><around*|(|\<pi\><rsup|k>|)>|)>,
  </equation*>

  where <math|\<varepsilon\><rsub|\<cal-H\>>=0>. The term

  <\equation*>
    L<rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsup|k-1><around*|(|\<pi\><rsup|k>|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|if
    \<pi\><rsup|k>=\<pi\><rsup|\<ast\>>>>|<row|<cell|-1>|<cell|if
    \<pi\><rsup|k>\<neq\>\<pi\><rsup|\<ast\>>>>>>>.
  </equation*>

  Thus, the upper bound of the type term can be expressed as

  <\equation*>
    V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>\<leq\>-\<eta\>n<around*|(|k-1|)>.
  </equation*>

  Combining all these equations gives us

  <\equation*>
    Reg<around*|(|K|)>\<leq\><wide*|<sqrt|<frac|<big|sum><rsub|k=1><rsup|K>n<around*|(|k-1|)>d<around*|(|\<varepsilon\>|)>|<sqrt|2>>>+\<varepsilon\>K|\<wide-underbrace\>><rsub|GEC><wide*|-\<eta\><big|sum><rsub|k=1><rsup|K>n<around*|(|k-1|)>|\<wide-underbrace\>><rsub|L<rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsup|k-1><around*|(|\<pi\><rsup|k>|)>>+sublinear
    term.
  </equation*>

  The upper bound of GEC term together with the upper bound of
  <math|L<rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsup|k-1><around*|(|\<pi\><rsup|k>|)>>
  are cancled out if we choose <math|\<eta\>> properly.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../../../../../.Xmacs/texts/scratch/no_name_13.tm>>
    <associate|auto-2|<tuple|2|2|../../../../../../.Xmacs/texts/scratch/no_name_13.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>GEC
      term> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Type
      term> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>