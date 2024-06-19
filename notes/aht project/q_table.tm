<TeXmacs|2.1.2>

<style|<tuple|generic|no-page-numbers|reduced-margins|algorithm-2e>>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>
  </hide-preamble>

  <section|Computation of Bayes-optimal policies>

  A belief-dependent <math|Q> network is defined as
  <math|Q:\<Delta\><rsub|M>\<times\>S\<rightarrow\>\<Delta\><around*|(|A|)>>.
  A state-dependent <math|Q<rsub|m>> network is defined as
  <math|Q<rsub|m>:S\<rightarrow\>\<Delta\><around*|(|A|)>>. Consider a
  deterministic belief such that <math|b<around*|(|h|)>=e<rsub|m>>. An
  optimal <math|Q>-network should satisfy:

  <\equation>
    Q<around*|(|e<rsub|m>,s|)>\<approx\>Q<rsup|\<ast\>><rsub|m><around*|(|s|)>,<space|1em>\<forall\>m\<in\><around*|[|M|]>,s\<in\>S<label|eq:cond-q-network>
  </equation>

  where <math|Q<rsup|\<ast\>><rsub|m><around*|(|s|)>> is an optimal
  state-dependent network for the MDP with model
  <math|<around*|(|\<bbb-P\><rsub|m>,r<rsub|m>|)>>. Assume that we have the
  following algorithm that returns a state-dependent <math|Q>-network
  <math|Q<rsub|w<rsub|m>>> that is a good approximation of
  <math|Q<rsup|\<ast\>><rsub|m>>. The term <math|w<rsub|m>> represents the
  parameters of the state-dependent <math|Q>-network
  <math|Q<rsub|w<rsub|m>>>.

  <\with|algorithm-text|<macro|<localize|Algorithm> (State-dependent
  <math|Q>-network)>>
    <\algorithm*>
      <algo2e-input> <math|<around*|(|\<bbb-P\><rsub|m>,r<rsub|m>|)>>

      <algo2e-output> <math|Q<rsub|w<rsub|m>>>
    </algorithm*>
  </with>

  Consider the following belief-dependent <math|Q>-network with initial
  weight <math|w=<around*|[|w<rsub|1>,w<rsub|2>,\<ldots\>,w<rsub|M>|]><rsup|\<top\>>>
  defined as

  <\equation>
    Q<rsub|w><around*|(|b<around*|(|h|)>,s|)>\<triangleq\>b<around*|(|h|)><rsup|\<top\>>Q<rsub|w><label|eq:belief-qnet>
  </equation>

  where <math|Q<rsub|w>=<around*|[|Q<rsub|w<rsub|1>>,Q<rsub|w<rsub|2>>,\<ldots\>,Q<rsub|w<rsub|M>>|]><rsup|\<top\>>>.
  Without any fine-tuning, the greedy policy based on <math|Q<rsub|w>> under
  a deterministic belief is optimal, i.e, the condition
  <math|<eqref|eq:cond-q-network>> is satisfied. For nondeterministic belief,
  we fine-tuned <math|Q<rsub|w>> with Algorithm 1 in
  <cite|guez_bayes-adaptive_2014>.

  <section|Computation of minimax policies>

  We slightly modified the <math|Q>-network defined in <eqref|eq:belief-qnet>
  as

  <\equation*>
    Q<rsub|b,w><around*|(|s|)>\<triangleq\>b<rsup|\<top\>>Q<rsub|w>.
  </equation*>

  The maximin prior and the optimal <math|Q>-value is computed\ 

  <\bibliography|bib|tm-plain|large_scale_pomdp>
    <\bib-list|1>
      <bibitem*|1><label|bib-guez_bayes-adaptive_2014>Arthur Guez, Nicolas
      Heess, David Silver<localize|, and >Peter Dayan.
      <newblock>Bayes-Adaptive Simulation-based Search with Value Function
      Approximation. <newblock><localize|In ><with|font-shape|italic|Advances
      in Neural Information Processing Systems>, <localize|volume><nbsp>27.
      Curran Associates, Inc., 2014.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|page-screen-margin|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|2|1>>
    <associate|bib-guez_bayes-adaptive_2014|<tuple|1|1>>
    <associate|eq:belief-q|<tuple|2|?>>
    <associate|eq:belief-qnet|<tuple|2|1>>
    <associate|eq:cond-q-network|<tuple|1|1>>
    <associate|eq:cond:q-network|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      guez_bayes-adaptive_2014
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Computation
      of Bayes-optimal policies> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>