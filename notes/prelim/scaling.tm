<TeXmacs|2.1.2>

<style|generic>

<\body>
  <section|Build an AI Agent to Collaborate With Human in Overcooked-AI>

  In our current experiment, the environment agents collaborating with is a
  simplified overcooked-AI. To scale up (the MEX algorithm):

  <\enumerate>
    <item>The way (value iteration algorithm as best response oracle in best
    reponse dynamics) we used to generate human policies can not be applied
    to large environment. Using <math|Q>-Learning or centralised MARL?

    <item>Will the model (given a human player's policy) still be given?

    <item>During the traing phase, which best reponse oracle should we
    choose?
  </enumerate>

  The final goal of our algorithm is to train an AI agent that can
  collaborate with unknown human agent. Our current result that require the
  human agent to be \Pclose\Q to the hypothesis set we generated leads to the
  following questions:

  <\itemize>
    <item>Can we build a measure to test whether the hypothesis set contains
    as many types of human as possible? Is type number a good candidate? How
    to generate a hypothesis set with a large type number?
  </itemize>

  <subsection|Implementation of Deep MEX?>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Build
      an AI Agent to Collaborate With Human in Overcooked-AI>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Implementation of Deep MEX?
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>
    </associate>
  </collection>
</auxiliary>