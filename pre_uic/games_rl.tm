<TeXmacs|2.1.2>

<style|<tuple|generic|python>>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Game And Reinforcement
  Learning>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|Games>

  As a gentel start, we consider games in normal-form.

  <\def>
    <em|(Normal-form game)> A normal-form game is a tuple
    <math|<around*|(|N,A<rsub|joint>,r<rsub|joint>|)>>, where

    <\itemize>
      <item><math|N>: number of players.

      <item><math|A<rsub|joint>=A<rsub|1>\<times\>\<cdots\>\<times\>A<rsub|N>>:
      joint action space for all agents. Each individual agent's action space
      is denoted as <math|<around*|{|A<rsub|i>|}><rsub|i=1><rsup|N>>.

      <item><math|r<rsub|joint>=<around*|(|r<rsub|1>,r<rsub|2>,\<ldots\>,r<rsub|N>|)>>:
      joint reward function, each <math|r<rsub|i>> is defined as
      <math|r<rsub|i>:A<rsub|joint>\<rightarrow\><around*|[|0,1|]>>.
    </itemize>
  </def>

  <math|r<rsub|joint>=<around*|(|r,r,\<ldots\>,r|)>>, indentical-interest
  game.

  <\example>
    (Lift-table)
  </example>

  <\def>
    <em|(Stochastic game)> A stochastic game is
    <math|<around*|(|N,H,S,s<rsub|0>,A<rsub|joint>,\<bbb-P\>,r<rsub|joint>,\<gamma\>|)>>,
    where

    <\itemize>
      <item><math|N>: number of players.

      <item><math|H>: time horizon.

      <item><math|S>: state space.

      <item><math|s<rsub|0>>: initial state.

      <item><math|A<rsub|joint>=A<rsub|1>\<times\>\<cdots\>\<times\>A<rsub|N>>:
      joint action space for all agents. Each individual agent's action space
      is denoted as <math|<around*|{|A<rsub|i>|}><rsub|i=1><rsup|N>>.

      <item><math|\<bbb-P\>:S\<times\>A<rsub|joint>\<rightarrow\>\<Delta\><around*|(|S|)>>.
      Transition kernel, where <math|\<Delta\><around*|(|S|)>> is the
      probalility simplex on the state space.

      <item><math|r<rsub|joint>=<around*|(|r<rsub|1>,r<rsub|2>,\<ldots\>,r<rsub|N>|)>>:
      joint reward function, each <math|r<rsub|i>> is defined as
      <math|r<rsub|i>:<with|color|red|S>\<times\>A<rsub|joint>\<rightarrow\><around*|[|0,1|]>>.

      <item><math|\<gamma\>\<in\><around*|[|0,1|]>>: discount factor.\ 
    </itemize>
  </def>

  The stochastic game is also known as <em|Markov game>. We mainly focus on
  the stochastic games where all agents share the same reward, i.e.,

  <\equation*>
    r<rsub|joint>=<around*|(|r,r,\<ldots\>,r|)>.
  </equation*>

  The stochastic games where agents share the same reward is also called
  <em|team Markov games> or <em|Markov teams>.

  <\example>
    \;

    <\itemize>
      <item><math|<around*|(|N,H,S=<around*|{|s<rsub|0>|}>,s<rsub|0>,A<rsub|joint>,\<bbb-P\>,r<rsub|joint>,\<gamma\>|)>>,
      repeated normal-form game.

      <item><math|<around*|(|N,1,S=<around*|{|s<rsub|0>|}>,s<rsub|0>,A<rsub|joint>,\<bbb-P\>,r<rsub|joint>,\<gamma\>|)>>,
      normal-form game.
    </itemize>
  </example>

  <subsection|Partially Observable>

  <\equation*>
    \<Omega\><rsub|joint>=\<Omega\><rsub|1>\<times\>\<cdots\>\<times\>\<Omega\><rsub|N>
  </equation*>

  <\equation*>
    \<cal-O\>=<around*|(|\<cal-O\><rsub|1>,\<ldots\>,\<cal-O\><rsub|N>|)>,<space|1em>\<cal-O\><rsub|i>:S\<times\>A<rsub|joint>\<rightarrow\>\<Delta\><around*|(|\<Omega\><rsub|i>|)>
  </equation*>

  See homework

  <section|Policies>

  Stochastic games:

  <\def>
    Policy\ 

    <\equation*>
      \<mu\>:S\<times\><around*|[|H|]>\<rightarrow\>\<Delta\><around*|(|A<rsub|1>|)>,<space|1em>\<pi\>:S*\<times\><around*|[|H|]>\<rightarrow\>\<Delta\><around*|(|A<rsub|2>|)>
    </equation*>
  </def>

  <\def>
    \;

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>
    </equation*>
  </def>

  Identical interest Normal-form:

  <\def>
    Policy/Strategy

    <\equation*>
      \<mu\>\<in\>\<Delta\><around*|(|A<rsub|1>|)>,<space|1em>\<pi\>\<in\>\<Delta\><around*|(|A<rsub|2>|)>.
    </equation*>
  </def>

  <\def>
    \;

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>\<triangleq\>\<bbb-E\><rsub|a\<sim\>\<mu\>,b\<sim\>\<pi\>>
      <around*|[|r<around*|(|a,b|)>|]>
    </equation*>
  </def>

  <\def>
    A Nash equi. is <math|\<pi\><rsub|joint><rsup|\<ast\>>=<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|*\<ast\>>|)>>
    such that

    <\equation*>
      V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|*\<ast\>>|)>\<geq\>V<around*|(|\<mu\>,\<pi\><rsup|*\<ast\>>|)><space|1em>\<forall\>\<mu\>\<in\>\<cal-U\>
    </equation*>

    and

    <\equation*>
      V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|*\<ast\>>|)>\<geq\>V<around*|(|\<mu\><rsup|\<ast\>>,\<pi\>|)><space|1em>\<forall\>\<pi\>\<in\>\<Pi\>.
    </equation*>
  </def>

  <section|Markov Decision Process>

  Conside a stochastic game defined as <math|<around*|(|2,H,S,s<rsub|0>,A<rsub|joint>,\<bbb-P\>,r<rsub|joint>,\<gamma\>|)>>.
  Given an potential partner <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\><rsub|type>>.
  From player <math|1>'s point of view, the environment becomes,

  <\equation*>
    \<bbb-P\><rsub|\<pi\><rsup|\<ast\>>><around*|(|s,a|)>=\<bbb-E\><rsub|b\<sim\>\<pi\><rsup|\<ast\>><around*|(|s|)>><around*|[|\<bbb-P\><around*|(|s,a,b|)>|]>,<space|1em>r<rsub|\<pi\><rsup|\<ast\>>><around*|(|s,a|)>=\<bbb-E\><rsub|b\<sim\>\<pi\><rsup|\<ast\>><around*|(|s|)>><around*|[|r<around*|(|s,a,b|)>|]>.
  </equation*>

  The environment that the player <math|1> facing is denoted as
  <math|<around*|(|H,S,s<rsub|0>,A,\<bbb-P\><rsub|\<pi\><rsup|\<ast\>>>,r<rsub|\<pi\><rsup|\<ast\>>>,\<gamma\>|)>>.

  <\def>
    <em|(Markov Decision Process)> <math|<around*|(|H,S,s<rsub|0>,A,\<bbb-P\><rsub|\<pi\><rsup|\<ast\>>>,r<rsub|\<pi\><rsup|\<ast\>>>,\<gamma\>|)>>

    <\equation*>
      V<rsub|\<pi\><rsup|\<ast\>>><around*|(|\<mu\>|)>=V<around*|(|\<mu\>,\<pi\><rsup|\<ast\>>|)>.
    </equation*>
  </def>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../../../../.Xmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-12|<tuple|1.9|?|../../../../../.Xmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-15|<tuple|1.12|?|../../../../../.Xmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-2|<tuple|1.1|2|../../../../../.Xmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-3|<tuple|2|?|../../../../../.Xmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-30|<tuple|1.9|?|../../../../../.Xmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-39|<tuple|1.12|?|../../../../../.Xmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-4|<tuple|3|?|../../../../../.Xmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-42|<tuple|1.12.3|?|../../../../../.Xmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-6|<tuple|1.3|?|../../../../../.Xmacs/texts/scratch/no_name_11.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|1tab>|1<space|2spc>Games
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|1tab>|2<space|2spc>Partially Observable
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>
    </associate>
  </collection>
</auxiliary>