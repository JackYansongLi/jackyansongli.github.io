<TeXmacs|2.1.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|JAL and IL>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Different between JAL and IL>

  <\enumerate>
    <item>[Claus and Boutilier 1998]: In distributed bandit problem setting
    with Q learning.

    <with|font-shape|italic|We show that both JALs and ILs will converge to
    an equilibrium in this specific setting of fully cooperative, repeated
    games. In fact, even though JALs have much more information at their
    disposal, they do not perform much differently from ILs in the
    straightforward application of Q-learning to MASs. We also observe that
    in games with multiple equilibria, optimality of the \Pagreed upon\Q
    equilibrium is not assured.>\ 

    <with|font-shape|italic|In retrospect, this should not be too surprising.
    While JALs are able to distinguish Q-values of different joint actions,
    their ability to use this information is circumscribed by the action
    selection mechanism.An agent maintains beliefs about the strategy being
    played by the other agents and \Pexploits\Q actions according to expected
    value based on these beliefs. In other words, the value of individual
    actions \Pplugged in\Q to the exploration strategy is more or less the
    same as the Q-values learned by ILs>.

    <\with|font-shape|italic>
      Finally, the key drawback for JALs (which know the joint Q-values) is
      the fact that beliefs based on a lot of experience require a
      considerable amount of contrary experience to be overcome.
    </with>

    <\with|font-shape|italic>
      Tan [20] and Sen, Sekaran and Hale [16] ap-ply RL to independent agents
      and demonstrate empirical convergence.
    </with>

    [20]: M. Tan. 1993 [16]: S. Sen, M. Sekaran 1994

    <item>[Zhang et. al. 2021]:

    <with|font-shape|italic|However, convergence of the Q-function does not
    necessarily imply that of the equilib- rium policy for the Markov team,
    as any combination of equilibrium policies extracted at each agent may
    not constitute an equilibrium policy, if the equilibrium policies are
    non- unique, and the agents fail to agree on which one to select. Hence,
    convergence to the NE policy is only guaranteed if either the equilibrium
    is assumed to be unique [159], or the agents are coordinated for
    equilibrium selection. The latter idea has first been validated in the
    cooperative repeated games setting [115], a special case of Markov teams
    with a singleton state, where the agents are joint-action learners (JAL),
    maintaining a Q-value for joint actions, and learning empirical models of
    all others. Convergence to equilib- rium point is claimed in [115],
    without a formal proof.>

    [115]: Claus and Boutilier 1998

    \;

    \;
  </enumerate>

  <section|Different Settings of JAL>

  <\enumerate>
    <item>[Claus and Boutilier 1998]: <with|font-shape|italic|We note that
    most game theoretic models assume that each agent can observe the actions
    executed by its counterparts with certainty. As pointed out and addressed
    in [1, 7], this assumption is often unrealistic. A more general model
    allows each agent to obtain an observation which is related
    stochastically to the actual joint action selected.>

    [1]: C. Boutilier. 1996 [7]: J. Hu and M. P. Wellman 1996

    <item>[Laurent et al. 2011]: <with|font-shape|italic|However, in many
    practical applications it is not reasonable to assume the observability
    of the actions of the others [20]. Most agents interact with their
    surroundings by relying on sensory information and action recognition is
    often far from trivial. With no knowledge of the actions of the other
    agents and payoffs, the problem becomes more difficult.>

    [20]: Francisco S. Melo and Manuel C. Lopes. 2007
  </enumerate>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Different
      between JAL and IL> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Different
      Settings of JAL> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>