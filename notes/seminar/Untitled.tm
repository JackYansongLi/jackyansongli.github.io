<TeXmacs|2.1.1>

<style|generic>

<\body>
  <\hide-preamble>
    \;

    <assign|definition-text|<macro|<localize|Definition>>>
  </hide-preamble>

  <doc-data|<doc-title|RL Seminar Week 1>|<doc-author|<author-data|<author-name|Yansong
  Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<\author-email>
    yli340@uic.edu
  </author-email>>>>

  <section|From Physics to Control Theory>

  <\equation*>
    <wide|x|\<ddot\>><around*|(|t|)>=F/m\<triangleq\>u
  </equation*>

  Solving the above ODE

  <\equation*>
    <wide|x|\<dot\>><around*|(|t|)>=u t+c<rsub|1>
  </equation*>

  <\equation*>
    x<around*|(|t|)>=<frac|1|2>u t<rsup|2>+c<rsub|1>t+c<rsub|2>.
  </equation*>

  Once you know <math|x<around*|(|0|)>> and
  <math|<wide|x|\<dot\>><around*|(|0|)>>, you can solve for <math|c<rsub|1>>,
  <math|c<rsub|2>>.

  <\definition>
    We call

    <\equation*>
      s<around*|(|t|)>=<bmatrix|<tformat|<table|<row|<cell|x<around*|(|t|)>>>|<row|<cell|<wide|x|\<dot\>><around*|(|t|)>>>>>>
    </equation*>

    the state of the Newton's mechanical system.
  </definition>

  <\example>
    \;

    <\equation*>
      <wide|s|^><around*|(|t|)>=<bmatrix|<tformat|<table|<row|<cell|x<around*|(|t|)>>>|<row|<cell|<frac|x<around*|(|t+h|)>-x<around*|(|t|)>|h>>>>>>
    </equation*>

    not a state
  </example>

  <\theorem>
    The state-space form of Newton's second law is

    <\equation*>
      <wide|s|\<dot\>><around*|(|t|)>=A s<around*|(|t|)>+B
      <bmatrix|<tformat|<table|<row|<cell|0>>|<row|<cell|u>>>>>.
    </equation*>
  </theorem>

  <\proof>
    \;

    <\equation*>
      <wide|s|\<dot\>><around*|(|t|)>=<bmatrix|<tformat|<table|<row|<cell|<wide|x|\<dot\>><around*|(|t|)>>>|<row|<cell|<wide|x|\<ddot\>><around*|(|t|)>>>>>>=<bmatrix|<tformat|<table|<row|<cell|0>|<cell|1>>|<row|<cell|0>|<cell|0>>>>><bmatrix|<tformat|<table|<row|<cell|x<around*|(|t|)>>>|<row|<cell|<wide|x|\<dot\>><around*|(|t|)>>>>>>+<bmatrix|<tformat|<table|<row|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>>>>><bmatrix|<tformat|<table|<row|<cell|0>>|<row|<cell|u>>>>>.
    </equation*>

    \;
  </proof>

  <\equation*>
    <wide|s|\<dot\>><around*|(|t|)>=f<around*|(|s<around*|(|t|)>|)>
  </equation*>

  With controller/input/force

  <\definition>
    \;

    <\equation*>
      <wide|s|\<dot\>><around*|(|t|)>=f<around*|(|s<around*|(|t|)>,u<around*|(|t|)>|)>.
    </equation*>
  </definition>

  <section|From Deterministic to Stochastic>

  <subsection|Without Controller>

  We only consider discrete system

  <\equation*>
    <wide|s|\<dot\>><around*|(|t|)>=f<around*|(|s<around*|(|t|)>|)>\<Rightarrow\>s<rsub|t+1>=f<around*|(|s<rsub|t>|)>.
  </equation*>

  Also, we consider stoachastic dynamical system, i.e.,

  <\equation*>
    s<rsub|t+1>=f<around*|(|s<rsub|t>|)>\<Rightarrow\>s<rsub|t+1>\<sim\>p<rsub|t><around*|(|s<rsub|t>|)>.
  </equation*>

  <\definition>
    (Markov System)

    <\equation*>
      s<rsub|t+1>\<sim\>p<around*|(|s<rsub|0>,s<rsub|1>,\<ldots\>,s<rsub|t>|)>=p<around*|(|s<rsub|t>|)>
    </equation*>
  </definition>

  <subsection|With Controller>

  <\equation*>
    x<rsub|t+1>=f<around*|(|x<rsub|t>,u<rsub|t>|)>\<Rightarrow\>s<rsub|t+1>\<sim\>p<around*|(|s<rsub|t>,a<rsub|t>|)>.
  </equation*>

  \;

  \;

  \;

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
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-3|<tuple|2.1|?>>
    <associate|auto-4|<tuple|2.2|?>>
  </collection>
</references>