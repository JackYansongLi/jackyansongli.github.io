<TeXmacs|2.1.1>

<style|generic>

<\body>
  The real <math|\<pi\><rsup|\<ast\>>> is in
  <math|\<cal-H\><rsub|\<varepsilon\>>>.

  <\enumerate>
    <item>MEX with <math|\<cal-H\><rsub|\<varepsilon\>>> performs worse than
    MEX with <math|\<cal-H\>>?
  </enumerate>

  <\example>
    <math|\<mu\><rsub|1>>, <math|\<mu\><rsub|2>\<in\>BR<around*|(|\<pi\><rsup|\<ast\>>|)>>.
    However, <math|\<mu\><rsub|1>\<nin\>BR<around*|(|\<pi\><rsup|\<ast\>><rsub|\<varepsilon\>>|)>>
    and <math|\<mu\><rsub|2>\<in\>BR<around*|(|\<pi\><rsup|\<ast\>><rsub|\<varepsilon\>>|)>>.
  </example>

  <\equation>
    <below|argmax|\<pi\>\<in\>\<cal-H\>><around*|(|V<around*|(|BR<around*|(|\<pi\>|)>,\<pi\>|)>-L<rsub|\<cal-D\>><around*|(|\<pi\>|)>|)>=\<pi\><rsup|\<ast\>><label|eq:deter-mex>
  </equation>

  and

  <\equation>
    <below|argmax|\<pi\>\<in\>\<cal-H\><rsub|\<varepsilon\>>><around*|(|V<around*|(|BR<around*|(|\<pi\>|)>,\<pi\>|)>-L<rsub|\<cal-D\>><around*|(|\<pi\>|)>|)>=\<pi\><rsup|\<ast\>><rsub|\<varepsilon\>><label|eq:sto-mex>
  </equation>

  <\question>
    When using <eqref|eq:deter-mex>, how do we guarantee that
    <math|\<mu\><rsub|2>> instead of <math|\<mu\><rsub|1>> is chosen?
  </question>

  <section|>

  <\theorem>
    (Informal) <math|\<pi\><rsup|\<ast\>><rsub|\<varepsilon\>>\<in\>\<cal-H\><rsub|\<varepsilon\>>>.
    With a small <math|\<varepsilon\>>, MEX algorithm with <math|\<cal-H\>>
    performs as well as MEX with <math|\<cal-H\><rsub|\<varepsilon\>>>.\ 
  </theorem>

  With small enough <math|\<varepsilon\>>, we have\ 

  <\equation*>
    <prefix-for-all>\<mu\>\<in\>BR<around*|(|\<pi\><rsup|\<ast\>>|)>\<Rightarrow\>\<mu\>\<in\>BR<around*|(|\<pi\><rsup|*\<ast\>><rsub|\<varepsilon\>>|)>.
  </equation*>

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|eq:deter-mex|<tuple|1|?>>
    <associate|eq:sto-mex|<tuple|2|?>>
  </collection>
</references>