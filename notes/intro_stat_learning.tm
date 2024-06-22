<TeXmacs|2.1.2>

<style|<tuple|generic|no-page-numbers>>

<\body>
  <\hide-preamble>
    <\new-remark|ass>
      Assumption
    </new-remark>

    <\new-theorem|info>
      Informal Theorem
    </new-theorem>
  </hide-preamble>

  <doc-data|<doc-title|A Short Introduction to Statistical
  Learning>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|Background>

  To simplify the analysis, we only consider supervised learning in this
  note. A regression problem is defined as:\ 

  <\itemize>
    <item>Feature: <math|x>.\ 

    <item>Label: <math|y>.

    <item>Goal: Given a set of data <math|\<cal-D\><rsub|N>=<around*|{|x<rsub|i>,y<rsub|i>|}><rsub|i\<in\><around*|[|N|]>>>,
    find a proper <math|f> such that <math|f<around*|(|x|)>> is close to
    <math|y>.
  </itemize>

  <\ass>
    There exist an unknown distribution <math|\<bbb-P\>> such that
    <math|<around*|(|x<rsub|i>,y<rsub|i>|)><above|\<sim\>|i.i.d>\<bbb-P\>>.
  </ass>

  <\itemize>
    <item>Define a loss function <math|<wide|\<cal-L\>|^><around*|(|f,\<cal-D\><rsub|N>|)>\<triangleq\><big|sum><rsub|i\<in\>N>l<around*|(|f<around*|(|x<rsub|i>|)>,y<rsub|i>|)>>
    such that <math|minimize<rsub|f\<in\>\<cal-F\>><space|1em><wide|\<cal-L\>|^><around*|(|f,\<cal-D\><rsub|N>|)>\<rightarrow\><wide|f|^>>.
  </itemize>

  However, in reality, the real expected loss we faces is defined as

  <\equation*>
    \<cal-L\><around*|(|<wide|f|^>|)>\<triangleq\>\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>\<bbb-P\>><around*|[|l<around*|(|<wide|f|^><around*|(|x|)>,y|)>|]>.
  </equation*>

  The goal of machine learning is to solve the following optimization problem

  <\equation*>
    <below|minimize|f><space|1em>\<cal-L\><around*|(|f|)>.
  </equation*>

  Now, let's decomposite the true loss as following:

  <\align>
    <tformat|<table|<row|<cell|\<cal-L\><around*|(|f|)>=>|<cell|\<cal-L\><around*|(|f|)>-\<cal-L\><around*|(|<wide|f|^>|)>+\<cal-L\><around*|(|<wide|f|^>|)>>>|<row|<cell|=>|<cell|\<cal-L\><around*|(|f|)>-\<cal-L\><around*|(|<wide|f|^>|)>+<wide|\<cal-L\>|^><around*|(|<wide|f|^>,\<cal-D\><rsub|N>|)>+\<cal-L\><around*|(|<wide|f|^>|)>-<wide|\<cal-L\>|^><around*|(|<wide|f|^>,\<cal-D\><rsub|N>|)>.>>|<row|<cell|=>|<cell|\<cal-L\><around*|(|f|)>-\<cal-L\><around*|(|<wide|f|^>|)>+<wide|\<cal-L\>|^><around*|(|<wide|f|^>,\<cal-D\><rsub|N>|)>-<wide|\<cal-L\>|^><around*|(|f,\<cal-D\><rsub|N>|)>+\<cal-L\><around*|(|<wide|f|^>|)>-<wide|\<cal-L\>|^><around*|(|<wide|f|^>,\<cal-D\><rsub|N>|)>+<wide|\<cal-L\>|^><around*|(|f,\<cal-D\><rsub|N>|)>.>>>>
  </align>

  <\itemize>
    <item>(<with|font-shape|italic|Approximation>): minimize the
    approximation error <math|\<cal-L\><around*|(|f|)>-\<cal-L\><around*|(|<wide|f|^>|)>>.
    <with|font-shape|italic|Neural net structure, linear or nonlinear?>

    <item>(<with|font-shape|italic|Generalization>): minimize the
    generalization error <math|\<cal-L\><around*|(|<wide|f|^>|)>-<wide|\<cal-L\>|^><around*|(|<wide|f|^>,\<cal-D\><rsub|N>|)>>.
    <with|font-shape|italic|Overfitting>.

    <item>(<with|font-shape|italic|Optimization>): minimize the optimization
    error <math|<wide|\<cal-L\>|^><around*|(|<wide|f|^>,\<cal-D\><rsub|N>|)>-<wide|\<cal-L\>|^><around*|(|f,\<cal-D\><rsub|N>|)>>.
    <with|font-shape|italic|Gradient descent>, <with|font-shape|italic|Linear
    programming>.
  </itemize>

  Before deep learning, researchers in statistical/machine learning theory
  mainly focusd on generalization part, such as PAC theory. However, in deep
  learning:

  <\itemize>
    <item>(<with|font-shape|italic|Approximation>): Many options on neural
    nets. which action function? how many layers? fully-connected or
    transformer or CNN? (UIUC)

    <item>(<with|font-shape|italic|Optimization>): Stochastic gradient
    descent, nonconvex nonsmooth optimization. (Tengyu Ma)
  </itemize>

  \;

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|page-screen-margin|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../Library/Application
    Support/XmacsLabs/texts/scratch/no_name_13.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Background>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>