<TeXmacs|2.1.2>

<style|generic>

<\body>
  <doc-data|<doc-title|Problem Set <math|1>>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|Definition of game environments>

  <\problem>
    <em|(15 pt)> Given a two-player normal-form game
    <math|<around*|(|2,A<rsub|1>\<times\>A<rsub|2>,r<rsub|joint>|)>> with
    player <math|2>'s policy <math|\<pi\>\<in\>\<Delta\><around*|(|A<rsub|2>|)>>
    fixed. Construct a single-agent environment from the player <math|1>'s
    point of view.\ 

    <em|Hint:> The model of the single agent environment is also called
    <em|multi-armed bandit> defined as <math|<around*|(|2,A,r|)>>, where the
    reduced action space <math|A> and the corresponding reward <math|r>
    should be defined by you.
  </problem>

  <\solution>
    \;
  </solution>

  <\problem>
    <em|(15 pt)> Reformulate the team Markov game
    <math|<around*|(|N,H,S,s<rsub|0>,A<rsub|joint>,\<bbb-P\>,r,\<gamma\>|)>>,
    where <math|<around*|\||S|\|>\<less\>\<infty\>>,
    <math|<around*|\||A<rsub|joint>|\|>\<less\>\<infty\>> into a
    indentical-interest normal-form game <math|<around*|(|N,A<rsub|joint><rprime|'>,r<rprime|'>|)>>.
    Show that the size of the joint action space
    <math|<around*|\||A<rsub|joint><rprime|'>|\|>> grows exponentially with
    respect to <math|<around*|\||S|\|>>.
  </problem>

  <\solution>
    \;
  </solution>

  <\problem>
    <em|(30 pt)> Extend the definition of stochastic game into partially
    observable setting (usually called <em|partially observable stochastic
    game>), based on the definition you just created

    <\enumerate>
      <item>Define policies and cumulative reward.

      <item>Define regrets for player <math|1> given other player's joint
      policies.

      <item>Reformulate the <em|partially observable stochastic game> into a
      single agent environment in player <math|1>'s perspective given other
      player's joint policies. The single agent environment is called
      partially observable Markov decision process.
    </enumerate>
  </problem>

  <\solution>
    \;
  </solution>

  <section|Regret analysis>

  <\problem>
    <em|(15 pt)> Construct an example using normal-form game that shows the
    regret minimization of player <math|1> returns a better strategy than the
    cumulative reward maximization. \ 

    <em|Hint>: Construct a two-player identical interest game. Carefully
    design the reward so the reward varies dramatically with respect to
    player <math|2>'s action.
  </problem>

  <\solution>
    \;
  </solution>

  <section|Markov decision process>

  <\problem>
    <em|(25 pt)> Prove that the optimal policy of an infinite
    <math|<around*|(|H=\<infty\>|)>> Markov decision process is stationary,
    i.e., <math|\<mu\><rsup|\<ast\>>:S\<rightarrow\>\<Delta\><around*|(|A|)>>
    instead of <math|\<mu\><rsup|\<ast\>>:S\<times\>\<bbb-N\><rsub|+>\<rightarrow\>\<Delta\><around*|(|A|)>>.
  </problem>

  <\solution>
    \;
  </solution>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Definition
      of game environments> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Regret
      analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Markov
      decision process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>