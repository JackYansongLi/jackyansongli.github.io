<TeXmacs|2.1.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>

    <\new-theorem|hyp>
      Hypothesis
    </new-theorem>

    <\new-remark|ass>
      Assumption
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Inexact Hypothesis
  Set>|<doc-author|<author-data|<author-name|Jack Yansong Li>>>>

  <section|Problem setup>

  We consider a two-player episodic Markov game defined as a
  <math|<around*|(|S,s<rsub|abs>,A,P,r,\<gamma\>|)>>, where <math|S> is the
  joint state space and <math|A\<triangleq\>A<rsup|<around*|(|1|)>>\<times\>A<rsup|<around*|(|2|)>>>
  is the joint action space for both players. The deterministic transition
  kernel <math|\<bbb-P\>> and the expected reward <math|r> are defined as
  functions:

  <\equation*>
    \<bbb-P\>:S\<times\>A\<rightarrow\>S,<space|1em>r:S\<cup\><around*|{|s<rsub|abs>|}>\<times\>A\<rightarrow\><around*|[|0,1|]>.
  </equation*>

  The game terminate when the state, denoted as <math|s>, reaches the
  absorbing state <math|s<rsub|abs>>, i.e.,

  <\equation*>
    \<bbb-P\><around*|(|s<rsub|abs>,a|)>=s<rsub|abs><space|1em>and<space|1em>r<around*|(|s<rsub|abs>,a|)>=0,<space|1em>\<forall\>a\<in\>A
  </equation*>

  We fix the initial state for each episode as <math|s<rsub|1>>. Throughout
  this note, we make the following assumption for player <math|2>.

  <\ass>
    <label|ass:policy-set>Player 2 adopts a stationary policy denoted as
    <math|\<pi\><rsup|<around*|(|2|)>>>, which belongs to the set
    <math|\<cal-H\>>.
  </ass>

  Now, with Assumption <reference|ass:policy-set>, the player 1 faces an
  episodic MDP <math|<around*|(|S,s<rsub|abs>,A<rsup|<around*|(|1|)>>,P<rsup|\<pi\><rsup|<around*|(|2|)>>>,r<rsup|\<pi\><rsup|<around*|(|2|)>>>,\<gamma\>|)>>,
  where

  <\equation*>
    \<bbb-P\><rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|s,a<rsup|<around*|(|1|)>>|)>=\<bbb-P\><around*|(|s,a<rsup|<around*|(|1|)>>,\<pi\><rsup|<around*|(|2|)>><around*|(|s|)>|)>,<space|1em>r<rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|s,a<rsup|<around*|(|1|)>>|)>=r<around*|(|s,a<rsup|<around*|(|1|)>>,\<pi\><rsup|<around*|(|2|)>><around*|(|s|)>|)>.
  </equation*>

  Given a set <math|\<cal-H\>> as the following:

  <\equation*>
    \<cal-H\>=<around*|{|\<pi\><rsup|<around*|(|2|)>><rsub|1>,\<ldots\>,\<pi\><rsub|<around*|\||\<cal-H\>|\|>><rsup|<around*|(|2|)>>|}>,
  </equation*>

  where each <math|\<pi\><rsub|i><rsup|<around*|(|2|)>>> are deterministic
  and stationary policy. The set induces a set of transition kernels
  <math|\<bbb-P\><rsup|\<cal-H\>>> and rewards <math|r<rsup|\<cal-H\>>> for
  the robot player, i.e.,

  <\equation*>
    \<bbb-P\><rsup|\<cal-H\>>=<around*|{|\<bbb-P\><rsub|1><rsup|\<cal-H\>>,\<ldots\>,\<bbb-P\><rsup|\<cal-H\>><rsub|<around*|\||\<cal-H\>|\|>>|}>,<space|1em>r<rsup|\<cal-H\>>=<around*|{|r<rsub|1><rsup|\<cal-H\>>,\<ldots\>,r<rsup|\<cal-H\>><rsub|<around*|\||\<cal-H\>|\|>>|}>,
  </equation*>

  where <math|\<bbb-P\><rsup|\<cal-H\>><rsub|i>=\<bbb-P\><rsup|\<pi\><rsup|<around*|(|2|)>><rsub|i>>>
  and <math|r<rsub|i><rsup|\<cal-H\>>=r<rsup|\<pi\><rsup|<around*|(|2|)>><rsub|i>>>.
  To make a weaker assumption to the human player, we assume the human player
  takes policies from a set <math|\<cal-H\><rsub|\<varepsilon\>>> which is
  \Pclose\Q to the set <math|\<cal-H\>>. One attempt to define the closeness
  is\ 

  <\equation*>
    \<cal-H\><rsub|\<varepsilon\>>=<around*|{|\<pi\><rsup|<around*|(|2|)>><rsub|1,\<varepsilon\>>,\<ldots\>,\<pi\><rsub|<around*|\||\<cal-H\><rsub|\<varepsilon\>>|\|>,\<varepsilon\>><rsup|<around*|(|2|)>>|}>,
  </equation*>

  where\ 

  <\equation*>
    \<pi\><rsub|i,\<varepsilon\>><rsup|<around*|(|2|)>><around*|(|s|)>=<choice|<tformat|<table|<row|<cell|\<pi\><rsub|i><rsup|<around*|(|2|)>><around*|(|s|)>>|<cell|with
    probability 1-\<varepsilon\>>>|<row|<cell|Uniform<around*|(|A<rsup|<around*|(|2|)>>|)>>|<cell|with
    probability \<varepsilon\>>>>>>.
  </equation*>

  We call the set <math|\<cal-H\><rsub|\<varepsilon\>>> be
  <math|\<varepsilon\>> close to <math|\<cal-H\>>.

  <subsection|Value Function and Best Response>

  <\def>
    The state value function of a joint policy
    <math|<around*|(|\<pi\><rsup|<around*|(|1|)>>,\<pi\><rsup|<around*|(|2|)>>|)>>
    is defined as

    <\equation*>
      V<around*|(|\<pi\><rsup|<around*|(|1|)>>,\<pi\><rsup|<around*|(|2|)>><rsub|><rsub|>|)>=\<bbb-E\><rsub|a<rsup|<around*|(|1|)>>\<sim\>,\<pi\><rsup|<around*|(|1|)>><around*|(|s<rsub|h>|)>,a<rsup|<around*|(|2|)>>\<sim\>,\<pi\><rsup|<around*|(|2|)>><around*|(|s<rsub|h>|)>><around*|[|<big|sum><rsub|h=1><rsup|\<infty\>>\<gamma\><rsup|h>r<around*|(|s<rsub|h>,a<rsup|<around*|(|1|)>>,a<rsup|<around*|(|2|)>>|)>|]>,
    </equation*>

    where <math|s<rsub|h+1>=\<bbb-P\><around*|(|s<rsub|h>,\<pi\><rsup|<around*|(|1|)>><around*|(|s<rsub|h>|)>,\<pi\><rsup|<around*|(|2|)>><around*|(|s<rsub|h>|)>|)>>.
  </def>

  <\def>
    The set of all best responses of a player <math|2>'s policy
    <math|\<pi\><rsup|<around*|(|2|)>>> if defined as

    <\equation*>
      BR<around*|(|\<pi\><rsup|<around*|(|2|)>>|)>=<below|argmax|\<pi\>>V<around*|(|\<pi\>,\<pi\><rsup|<around*|(|2|)>><rsub|><rsub|>|)>.
    </equation*>
  </def>

  <\hyp>
    <label|hyp:id-br>For a small <math|\<varepsilon\>>, a best response of
    the deterministic policy <math|\<pi\><rsup|<around*|(|2|)>><rsub|i>> is
    also a best response for <math|\<pi\><rsup|<around*|(|2|)>><rsub|i,\<varepsilon\>>>,
    i.e., for a small <math|\<varepsilon\>>,

    <\equation*>
      BR<around*|(|\<pi\><rsup|<around*|(|2|)>><rsub|i>|)>\<subset\>BR<around*|(|\<pi\><rsup|<around*|(|2|)>><rsub|i,\<varepsilon\>>|)>
    </equation*>

    for all <math|\<pi\><rsup|<around*|(|2|)>><rsub|i>\<in\>\<cal-H\>> and
    <math|\<pi\><rsub|i,\<varepsilon\>><rsup|<around*|(|2|)>>\<in\>\<cal-H\><rsub|\<varepsilon\>>>.
  </hyp>

  <subsection|Regret Analysis>

  Now, assume the player <math|2> takes policies from set
  <math|\<cal-H\><rsub|\<varepsilon\>>>. Without loss of generality, we
  assume the player <math|2> takes policy
  <math|\<pi\><rsup|<around*|(|2|)>><rsub|1,\<varepsilon\>>>. Given the
  information of the hypothesis set <math|\<cal-H\><rsub|\<varepsilon\>>>,
  the MEX algorithm requires the player <math|1> to take policy
  <math|\<pi\><rsup|<around*|(|1|)>><rsub|k,\<varepsilon\>>> based on:

  <\equation>
    \<pi\><rsup|<around*|(|1|)>><rsub|k,\<varepsilon\>>=BR<around*|(|<below|argmax|\<pi\><rsup|<around*|(|2|)>>\<in\>\<cal-H\><rsub|\<varepsilon\>>><around*|{|V<rsub|><around*|(|BR<around*|(|\<pi\><rsup|<around*|(|2|)>>|)>,\<pi\><rsup|<around*|(|2|)>><rsub|><rsub|>|)>-\<eta\><above|<below|<big|sum>|h=1>|H>\<cal-L\><rsub|h><rsup|k-1><around*|(|\<pi\><rsup|<around*|(|2|)>>|)>|}><with|color|red|may
    not be unique>|)><label|eq:exact-hypo>,
  </equation>

  where <math|\<cal-L\><rsub|h><rsup|k><around*|(|\<pi\><rsup|<around*|(|2|)>>|)>=<big|sum><rsub|s=1><rsup|k>L<rsub|s,h><around*|(|\<pi\><rsup|<around*|(|2|)>>|)>><math|>
  and\ 

  <\equation*>
    L<rsub|s,h><around*|(|\<pi\><rsup|<around*|(|2|)>>|)>=-log\<bbb-P\><rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|s<rsub|h><rsup|s>,a<rsub|h><rsup|s>,\<pi\><rsup|<around*|(|2|)>><around*|(|s<rsub|h><rsup|s>|)>|)>.
  </equation*>

  The regret for the MEX algorithm is defined as

  <\equation>
    <big|sum><rsub|k=1><rsup|K><around*|[|V<around*|(|BR<around*|(|\<pi\><rsup|<around*|(|2|)>><rsub|1,\<varepsilon\>>|)>,\<pi\><rsub|1,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>-V<around*|(|\<pi\><rsup|<around*|(|1|)>><rsub|k,\<varepsilon\>>,\<pi\><rsub|1,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>|]>.<label|eq:sub-reg>
  </equation>

  The regret <eqref|eq:sub-reg> for the player <math|1> takes policies based
  on <eqref|eq:exact-hypo> is guaranteed to be sublinear by
  <math|<around*|[|Liu et.al. 2023|]>>.\ 

  Now, consider the case that only the hypothesis set <math|\<cal-H\>> is
  given. In each episode <math|k>, the player <math|1> chooses policy
  <math|\<pi\><rsup|<around*|(|1|)>><rsub|k>> based on

  <\equation>
    \<pi\><rsup|<around*|(|1|)>><rsub|k>=BR<around*|(|<below|argmax|\<pi\><rsup|<around*|(|2|)>>\<in\>\<cal-H\>><around*|{|V<around*|(|BR<around*|(|\<pi\><rsup|<around*|(|2|)>>|)>,\<pi\><rsup|<around*|(|2|)>><rsub|><rsub|>|)>-\<eta\><above|<below|<big|sum>|h=1>|H>\<cal-L\><rsub|h><rsup|k-1><around*|(|\<pi\><rsup|<around*|(|2|)>>|)>|}>|)><label|eq:inexact-hypo>
  </equation>

  The regret now becomes

  <\equation>
    <big|sum><rsub|k=1><rsup|K><around*|[|V<around*|(|BR<around*|(|\<pi\><rsup|<around*|(|2|)>><rsub|1,\<varepsilon\>>|)>,\<pi\><rsub|1,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>-V<around*|(|\<pi\><rsup|<around*|(|1|)>><rsub|k>,\<pi\><rsub|1,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>|]>.<label|eq:inex-reg>
  </equation>

  The regret <eqref|eq:inex-reg> is no longer guaranteed to be sublinear
  since <math|\<pi\><rsub|1,\<varepsilon\>><rsup|<around*|(|2|)>>\<nin\>\<cal-H\>>,
  which violates the <with|font-series|bold|Realizablity> assumption in
  <math|<around*|[|Liu et.al. 2023|]>>.

  <\hyp>
    <label|hyp:regret>For a small <math|\<varepsilon\>>,

    <\equation*>
      V<around*|(|\<pi\><rsup|<around*|(|1|)>><rsub|k>,\<pi\><rsub|1,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>\<geq\>V<around*|(|\<pi\><rsup|<around*|(|1|)>><rsub|k,\<varepsilon\>>,\<pi\><rsub|1,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>.
    </equation*>
  </hyp>

  If Hypothesis <reference|hyp:regret> holds, we have\ 

  <\equation*>
    V<around*|(|BR<around*|(|\<pi\><rsup|<around*|(|2|)>><rsub|1,\<varepsilon\>>|)>,\<pi\><rsub|1,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>-V<around*|(|\<pi\><rsup|<around*|(|1|)>><rsub|k,\<varepsilon\>>,\<pi\><rsub|1,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>\<geq\>V<around*|(|BR<around*|(|\<pi\><rsup|<around*|(|2|)>><rsub|1,\<varepsilon\>>|)>,\<pi\><rsub|1,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>-V<around*|(|\<pi\><rsup|<around*|(|1|)>><rsub|k>,\<pi\><rsub|1,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>
  </equation*>

  Thus, The regret <eqref|eq:inex-reg> for the player <math|1> takes policies
  based on <eqref|eq:inexact-hypo> is sublinear.

  <section|Draft (Do not read this section)>

  <subsection|Proof idea for Hypothesis <reference|hyp:id-br>>

  <\with|proof-text|<macro|<localize|Proof> Idea>>
    <\proof>
      By definition,

      <\equation*>
        V<around*|(|\<pi\><rsub|i><rsup|<around*|(|1|)>>,\<pi\><rsub|i,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>=\<bbb-E\><around*|(|<above|<below|<big|sum>|h=1>|H<rsub|i>>\<gamma\><rsup|H<rsub|i>-1>r<around*|(|s<rsub|h>,\<pi\><rsup|<around*|(|1|)>><rsub|i><around*|(|s<rsub|h>|)>,\<pi\><rsup|<around*|(|2|)>><rsub|i,\<varepsilon\>><around*|(|s<rsub|h>|)>|)>|)>
      </equation*>

      and

      <\equation*>
        V<around*|(|\<pi\><rsub|i,\<varepsilon\>><rsup|<around*|(|1|)>>,\<pi\><rsub|i,\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>=\<bbb-E\><around*|(|<above|<below|<big|sum>|h=1>|H<rsub|i,\<varepsilon\>>>\<gamma\><rsup|H<rsub|i,\<varepsilon\>>-1>r<around*|(|s<rsub|h>,\<pi\><rsup|<around*|(|1|)>><rsub|i,\<varepsilon\>><around*|(|s<rsub|h>|)>,\<pi\><rsup|<around*|(|2|)>><rsub|i,\<varepsilon\>><around*|(|s<rsub|h>|)>|)>|)>.
      </equation*>

      Note that <math|H<rsub|i>\<leq\>H<rsub|i,\<varepsilon\>>>. Also,

      <\equation*>
        r<around*|(|s,\<pi\><rsup|<around*|(|1|)>><rsub|i><around*|(|s|)>,\<pi\><rsup|<around*|(|2|)>><rsub|i,\<varepsilon\>><around*|(|s|)>|)>\<geq\>r<around*|(|s,\<pi\><rsup|<around*|(|1|)>><rsub|i,\<varepsilon\>><around*|(|s|)>,\<pi\><rsup|<around*|(|2|)>><rsub|i,\<varepsilon\>><around*|(|s|)>|)>
      </equation*>

      To see this, consider,

      <\equation*>
        r<around*|(|s,\<pi\><rsup|<around*|(|1|)>><rsub|i><around*|(|s|)>,\<pi\><rsup|<around*|(|2|)>><rsub|i><around*|(|s|)>|)>=r<around*|(|s,\<pi\><rsup|<around*|(|1|)>><rsub|i,\<varepsilon\>><around*|(|s|)>,\<pi\><rsup|<around*|(|2|)>><rsub|i><around*|(|s|)>|)>
      </equation*>

      and

      <\equation>
        r<around*|(|s,\<pi\><rsup|<around*|(|1|)>><rsub|i><around*|(|s|)>,Uniform<around*|(|A<rsup|<around*|(|2|)>>|)>|)>\<geq\>r<around*|(|s,\<pi\><rsup|<around*|(|1|)>><rsub|i,\<varepsilon\>><around*|(|s|)>,Uniform<around*|(|A<rsup|<around*|(|2|)>>|)>|)>.<label|eq:uni-reward>
      </equation>

      To see why <eqref|eq:uni-reward> holds. For non-terminal state\ 

      <\equation*>
        r<around*|(|s,\<pi\><rsup|<around*|(|1|)>><rsub|i><around*|(|s|)>,Uniform<around*|(|A<rsup|<around*|(|2|)>>|)>|)>=r<around*|(|s,\<pi\><rsup|<around*|(|1|)>><rsub|i,\<varepsilon\>><around*|(|s|)>,Uniform<around*|(|A<rsup|<around*|(|2|)>>|)>|)>.
      </equation*>

      For the state before terminal state,

      <\equation*>
        r<around*|(|s<rsub|ter>,\<pi\><rsup|<around*|(|1|)>><rsub|i><around*|(|s<rsub|ter>|)>,Uniform<around*|(|A<rsup|<around*|(|2|)>>|)>|)>\<geq\>r<around*|(|s<rsub|ter>,\<pi\><rsup|<around*|(|1|)>><rsub|i,\<varepsilon\>><around*|(|s<rsub|ter>|)>,Uniform<around*|(|A<rsup|<around*|(|2|)>>|)>|)>.
      </equation*>
    </proof>
  </with>

  <subsection|Proof Idea for Hypothesis <reference|hyp:regret>>

  \;

  <\theorem>
    \;

    <\equation*>
      <big|sum><rsub|k=1><rsup|K><around*|[|V<around*|(|\<pi\><rsup|<around*|(|1|)>>,\<pi\><rsub|\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>-V<around*|(|\<pi\><rsup|<around*|(|1|)>><rsub|k>,\<pi\><rsub|\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>|]>\<leq\>\<ldots\>
    </equation*>

    where

    <\equation*>
      \<pi\><rsup|<around*|(|1|)>><rsub|k>=BR<around*|(|<below|argsup|\<pi\><rsup|<around*|(|2|)>>\<in\>\<cal-H\>><around*|{|V<around*|(|BR<around*|(|\<pi\><rsup|<around*|(|2|)>>|)>,\<pi\><rsub|\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>-\<eta\><above|<below|<big|sum>|h=1>|H>\<cal-L\><rsub|h><rsup|k-1><around*|(|\<pi\><rsup|<around*|(|2|)>>|)>|}>|)>
    </equation*>

    when the real policy set is <math|\<cal-H\><rsub|\<varepsilon\>>> but we
    ignore it by using <math|\<cal-H\>>.
  </theorem>

  <\proof>
    \;

    <\equation*>
      <big|sum><rsub|k=1><rsup|K>V<around*|(|\<pi\><rsup|<around*|(|1|)>>,\<pi\><rsub|\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>-V<around*|(|\<pi\><rsup|<around*|(|1|)>><rsub|k>,\<pi\><rsub|\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>\<leq\><big|sum><rsub|k=1><rsup|K>V<around*|(|BR,\<pi\><rsub|\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>-V<around*|(|\<pi\><rsup|<around*|(|1|)>><rsub|k,\<varepsilon\>>,\<pi\><rsub|\<varepsilon\>><rsup|<around*|(|2|)>><rsub|><rsub|>|)>\<leq\><around*|[|Liu
      et.al. 2023|]>
    </equation*>

    \;
  </proof>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|ass:policy-set|<tuple|1|1>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|2|3>>
    <associate|auto-5|<tuple|2.1|3>>
    <associate|auto-6|<tuple|2.2|3>>
    <associate|eq:exact-hypo|<tuple|1|2>>
    <associate|eq:inex-reg|<tuple|4|2>>
    <associate|eq:inexact-hypo|<tuple|3|2>>
    <associate|eq:sub-reg|<tuple|2|2>>
    <associate|eq:uni-reward|<tuple|5|3>>
    <associate|hyp:id-br|<tuple|4|2>>
    <associate|hyp:regret|<tuple|5|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Problem
      setup> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Value Function and Best
      Response <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Regret Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Draft
      (Do not read this section)> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Proof idea for Hypothesis
      <reference|hyp:id-br> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Proof Idea for Hypothesis
      <reference|hyp:regret> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>
    </associate>
  </collection>
</auxiliary>