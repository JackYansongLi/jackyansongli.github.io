<TeXmacs|2.1.1>

<style|generic>

<\body>
  <doc-data|<doc-title|RL for Latent MDPs>>

  <\enumerate>
    <item>The goal of this algorithm is to learn a policy
    <math|\<pi\><rsup|\<infty\>>> that maximized the averaged reward of a
    LMDP where in each episode, the single MDP
    <math|M<rsub|m>\<in\><with|font|cal|M>> is chosen with probability
    <math|w<rsub|m>>, i.e.,

    <\equation*>
      \<pi\><rsup|\<infty\>>=<below|argmax|\<pi\>>
      V<rsub|<wide|<with|font|cal|M>|~>><rsup|\<pi\>>=<below|argmin|\<pi\>><above|<below|<big|sum>|m=1>|M>w<rsub|m>\<bbb-E\><rsub|m><rsup|\<pi\>><around*|[|<above|<below|<big|sum>|t=1>|H>r<rsub|t>|]>.
    </equation*>

    However, our goal is to find a policy
    <math|\<pi\><rsup|\<infty\>><rsub|>=<around*|(|\<pi\><rsub|1><rsup|\<infty\>>,\<ldots\>,\<pi\><rsub|<around*|\||<with|font|cal|M>|\|>><rsup|\<infty\>>|)>>,
    such that <math|\<pi\><rsup|\<infty\>><rsub|m>> is the optimal policy for
    the single MDP <math|M<rsub|m>\<in\><with|font|cal|M>>, i.e.,

    <\equation*>
      \<pi\><rsup|\<infty\>><rsub|m>=<below|argmax|\<pi\>>
      V<rsub|M<rsub|m>><rsup|\<pi\>>=<below|argmin|\<pi\>>\<bbb-E\><rsub|m><rsup|\<pi\>><around*|[|<above|<below|<big|sum>|t=1>|H>r<rsub|t>|]>
    </equation*>

    for all <math|m>.

    <item>The <math|\<delta\>>-Strongly Separated MDPs are too strong in our
    formulation. To see this, for\ 

    <\equation*>
      \<bbb-P\><rsub|m<rsub|i>><around*|(|s<rprime|'>,r\<mid\>s,a|)>=\<bbb-P\><around*|(|s<rprime|'>,r\<mid\>s,a,\<pi\><rsup|m<rsub|i>,<around*|(|2|)>><around*|(|s|)>|)>,
    </equation*>

    The quantity

    <\equation*>
      <around*|\<\|\|\>|<around*|(|\<bbb-P\><rsub|m<rsub|1>>-\<bbb-P\><rsub|m<rsub|2>>|)><around*|(|s<rprime|'>,r\<mid\>s,a|)>|\<\|\|\>><rsub|1>=0
    </equation*>

    if

    <\equation*>
      \<pi\><rsup|m<rsub|1>,<around*|(|2|)>><around*|(|s|)>=\<pi\><rsup|m<rsub|2>,<around*|(|2|)>><around*|(|s|)>.
    </equation*>

    Thus, the <math|\<delta\>>-Strongly Separated MDPs assumption requires
    the policy adopted by player 2 be different for all <math|s\<in\>S>.
  </enumerate>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>