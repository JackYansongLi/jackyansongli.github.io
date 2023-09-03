<TeXmacs|2.1.1>

<style|notes>

<\body>
  <notes-header>

  <chapter*|Multiagent Reinforcement Learning>

  <section|Single-Agent RL>

  By the large, RL algorithms can be categorized into two mainstream types,
  <with|font-shape|italic|value-based> and
  <with|font-shape|italic|policy-based> methods.

  <subsection|Value-Based Methods>

  <\equation*>
    <wide|Q|^><around*|(|s,a|)>\<leftarrow\><around*|(|1-\<alpha\>|)><wide|Q|^><around*|(|s,a|)>+<below|max|a<rprime|'>><around*|(|r+\<gamma\><wide|Q|^><around*|(|s<rprime|'>,a<rprime|'>|)>|)>.
  </equation*>

  <subsection|Policy-Based Methods>

  <\equation*>
    \<nabla\>J<around*|(|\<theta\>|)>=\<bbb-E\><rsub|a\<sim\>\<pi\><rsub|\<theta\>><around*|(|\<cdot\><around*|\||s|\<nobracket\>>|)>,s\<sim\>\<eta\><rsub|\<pi\><rsub|\<theta\>>><around*|(|\<cdot\>|)>><around*|(|Q<around*|(|s,a|)>\<nabla\>log\<pi\><rsub|\<theta\>><around*|(|a<around*|\||s|\<nobracket\>>|)>|)>.
  </equation*>

  <section|MARL Formulation>

  <subsection|Markov/Stochastic Games>

  <\remark>
    It can only handle the fully observed case since the value function
    depends on the state space <math|S> observed by all agents.
  </remark>

  <subsection|Extensive-Form Games>

  <section|Challenges in MARL Theory>

  <subsection|Non-Unique Learning Goals>

  <\enumerate>
    <item>The learning dynamics that are devised to converge to NE may not be
    justifiable for practical MARL agents.

    <item>Converges to NE is a controversial criterion. Seperate learning
    goals into <with|font-shape|italic|stable> and
    <with|font-shape|italic|rational>.

    <item><with|font-shape|italic|Communication-efficient> MARL.
  </enumerate>

  <subsection|Non-Stationarity>

  <subsection|Scalability Issue>

  <subsection|Various Infomation Structure (Who Knows What?)>

  <\enumerate>
    <item>Centralized setting.

    <item>Decentralized setting with networked agents.

    <item>Fully decentralized setting.
  </enumerate>

  <section|MARL Algorithms with Theory>

  <subsection|Cooperative>

  Value-based methods such as <math|Q>-learning are guaranteed to converge by
  maximizing over joint actions. However, the resulting policy may not be
  Nash equilibrium except:

  <\enumerate>
    <item>NE policy is unique.

    <item>Agents are coordinated for an equilibrium selection.
  </enumerate>

  <\remark>
    <with|font-shape|italic|Joint-action learner> (JAL) maintains a
    <math|Q>-value for joint actions. The agents are coordinated for an
    equilibrium selection.\ 
  </remark>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|?>>
    <associate|auto-10|<tuple|3.2|?>>
    <associate|auto-11|<tuple|3.3|?>>
    <associate|auto-12|<tuple|3.4|?>>
    <associate|auto-13|<tuple|4|?>>
    <associate|auto-14|<tuple|4.1|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|1.1|?>>
    <associate|auto-4|<tuple|1.2|?>>
    <associate|auto-5|<tuple|2|?>>
    <associate|auto-6|<tuple|2.1|?>>
    <associate|auto-7|<tuple|2.2|?>>
    <associate|auto-8|<tuple|3|?>>
    <associate|auto-9|<tuple|3.1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Multiagent
      Reinforcement Learning> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      1.<space|2spc>Single-Agent RL <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      <with|par-left|<quote|1tab>|1.1.<space|2spc>Value-Based Methods
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.2.<space|2spc>Policy-Based Methods
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      2.<space|2spc>MARL Formulation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      <with|par-left|<quote|1tab>|2.1.<space|2spc>Markov/Stochastic Games
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|2.2.<space|2spc>Extensive-Form Games
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      3.<space|2spc>Challenges in MARL Theory
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      <with|par-left|<quote|1tab>|3.1.<space|2spc>Non-Unique Learning Goals
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|3.2.<space|2spc>Non-Stationarity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|3.3.<space|2spc>Scalability Issue
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|3.4.<space|2spc>Various Infomation
      Structure (Who Knows What?) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      4.<space|2spc>MARL Algorithms with Theory
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>

      <with|par-left|<quote|1tab>|4.1.<space|2spc>Cooperative
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>
    </associate>
  </collection>
</auxiliary>