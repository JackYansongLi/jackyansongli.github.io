<TeXmacs|2.1.2>

<project|main.tm>

<style|book>

<\body>
  <chapter|Collaborating With Unknown Agents: Mathematical Formulation>

  <section|Ad Hoc Teamworks>

  <\enumerate>
    <item><math|r<rsub|joint>=<around*|(|r,\<ldots\>,r|)>>
  </enumerate>

  The other agents'\ 

  <section|Game Theoretical Formulation>

  <\definition>
    <em|(Normal-Form Game)> <math|<around*|(|N,A<rsub|joint>,r<rsub|joint>|)>><label|def:normal>
  </definition>

  <\definition>
    <em|(Stochastic Game)> <math|<around*|(|N,H,S,A<rsub|joint>,P,r<rsub|joint>,\<gamma\>|)>>
  </definition>

  The Stochastic games are also known as Markov games. In this monograph, we
  mainly focus on the stochastic games where all agents share the same reward
  function, i.e., <math|r<rsub|1>=r<rsub|2>=\<cdots\>=r<rsub|N>=r>. The
  stochastic games with indentical reward for all agents are called
  <em|Markov Teams> or <em|Multi-agent MDPs>. A finite horizon stochastic
  game with finite joint state and action spaces can be formulated as a
  normal-form game. However, the size of all strategies of the normal-form
  game will grows exponentially with the number of states and time steps.

  <\definition>
    <em|(Partially Observable Stochastic Game)>
  </definition>

  <section|Markov Decision Process Formulation>

  Treating ad hoc agents as part of the environment, the environment AI
  agents interact with reduces to a single-agent environment. Depends on
  whether AI agents can observe the joint state, we formulate the
  single-agent environment by MDP or POMDP defined below:

  <\definition>
    <em|(Markov Decision Process)>
  </definition>

  <\definition>
    <em|(Partially Observable MDP)>
  </definition>

  \;
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|1>
    <associate|page-first|11>
    <associate|page-medium|paper>
    <associate|section-nr|0>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|2|11>>
    <associate|auto-2|<tuple|2.1|11>>
    <associate|auto-3|<tuple|2.2|11>>
    <associate|auto-4|<tuple|2.3|11>>
    <associate|def:normal|<tuple|2.1|11>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Collaborating
      With Unknown Agents: Mathematical Formulation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      2.1<space|2spc>Ad Hoc Teamworks <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      2.2<space|2spc>Game Theoretical Formulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      2.3<space|2spc>Markov Decision Process Formulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>
    </associate>
  </collection>
</auxiliary>