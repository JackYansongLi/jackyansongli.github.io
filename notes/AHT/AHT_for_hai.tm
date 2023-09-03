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
  </hide-preamble>

  <doc-data|<doc-title|Human-AI Collaboration>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<\author-email>
    yli340@uic.edu
  </author-email>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>>>>

  <section|Problem Formulation>

  We formulate the human-AI collaboration problem as an episodic MDP.
  Specifically, we define a finite horizon episodic MDP as a tuple
  <math|<around*|(|T,S,A,R,P|)>>, where <math|S> is the state space, <math|A>
  is the (joint) action space, <math|R:S\<times\>A\<rightarrow\><around*|[|0,1|]>>
  is the reward function, and <math|P:S\<times\>A\<rightarrow\>\<Delta\><around*|(|S|)>>
  is the transition kernel. In each episode, the game starts at a fixed
  initial state <math|s<rsub|1>> and terminates at timestep <math|T>. We use
  index <math|1> to represent the AI agent and index <math|2> to represent a
  human agent. We separate the joint action space <math|A> as
  <math|A=A<rsub|1>\<times\>A<rsub|2>>, and define the policy of each agent
  as <math|\<pi\><rsup|<around*|(|i|)>>:S\<rightarrow\>\<mathLaplace\><around*|(|A<rsub|i>|)>>,
  <math|i=1,2>.

  To simplify the problem, we make the following assumption about human
  agents:

  <\ass>
    <label|ass:static-human>In each episode, the AI agent is interacting with
    a human agent who adopt a stationary policy
    <math|\<pi\><rsup|<around*|(|2|)>>> that is drawn from a set
    <math|\<Pi\><rsup|<around*|(|2|)>>>. We call
    <math|\<Pi\><rsup|<around*|(|2|)>>> a <with|font-shape|italic|potential
    set> of human agents.
  </ass>

  <\remark>
    Assumption <reference|ass:static-human> is based on the use of type-based
    knowledge representation methods in ad hoc teamworks, as described in
    <cite|baumeister_survey_2022>. These methods represent prior experience
    with agents by a set of hypothesized types. In our setting, each policy
    in <math|\<Pi\><rsup|<around*|(|2|)>>> represents one such type.
  </remark>

  Under Assumption <reference|ass:static-human>, we can reduce the AI agent's
  planning problem in episode <math|m> to finding an optimal policy for a
  finite horizon MDP <math|\<cal-M\><rsup|m>=<around*|(|T,S,A<rsub|1>,R<rsup|m>,P<rsup|m>|)>>,
  where

  <\equation>
    R<rsup|m><around*|(|s,a|)>=R<around*|(|s,a,\<pi\><rsup|<around*|(|2|)>,m>|)>,<space|1em>P<rsup|m><around*|(|s,a|)>=P<around*|(|s,a,\<pi\><rsup|<around*|(|2|)>,m>|)>.<label|eq:ad-hoc-model>
  </equation>

  Here, the policy <math|\<pi\><rsup|<around*|(|2|)>,m>> is a stationary
  policy adopted by a human agent at episode <math|m>.\ 

  <\remark>
    The model <math|P<rsup|m>> and <math|R<rsup|m>> in episode <math|m> is
    unknown to the AI agent.
  </remark>

  The objective of the AI agent in episode <math|m> is to minimize the value
  function

  <\equation>
    V<rsup|m><around*|(|s<rsub|1>|)>=\<bbb-E\><rsub|a<rsub|t>\<sim\>\<pi\><rsup|<around*|(|1|)>,m><around*|(|s<rsub|t>|)>,s<rsub|t+1>\<sim\>P<rsup|m><around*|(|s<rsub|t>,a<rsub|t>|)>><around*|[|<above|<below|<big|sum>|t=1>|T-1>R<rsup|m><around*|(|s<rsub|t>,a<rsub|t>|)>|]><label|eq:loss-func>
  </equation>

  with respect to its policy <math|\<pi\><rsup|<around*|(|1|)>,m>>. The
  optimal solution of <eqref|eq:loss-func> is denoted by
  <math|\<pi\><rsup|<around*|(|1|)>,m,\<star\>>>.

  <section|Problems That Need to Be Solved>

  There are two problems that need to be addressed in equation
  <eqref|eq:loss-func>:

  <\enumerate>
    <item>Estimating the potential set of policies
    <math|\<Pi\><rsup|<around*|(|2|)>>> that can be adopted by the human
    agent.

    <item>Estimating the correct policy <math|\<pi\><rsup|<around*|(|2|)>,m>>
    that is adopted by the human agent in episode <math|m>, based on an
    estimation <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>> of
    <math|\<Pi\><rsup|<around*|(|2|)>>> at episode <math|m>.
  </enumerate>

  Once we have an estimation <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>>
  of <math|\<Pi\><rsup|<around*|(|2|)>>> and an estimation
  <math|<wide|\<pi\>|^><rsup|<around*|(|2|)>,m>> of
  <math|\<pi\><rsup|<around*|(|2|)>,m>>, we can solve <eqref|eq:loss-func>
  using any model-based RL algorithm. Specifically, we assume we have an
  oracle <math|\<psi\>> such that\ 

  <\equation*>
    \<psi\><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<wide|\<pi\>|^><rsup|<around*|(|2|)>,m>|)>=<wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>,
  </equation*>

  where

  <\equation*>
    <wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>=<below|argmin|\<pi\><rsup|<around*|(|1|)>,m>>\<bbb-E\><rsub|a<rsub|t>\<sim\>\<pi\><rsup|<around*|(|1|)>,m><around*|(|s<rsub|t>|)>,s<rsub|t+1>\<sim\><wide|P|^><rsup|m><around*|(|s<rsub|t>,a<rsub|t>,|)>><around*|[|<above|<below|<big|sum>|t=1>|T-1><wide|R|^><rsup|m><around*|(|s<rsub|t>,a<rsub|t>|)>|]>.
  </equation*>

  Here, <math|<wide|P|^><rsup|m>> and <math|<wide|R|^><rsup|m>> are defined
  the same as in <eqref|eq:ad-hoc-model>, except that
  <math|\<pi\><rsup|<around*|(|2|)>,m>> is replaced by
  <math|><math|<wide|\<pi\>|^><rsup|<around*|(|2|)>,m>>.

  <subsection|Estimating <math|\<pi\><rsup|<around*|(|2|)>,m>> given
  <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>>>

  While there are several existing works that focus on estimating the set of
  potential policies in human-AI collaboration problems, such as
  <cite|albrecht_belief_2016> and <cite|barrett_making_2017>, they often rely
  on an algorithm <math|\<varphi\>> that maps the estimated set of potential
  policies <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>> and the information
  set <math|<around*|{|s<rsub|h>,a<rsub|2,h><rsup|m>|}><rsub|h=1><rsup|t>>
  until time <math|t> of the human agent in episode <math|m> to an action
  <math|a<rsub|1,t><rsup|m>> for the AI agent. Formally,

  <\equation*>
    a<rsub|1,t><rsup|m>\<leftarrow\>\<varphi\><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<around*|{|s<rsub|h>,a<rsub|2,h><rsup|m>|}><rsub|h=1><rsup|t>|)>.
  </equation*>

  We can use such a <math|\<varphi\>> to do planning and estimate
  <math|\<pi\><rsup|<around*|(|2|)>,m>> at the end of the episode.

  <\equation*>
    <wide|\<pi\>|^><rsup|<around*|(|2|)>,m>\<leftarrow\>\<cal-E\><rsub|\<pi\>><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<around*|{|s<rsub|h><rsup|m>,a<rsub|2,h><rsup|m>|}><rsub|h=1><rsup|T>|)>.
  </equation*>

  <\remark>
    <math|<wide|\<pi\>|^><rsup|<around*|(|2|)>,m>\<in\><wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>>
  </remark>

  <subsection|Estimating <math|\<Pi\><rsup|<around*|(|2|)>>>>

  It is important to note that the type of the human agent is assumed to be
  fixed within an episode. Therefore, there is no need to update the set of
  potential policies <math|\<Pi\><rsup|<around*|(|2|)>>> during an episode.
  Instead, it can be updated across episodes to improve the estimation of the
  human agent's policy. The objective of our work is to develop an estimator
  <math|\<cal-E\><rsub|\<Pi\>>> that can accurately estimate the set of
  potential policies <math|\<Pi\><rsup|<around*|(|2|)>>>, Specifically, we
  aim to update the estimation of <math|\<Pi\><rsup|<around*|(|2|)>>> across
  episodes using the information set <math|<around*|{|s<rsub|t><rsup|m>,a<rsub|2,t><rsup|m>|}><rsub|t=1><rsup|T>>
  of the human agent in episode <math|m>.\ 

  Also, given <math|<wide|\<pi\>|^><rsup|<around*|(|2|)>,m>> and
  <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>>, we can get
  <math|<wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>> from oracle
  <math|\<psi\>>.\ 

  <\question>
    Is <math|<wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>> provide
    additional information?\ 
  </question>

  Formally,

  <\equation*>
    <wide|\<Pi\>|^><rsup|<around*|(|2|)>,m+1>\<leftarrow\>\<cal-E\><rsub|\<Pi\>><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>,<around*|{|s<rsub|t><rsup|m>,a<rsub|2,t><rsup|m>|}><rsub|t=1><rsup|T>|)>
  </equation*>

  or

  <\equation*>
    <wide|\<Pi\>|^><rsup|<around*|(|2|)>,m+1>\<leftarrow\>\<cal-E\><rsub|\<Pi\>><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<around*|{|s<rsub|t><rsup|m>,a<rsub|2,t><rsup|m>|}><rsub|t=1><rsup|T>|)>
  </equation*>

  if \ <math|<wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>> provides no
  additional information. The ultimate goal is
  <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,\<infty\>>=\<Pi\><rsup|<around*|(|2|)>>>.
  There are several essential properties that we want the estimator
  <math|\<cal-E\><rsub|\<Pi\>>> to satisfy. These properties include:

  <\enumerate>
    <item><math|\<cal-E\><rsub|\<Pi\>>> should be designed to inference if
    the true policy <math|\<pi\><rsup|<around*|(|2|)>,m>\<in\><wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>>.

    <item>If \ <math|\<pi\><rsup|<around*|(|2|)>,m>\<nin\><wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>>,
    <math|\<cal-E\><rsub|\<Pi\>>> should be able to construct a
    <math|<wide|\<pi\>|~><rsup|<around*|(|2|)>,m>\<nin\><wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>>
    and <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m+1>=<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m><big|cup><around*|{|<wide|\<pi\>|~><rsup|<around*|(|2|)>,m>|}>>.
  </enumerate>

  <subsection|Algorithm Overview>

  <subsubsection|With <math|<wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>>>

  <\render-code>
    <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,1>\<leftarrow\>?>

    <with|font-series|bold|for> <math|m=1:\<infty\>>

    <\indent>
      <math|s<rsub|1><rsup|m>\<leftarrow\>s<rsub|1>>
    </indent>

    <\indent>
      <with|font-series|bold|for> <math|t=1:T>

      <\indent>
        <\math>
          \<varphi\><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<around*|{|s<rsub|h>,a<rsub|2,h><rsup|m>|}><rsub|h=1><rsup|t>|)>=a<rsub|1,t><rsup|m>.
        </math>
      </indent>

      <with|font-series|bold|endfor>

      <math|<wide|\<pi\>|^><rsup|<around*|(|2|)>,m>\<leftarrow\>\<cal-E\><rsub|\<pi\>><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<around*|{|s<rsub|h><rsup|m>,a<rsub|2,h><rsup|m>|}><rsub|h=1><rsup|T>|)>>

      <with|color|blue|<math|<wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>\<leftarrow\>\<psi\><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<wide|\<pi\>|^><rsup|<around*|(|2|)>,m>|)>>>

      <with|color|blue|<math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m+1>\<leftarrow\>\<cal-E\><rsub|\<Pi\>><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>,<around*|{|s<rsub|t><rsup|m>,a<rsub|2,t><rsup|m>|}><rsub|t=1><rsup|T>|)>>>
    </indent>

    <with|font-series|bold|endfor>
  </render-code>

  <subsubsection|Without <math|<wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>>>

  <\render-code>
    <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,1>\<leftarrow\>?>

    <with|font-series|bold|for> <math|m=1:\<infty\>>

    <\indent>
      <math|s<rsub|1><rsup|m>\<leftarrow\>s<rsub|1>>
    </indent>

    <\indent>
      <with|font-series|bold|for> <math|t=1:T>

      <\indent>
        <\math>
          \<varphi\><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<around*|{|s<rsub|h>,a<rsub|2,h><rsup|m>|}><rsub|h=1><rsup|t>|)>=a<rsub|1,t><rsup|m>.
        </math>
      </indent>

      <with|font-series|bold|endfor>

      <math|<wide|\<pi\>|^><rsup|<around*|(|2|)>,m>\<leftarrow\>\<cal-E\><rsub|\<pi\>><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<around*|{|s<rsub|h><rsup|m>,a<rsub|2,h><rsup|m>|}><rsub|h=1><rsup|T>|)>>

      <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m+1>\<leftarrow\>\<cal-E\><rsub|\<Pi\>><around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>,<around*|{|s<rsub|t><rsup|m>,a<rsub|2,t><rsup|m>|}><rsub|t=1><rsup|T>|)>>
    </indent>

    <with|font-series|bold|endfor>
  </render-code>

  <\bibliography|bib|tm-plain|AHT>
    <\bib-list|3>
      <bibitem*|1><label|bib-albrecht_belief_2016>Stefano<nbsp>V.<nbsp>Albrecht,
      Jacob<nbsp>W.<nbsp>Crandall<localize|, and >Subramanian Ramamoorthy.
      <newblock>Belief and Truth in Hypothesised Behaviours.
      <newblock><with|font-shape|italic|Artificial Intelligence>, 235:63\U94,
      jun 2016.<newblock>

      <bibitem*|2><label|bib-barrett_making_2017>Samuel Barrett, Avi
      Rosenfeld, Sarit Kraus<localize|, and >Peter Stone. <newblock>Making
      friends on the fly: Cooperating with new teammates.
      <newblock><with|font-shape|italic|Artificial Intelligence>,
      242:132\U171, jan 2017.<newblock>

      <bibitem*|3><label|bib-baumeister_survey_2022>Reuth Mirsky, Ignacio
      Carlucho, Arrasy Rahman, Elliot Fosong, William Macke, Mohan Sridharan,
      Peter Stone<localize|, and >Stefano<nbsp>V.<nbsp>Albrecht. <newblock>A
      Survey of Ad Hoc Teamwork Research. <newblock><localize|In >Dorothea
      Baumeister<localize| and >Jörg Rothe<localize|, editors>,
      <with|font-shape|italic|Multi-Agent Systems>, <localize|volume> 13442,
      <localize|pages >275\U293. Springer International Publishing, Cham,
      2022.<newblock>
    </bib-list>
  </bibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|ass:static-human|<tuple|1|1>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|2.1|2>>
    <associate|auto-4|<tuple|2.2|2>>
    <associate|auto-5|<tuple|2.3|3>>
    <associate|auto-6|<tuple|2.3.1|3>>
    <associate|auto-7|<tuple|2.3.2|3>>
    <associate|auto-8|<tuple|2.3.2|3>>
    <associate|bib-albrecht_belief_2016|<tuple|1|3>>
    <associate|bib-barrett_making_2017|<tuple|2|3>>
    <associate|bib-baumeister_survey_2022|<tuple|3|3>>
    <associate|eq:ad-hoc-model|<tuple|1|1>>
    <associate|eq:loss-func|<tuple|2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      baumeister_survey_2022

      albrecht_belief_2016

      barrett_making_2017
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Problem
      Formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Problems
      That Need to Be Solved> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Estimating
      <with|mode|<quote|math>|\<pi\><rsup|<around*|(|2|)>,m>> given
      <with|mode|<quote|math>|<wide|\<Pi\>|^><rsup|<around*|(|2|)>,m>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Estimating
      <with|mode|<quote|math>|\<Pi\><rsup|<around*|(|2|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Algorithm Overview
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|2.3.1<space|2spc>With
      <with|mode|<quote|math>|<wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|2.3.2<space|2spc>Without
      <with|mode|<quote|math>|<wide|\<pi\>|^><rsup|<around*|(|1|)>,m,\<star\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>