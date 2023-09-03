<TeXmacs|2.1>

<style|generic>

<\body>
  <doc-data|<doc-title|CS594 Project Proposal
  >|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<author-email|<href|yli340@uic.edu>>>>|<doc-author|<author-data|<author-name|Shuo
  Wu>|<author-email|<href|swu99@uic.edu>>>>>

  <section|Problem Formulation>

  We consider an agent with state <math|s\<in\>\<cal-S\>> and action
  <math|a\<in\>\<cal-A\>>. The agent interact with a changing environment.
  Our goal is to train a control policy <math|\<pi\>> that is adaptive to the
  changing environment.\ 

  However, it is hard to model the entire changing environment and its
  dynamics. So, we choose some features and pack them into a large vector
  <math|e<rsub|t>\<in\>\<cal-E\>>. We call <math|e<rsub|t>> the
  <with|font-shape|italic|explicit environment feature> at time <math|t>.
  Note that our policy <math|\<pi\><rsub|t>> should also depends on
  <math|e<rsub|t>>, for a large <math|e<rsub|t>>, this will require a very
  large computational resources. Moreover, in the real application, the
  feature <math|e<rsub|t>> is usually unkown to us. To solve the issue, we
  consider the algorithm given in <cite|kumar_rma_2021>. The algorithm can be
  summarized as the following procedure.

  <\itemize>
    <item>Phase 1: Given <math|e<rsub|t>>, use policy class as

    <\equation*>
      a<rsub|t>=\<pi\><around*|(|s<rsub|t>,\<mu\><around*|(|e<rsub|t>|)>;\<theta\><rsub|\<pi\>>|)>,
    </equation*>

    optimize over <math|\<mu\>>, <math|\<theta\><rsub|\<pi\>>> with respect
    to a state value function <math|V<rsup|\<pi\><around*|(|\<theta\><rsub|\<pi\>>,\<theta\><rsub|\<phi\>>|)>><around*|(|s<rsub|0>|)>>.

    <item>Phase 2: Replace <math|\<mu\><around*|(|e|)>> with
    <math|\<phi\><around*|(|s<rsub|t-H:t>,a<rsub|t-H:t-1>;\<theta\><rsub|\<phi\>>|)>>.
    Find <math|\<theta\><rsub|\<phi\>>> to minimize

    <\equation*>
      \<bbb-E\><rsub|e><around*|\<\|\|\>|\<mu\><around*|(|e|)>-\<phi\><around*|(|\<ldots\>;\<theta\><rsub|\<phi\>>|)>|\<\|\|\>><rsup|2><rsub|2>.
    </equation*>
  </itemize>

  Briefly speaking, in phase 1, we encode <math|e<rsub|t>> with an encoder
  <math|\<mu\>> to reduce its dimension. We call
  <math|z<rsub|t>=\<mu\><around*|(|e|)>> a <with|font-shape|italic|latent
  environment feature>. We optimize <math|\<mu\>> and
  <math|\<theta\><rsub|\<pi\>>> with respect to a given value function. In
  phase 2, we applied linear regression with the history gained by phase 1 to
  train an encoder <math|\<phi\>> that is close to <math|\<mu\>>. However,
  this <math|\<phi\>> takes history as input to give an latent environment
  feature <math|<wide|z|^><rsub|t>=\<phi\><around*|(|s<rsub|t-H:t>,a<rsub|t-H:t-1>;\<theta\><rsub|\<phi\>>|)>>
  that is close to <math|z<rsub|t>>. We can futhter abstract thier goal into
  the following:

  <\itemize>
    <item>Find the best <math|\<theta\><rsub|\<pi\>>>,
    <math|\<theta\><rsub|\<phi\>>> for <math|\<pi\><around*|(|s<rsub|t>,\<phi\><around*|(|s<rsub|t-H:t>,a<rsub|t-H:t-1>;\<theta\><rsub|\<phi\>>|)>;\<theta\><rsub|\<pi\>>|)>>

    <\equation*>
      <below|maximize|\<theta\><rsub|\<pi\>>,\<theta\><rsub|\<phi\>>><space|1em>J<around*|(|\<theta\><rsub|\<pi\>>,\<theta\><rsub|\<phi\>>|)>\<triangleq\>\<bbb-E\><rsub|e><around*|[|V<rsup|\<pi\><around*|(|\<theta\><rsub|\<pi\>>,\<theta\><rsub|\<phi\>>|)>><around*|(|s<rsub|0>|)>|]>.
    </equation*>
  </itemize>

  However, why introduce an extra encoder <math|\<mu\>> instead of optimize
  <math|\<theta\><rsub|\<pi\>>> and <math|\<theta\><rsub|\<phi\>>> from
  history directly? Will an extra encoder boosts or stabilizes the training
  procedure? This is the question we are interested.

  <section|Toy Case Experiment>

  The first thing we need to do is to build a toy case which we can test
  these two different setting.

  <subsection|Two encoder>

  <subsubsection|Phase 1>

  <\equation*>
    x<rsub|t+1>=A<around*|(|e|)>x<rsub|t>+B<around*|(|e|)>u<rsub|t>,<space|1em>e\<in\>\<cal-E\>,
  </equation*>

  where

  <\equation*>
    \<cal-E\>=<around*|{|e<rsub|1>,e<rsub|2>,\<ldots\>,e<rsub|N>|}>.
  </equation*>

  We define <math|A<around*|(|e|)>> as\ 

  <\equation*>
    A<around*|(|e|)>=<matrix|<tformat|<table|<row|<cell|e<rsub|1><rsup|2>+\<cdots\>+=a<rsub|11><around*|(|e|)>>|<cell|\<ldots\>>>|<row|<cell|\<ldots\>>|<cell|\<ldots\>>>>>>.
  </equation*>

  The cost function is defined as\ 

  <\equation*>
    <big|sum><around*|(|x<rsub|t><rsup|\<top\>>Q
    x<rsub|t>+u<rsub|t><rsup|\<top\>>R u<rsub|t>|)>.
  </equation*>

  The <math|\<mu\>> and <math|\<pi\>> is linear parameterized.

  <subsubsection|Phase 2>

  Given <math|<around*|(|x<rsub|1>,x<rsub|2>,\<ldots\>,x<rsub|H>|)>>

  <\equation*>
    J<around*|(|A,B|)>\<triangleq\><big|sum><around*|\<\|\|\>|x<rsub|t>-<wide|x|^><rsub|t>|\<\|\|\>><rsup|2><rsub|2>
  </equation*>

  where

  <\equation*>
    <wide|x|^><rsub|t+1>=A<wide|x|^><rsub|t>+B u<rsub|t>
  </equation*>

  <\equation*>
    <around*|(|A<rsup|\<star\>>,B<rsup|\<star\>>|)>=<below|argmin|A,B>
    J<around*|(|A,B|)>
  </equation*>

  <subsection|Only 1 encoder>

  Same problem formulation with <math|\<phi\>> and <math|\<pi\>> be linear
  parameterized.

  <\bibliography|bib|tm-plain|Exported Items>
    <\bib-list|1>
      <bibitem*|1><label|bib-kumar_rma_2021>Ashish Kumar, Zipeng Fu, Deepak
      Pathak<localize|, and >Jitendra Malik. <newblock>RMA: Rapid Motor
      Adaptation for Legged Robots. <newblock>jul 2021.<newblock>
    </bib-list>
  </bibliography>

  \;
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-3|<tuple|2.1|?>>
    <associate|auto-4|<tuple|2.1.1|?>>
    <associate|auto-5|<tuple|2.1.2|?>>
    <associate|auto-6|<tuple|2.2|?>>
    <associate|auto-7|<tuple|2.2|?>>
    <associate|auto-8|<tuple|3|?>>
    <associate|bib-kumar_rma_2021|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      kumar_rma_2021
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Problem
      Formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Toy
      Case Experiment> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Algo 1
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|2.1.1<space|2spc>Phase 1
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|2.1.2<space|2spc>Phase 2
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Algo 2
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Numerical
      > <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>