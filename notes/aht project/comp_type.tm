<TeXmacs|2.1.2>

<style|generic>

<\body>
  A complexity measure based on the set of partners' policies should be
  introduced. Suppose such a measure exists and is denoted as
  <math|d<rsub|type>>, <math|d<rsub|type>> should satisfies

  <\itemize>
    <item>For <math|\<cal-H\><rsup|\<dag\>>\<triangleq\>\<cal-H\>\<cup\>\<pi\><rprime|'>>,
    where <math|\<exists\>\<pi\>\<in\>\<cal-H\>>,
    <math|\<pi\><above|\<sim\>|\<psi\>>\<pi\><rprime|'>>,
    <math|d<rsub|type><around*|(|\<cal-H\>|)>\<geq\>d<rsub|type><around*|(|\<cal-H\><rsup|\<dagger\>>|)>>.

    <item>For <math|\<cal-H\><rsup|+>\<triangleq\>\<cal-H\>\<cup\>\<pi\><rprime|'>>,
    where <math|\<pi\><rprime|'>\<nin\>\<cal-H\>> and
    <math|\<pi\><above|\<nsim\>|\<psi\>>\<pi\><rprime|'>>,
    <math|d<rsub|type><around*|(|\<cal-H\>|)>\<leq\>d<rsub|type><around*|(|\<cal-H\><rsup|+>|)>>.
  </itemize>

  <\lemma>
    For <math|d<rsub|type>> that satisfies the above properties,
    <math|d<rsub|type><around*|(|\<cal-H\>|)>=d<rsub|type><around*|(|\<cal-H\><rsub|type>|)>>
    for all minimum type independent subset <math|\<cal-H\><rsub|type>> of
    <math|\<cal-H\>>.
  </lemma>

  Let us define

  <\equation*>
    BR<rsup|\<psi\>><around*|(|\<cal-H\>|)>\<triangleq\><around*|{|\<psi\><around*|(|\<pi\>|)>\<mid\>\<pi\>\<in\>\<cal-H\>|}>.
  </equation*>

  <\equation*>
    d<rsub|type><around*|(|\<cal-H\>,<wide|\<pi\>|\<bar\>>,\<gamma\>|)>\<triangleq\>min<rsub|\<mu\>\<in\>BR<rsup|\<psi\>>*<around*|(|\<cal-H\>|)>>max<rsub|\<pi\>\<in\>\<cal-H\>><around*|[|V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>-V<around*|(|\<mu\>,\<pi\>|)>-\<gamma\>\<cdot\>D<rsub|H><rsup|2><around*|(|\<psi\><around*|(|\<pi\>|)>,\<psi\><around*|(|<wide|\<pi\>|\<bar\>>|)>|)>|]>
  </equation*>

  \;

  <\remark>
    <math|dec<rsub|\<gamma\>><around*|(|\<cal-H\>=<around*|[|N|]>|)>=N/\<gamma\>>
  </remark>

  <\example>
    <em|(MAB)> <math|\<cal-H\>=<around*|[|N|]>>.
    <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>=N/2>.\ 

    <\equation*>
      d<rsub|type><around*|(|\<cal-H\>,<wide|\<pi\>|\<bar\>>,\<gamma\>|)>\<triangleq\>min<rsub|\<mu\>\<in\>BR<rsup|\<psi\>>*<around*|(|\<cal-H\>|)>>max<rsub|\<pi\>\<in\>\<cal-H\>><around*|[|1-V<around*|(|\<mu\>,\<pi\>|)>-\<gamma\>\<cdot\>D<rsub|H><rsup|2><around*|(|\<psi\><around*|(|\<pi\>|)>,\<psi\><around*|(|<wide|\<pi\>|\<bar\>>|)>|)>|]>=0?
    </equation*>

    \;
  </example>

  <\lemma>
    For all <math|<wide|\<pi\>|\<bar\>>\<in\>\<cal-H\><rsup|\<dagger\>>>,
    <math|d<rsub|type><around*|(|\<cal-H\>,<wide|\<pi\>|\<bar\>>,\<gamma\>|)>\<geq\>d<rsub|type><around*|(|\<cal-H\><rsup|\<dagger\>>,<wide|\<pi\>|\<bar\>>,\<gamma\>|)>>.
  </lemma>

  <\proof>
    We have

    <\equation*>
      arg max<rsub|\<pi\>\<in\>\<cal-H\><rsup|\<dagger\>>><around*|[|V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>-V<around*|(|\<mu\>,\<pi\>|)>-\<gamma\>\<cdot\>D<rsub|H><rsup|2><around*|(|\<psi\><around*|(|\<pi\>|)>,\<psi\><around*|(|<wide|\<pi\>|\<bar\>>|)>|)>|]>\<in\>\<cal-H\>
    </equation*>

    For the case that

    <\equation*>
      arg max<rsub|\<pi\>\<in\>\<cal-H\><rsup|\<dagger\>>><around*|[|V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>-V<around*|(|\<mu\>,\<pi\>|)>-\<gamma\>\<cdot\>D<rsub|H><rsup|2><around*|(|\<psi\><around*|(|\<pi\>|)>,\<psi\><around*|(|<wide|\<pi\>|\<bar\>>|)>|)>|]>=\<pi\><rprime|'>
    </equation*>

    We have\ 

    <\equation*>
      d<rsub|type><around*|(|\<cal-H\><rsup|\<dagger\>>,<wide|\<pi\>|\<bar\>>,\<gamma\>|)>=min<rsub|\<mu\>\<in\>BR<rsup|\<psi\>><around*|(|\<cal-H\><rsup|\<dagger\>>|)>><around*|[|V<around*|(|\<psi\><around*|(|\<pi\><rprime|'>|)>,\<pi\><rprime|'>|)>-V<around*|(|\<mu\>,\<pi\><rprime|'>|)>-\<gamma\>\<cdot\>D<rsub|H><rsup|2><around*|(|\<psi\><around*|(|\<pi\><rprime|'>|)>,\<psi\><around*|(|<wide|\<pi\>|\<bar\>>|)>|)>|]>.
    </equation*>

    By definition, there exitst <math|\<pi\><rprime|''>\<in\>\<cal-H\>> such
    that <math|\<psi\><around*|(|\<pi\>|)>=\<psi\><around*|(|\<pi\><rprime|''>|)>>.
    Thus,

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rprime|'>|)>,\<pi\><rprime|'>|)>-V<around*|(|\<mu\>,\<pi\><rprime|'>|)>-\<gamma\>\<cdot\>D<rsub|H><rsup|2><around*|(|\<psi\><around*|(|\<pi\><rprime|'>|)>,\<psi\><around*|(|<wide|\<pi\>|\<bar\>>|)>|)>=V<around*|(|\<psi\><around*|(|\<pi\><rprime|'>|)>,\<pi\><rprime|'>|)>-V<around*|(|\<mu\>,\<pi\><rprime|'>|)>-\<gamma\>\<cdot\>D<rsub|H><rsup|2><around*|(|\<psi\><around*|(|\<pi\><rprime|''>|)>,\<psi\><around*|(|<wide|\<pi\>|\<bar\>>|)>|)>
    </equation*>
  </proof>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>