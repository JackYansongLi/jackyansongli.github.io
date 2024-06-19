<TeXmacs|2.1.2>

<style|<tuple|generic|no-page-numbers|reduced-margins|algorithm-2e>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <doc-data|<doc-title|Monte-Carlo Belief State Updates>>

  The hypothesis set is defined as <math|\<cal-H\>=<around*|{|<around*|(|\<bbb-P\><rsub|1>,r<rsub|1>|)>,\<ldots\>,<around*|(|\<bbb-P\><rsub|M>,r<rsub|M>|)>|}>>.
  We abuse the notation <math|<with|font|cal|H>> and <math|<around*|[|M|]>>.
  We approximate the belief state <math|b<around*|(|m,h<rsub|t>|)>> for
  history <math|h<rsub|t>> by <math|K> particles,
  <math|B<rsup|i><rsub|t>\<in\><around*|[|M|]>>, <math|1\<leq\>i\<leq\>K>.
  The approximated belief state <math|<wide|b|^>> is given by

  <\equation*>
    <wide|b|^><around*|(|m,h<rsub|t>|)>=<frac|1|K>
    <big|sum><rsub|i=1><rsup|K>\<delta\><rsub|m B<rsup|i><rsub|t>>,
  </equation*>

  where <math|\<delta\><rsub|m m<rprime|'>>> is the Kronecker delta function.
  At the start of the algorithm, <math|K> particles are sampled from
  <math|<around*|[|M|]>> based on the subjective prior belief
  <math|\<lambda\>\<in\>\<Delta\><rsub|M>>, i.e.,
  <math|B<rsup|i><rsub|0>\<sim\>\<lambda\>>, <math|1\<leq\>i\<leq\>K>.
  <math|B<rsub|t>\<triangleq\><around*|{|B<rsub|t><rsup|1>,\<ldots\>,B<rsub|t><rsup|K>|}>>.

  <\algorithm*>
    <algo2e-input> <math|B<rsub|t-1>>, <math|s<rsub|t>>, <math|a<rsub|t>>

    <algo2e-output> <math|B<rsub|t>>

    <\numbered>
      <math|B<rsub|t>\<leftarrow\>\<emptyset\>>

      <\algo2e-while>
        <math|<around*|\||B<rsub|t>|\|>\<less\>K>
      <|algo2e-while>
        <math|m\<sim\><wide|b|^><around*|(|\<cdot\>,h<rsub|t-1>|)>=<frac|1|K>
        <big|sum><rsub|i=1><rsup|K>\<delta\><rsub|m B<rsup|i><rsub|t-1>>>

        <math|<around*|(|s<rprime|'>\<times\>m,s|)>\<sim\>\<bbb-P\><rsub|m><around*|(|s<rsub|t>,a<rsub|t>|)>>

        <\algo2e-if|<math|s=s>>
          <math|B<rsub|t>\<leftarrow\>B<rsub|t> <big|cup><around*|{|m|}>>
        </algo2e-if>

        <algo2e-end-if>
      </algo2e-while>
    </numbered>
  </algorithm*>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|page-screen-margin|false>
  </collection>
</initial>