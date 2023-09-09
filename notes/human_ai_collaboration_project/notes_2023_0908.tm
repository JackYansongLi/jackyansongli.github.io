<TeXmacs|2.1.2>

<style|generic>

<\body>
  episodic variant of pomdp

  <\enumerate>
    <item>MEX\<gtr\>UCB: yes

    <item>UCB\<gtr\>MEX: ?

    <item>worst-case MEX v.s UCB: <hlink|Chapter
    9|https://tor-lattimore.com/downloads/book/book.pdf>.
  </enumerate>

  <section|>

  <\equation*>
    r<around*|(|i|)>=<choice|<tformat|<table|<row|<cell|\<mu\><rsup|i>>|<cell|i\<less\>i<rsup|\<ast\>>>>|<row|<cell|0>|<cell|i\<gtr\>i<rsup|\<ast\>>>>>>>
  </equation*>

  <math|i\<in\><around*|[|I|]>>

  best: bisection

  MEX: from <math|I> to <math|0>.\ 

  <math|\<cal-H\>=<around*|{|1,\<ldots\>,I|}>>.
  <math|L<around*|(|h,\<cal-D\>|)>>

  <math|\<cal-D\>=<around*|{|<around*|(|i,r<rsub|i>|)>|}><rsub|i>>

  <\equation*>
    L<around*|(|h,\<cal-D\>|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|\<ldots\>>>|<row|<cell|\<infty\>>|<cell|\<ldots\>>>>>>
  </equation*>

  <section|Linear Bandit>

  <\definition>
    <math|r<around*|(|x|)>=<around*|\<langle\>|\<theta\>,\<varphi\><around*|(|\<theta\>|)>|\<rangle\>>>.
    <math|\<varphi\>:\<cal-X\>\<rightarrow\>\<bbb-R\><rsup|k>>, known.
    <math|\<theta\>\<in\>\<bbb-R\><rsup|k>>, unknown.
  </definition>

  <\lemma>
    <math|X=<around*|{|1,\<ldots\>K|}>>, <math|\<varphi\><around*|(|i|)>=e<rsub|i>>,
    <math|i=1,\<ldots\>K>, <math|\<theta\>=r>
  </lemma>

  <math|\<theta\>\<in\><around*|{|<around*|(|\<mu\><rsub|1>,0,0,\<ldots\>,0|)>,<around*|{|\<mu\><rsub|1>,\<mu\><rsub|2>,\<ldots\>,0|}>,\<ldots\>,<around*|{|\<mu\><rsub|1>,\<mu\><rsub|2>,\<ldots\>,\<mu\><rsub|I>|}>|}>>

  LinUCB algorithm

  <\equation*>
    <below|argmax|\<theta\>\<in\>\<cal-C\><rsub|t>><space|1em>max<rsub|x\<in\>\<cal-X\>>
    <around*|\<langle\>|\<theta\>,\<varphi\><around*|(|x|)>|\<rangle\>>
  </equation*>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
  </collection>
</references>