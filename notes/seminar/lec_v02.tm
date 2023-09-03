<TeXmacs|2.1.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Markov Decision Process
  Basic>|<doc-author|<author-data|<author-name|Yansong
  Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <\section>
    Markov Decision Process
  </section>

  <subsection|State Space Form>

  <\def>
    <with|font-series|bold|<with|font-shape|italic|(State Space Form, with
    Controller)>>

    <\equation*>
      x<rsub|t+1>=f<around*|(|x<rsub|t>,u<rsub|t>|)>
    </equation*>
  </def>

  Consider a state space system with perturbation

  <\equation*>
    x<rsub|t+1>=f<around*|(|x<rsub|t>,u<rsub|t>,w<rsub|t>|)>,
  </equation*>

  where <math|w<rsub|t>\<sim\>P>.

  <\problem>
    Prove that the system\ 

    <\equation*>
      x<rsub|t+1>=f<around*|(|x<rsub|t>,u<rsub|t>,w<rsub|t>|)>
    </equation*>

    is equivalent to\ 

    <\equation*>
      x<rsub|t+1>\<sim\>D<around*|(|x<rsub|t>,u<rsub|t>|)>.
    </equation*>
  </problem>

  <subsection|Markov Decision Process>

  <\def>
    An infinite-horizon Markov Decision Process is a tuple
    <math|<around*|(|S,A,r,\<gamma\>,\<bbb-P\>|)>>, where <math|S> is the
    state space, <math|A> is the action space,
    <math|r:S\<times\>A\<rightarrow\><around*|[|0,1|]>>,
    <math|\<gamma\>\<in\><around*|(|0,1|)>> is the discount factor and
    <math|\<bbb-P\>:S\<times\>A\<rightarrow\>\<Delta\><around*|(|S|)>> is the
    transition kernel (model, dynamics).
  </def>

  <\def>
    <with|font-series|bold|<with|font-shape|italic|(Stochastic and Stationary
    Policy)>> <math|\<pi\>:S\<rightarrow\>\<Delta\><around*|(|A|)>>.

    <\enumerate>
      <item><math|\<pi\>:S\<rightarrow\>A>, deterministic policy.

      <item><math|\<pi\>:S\<times\>T\<rightarrow\>\<Delta\><around*|(|A|)>>,
      nonstationary policy.
    </enumerate>
  </def>

  <\def>
    <with|font-series|bold|<with|font-shape|italic|(State Value Function)>>
    <math|V<rsup|\<pi\>>:S\<rightarrow\><around*|[|0,1|]>>, defined as\ 

    <\equation*>
      V<rsup|\<pi\>><around*|(|s|)>\<triangleq\>\<bbb-E\><rsub|s<rsub|h+1>\<sim\>\<bbb-P\><around*|(|s<rsub|h>,a<rsub|h>|)>,a<rsub|h>\<sim\>\<pi\><rsub|h><around*|(|s<rsub|h>|)>><rsub|><around*|(|<big|sum><rsub|h=1><rsup|\<infty\>>\<gamma\><rsup|h>r<around*|(|s<rsub|h>,a<rsub|h>|)>\<mid\>s<rsub|1>=s|)>.
    </equation*>

    <math|\<pi\>=<around*|(|\<pi\><rsub|1>,\<pi\><rsub|2>,\<ldots\>,|)>>
  </def>

  <\def>
    <with|font-series|bold|<with|font-shape|italic|(State-Action Value
    Function)>> <math|Q<rsup|\<pi\>>:S\<times\>A\<rightarrow\><around*|[|0,1|]>>

    <\equation*>
      Q<rsup|\<pi\>><around*|(|s,a|)>\<triangleq\>r<around*|(|s,a|)>+\<gamma\>\<bbb-E\><rsub|s<rprime|'>\<sim\>\<bbb-P\><around*|(|s,a|)>><around*|(|V<rsup|\<pi\>><around*|(|s<rprime|'>|)>|)>.
    </equation*>
  </def>

  <\def>
    <\with|font-series|bold>
      <with|font-shape|italic|(Optimal Policy)>
    </with>

    The optimal policy <math|\<pi\><rsup|\<star\>>>,

    <\equation*>
      \<pi\><rsup|\<star\>>=<below|argmax|\<pi\>>V<rsup|\<pi\>><around*|(|s<rsub|1>|)>.
    </equation*>
  </def>

  <\problem>
    Prove that an infinite horizon MDP with a stationary policy <math|\<pi\>>
    is a markov process. (Hint: prove <math|s<rprime|'>\<sim\>\<bbb-P\><around*|(|s,\<pi\><around*|(|s|)>|)>>
    is markovian.
  </problem>

  <\problem>
    Prove that for an infinite horizon MDP with discount factor
    <math|\<gamma\>\<in\><around*|(|0,1|)>>, the optimal policy is stationary
    and deterministic, i.e., <math|\<pi\><rsup|\<star\>>=<around*|(|\<pi\><rsup|\<star\>>,\<pi\><rsup|\<star\>>,\<pi\><rsup|\<star\>>,\<ldots\>,\<pi\><rsup|\<star\>>|)>>
    or <math|\<pi\><rsup|\<star\>>:S\<rightarrow\>\<Delta\><around*|(|A|)>>.
  </problem>

  <section|Value Iteration>

  <math|<around*|{|Q<rsub|1>,Q<rsub|2>,\<ldots\>,Q<rsub|\<infty\>>|}>>. Goal:
  <math|Q<rsub|\<infty\>>=Q<rsup|\<star\>>>,
  <math|Q<rsup|\<star\>><around*|(|s,a|)>\<triangleq\>r<around*|(|s,a|)>+\<gamma\>\<bbb-E\><rsub|s<rprime|'>\<sim\>\<bbb-P\><around*|(|s,a|)>><around*|(|V<rsup|\<pi\><rsup|\<star\>>><around*|(|s<rprime|'>|)>|)>>.

  <\equation*>
    Q<rsub|k+1><around*|(|s,a|)>\<leftarrow\>r<around*|(|s,a|)>+\<gamma\><below|max|a<rprime|'>\<in\>A><around*|(|\<bbb-E\><rsub|s<rprime|'>\<sim\>\<bbb-P\><around*|(|s,a|)>><around*|(|Q<rsub|k><around*|(|s<rprime|'>,a<rprime|'>|)>|)>|)>
  </equation*>

  <\equation*>
    \<pi\><rsup|\<star\>><around*|(|s|)>=<below|argmax|a\<in\>A>Q<rsub|\<infty\>><around*|(|s,a|)>
  </equation*>

  <\def>
    <with|font-series|bold|<with|font-shape|italic|(Bellman Optimality
    Operator)>> <math|\<cal-T\><rsup|\<star\>>:\<cal-Q\>\<rightarrow\>\<cal-Q\>>
    defined as\ 

    <\equation*>
      Q<rsub|k+1>\<triangleq\>\<cal-T\><rsup|\<star\>>Q<rsub|k>
    </equation*>

    <\equation*>
      Q<rsub|k+1><around*|(|s,a|)>\<leftarrow\>r<around*|(|s,a|)>+\<gamma\><below|max|a<rprime|'>\<in\>A><around*|(|\<bbb-E\><rsub|s<rprime|'>\<sim\>\<bbb-P\><around*|(|s,a|)>><around*|(|Q<rsub|k><around*|(|s<rprime|'>,a<rprime|'>|)>|)>|)>
    </equation*>

    for all <math|<around*|(|s,a|)>\<in\>S\<times\>A>.
  </def>

  <\theorem>
    <label|thm:convergence-of-value-iteration><math|Q<rsub|\<infty\>>> is the
    fixed point of <math|\<cal-T\><rsup|\<star\>>>, i.e.,

    <\equation>
      Q<rsub|\<infty\>>=\<cal-T\><rsup|\<star\>>Q<rsub|\<infty\>><label|eq:bellman>
    </equation>
  </theorem>

  <\problem>
    State and prove the Banach space fixed point theorem.
  </problem>

  <\problem>
    Prove Theorem <reference|thm:convergence-of-value-iteration> using Banach
    space fixed point theorem. (Hint: Prove that the
    <math|\<cal-T\><rsup|\<star\>>> in equation <eqref|eq:bellman>).
  </problem>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|auto-2|<tuple|1.1|?|../../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|auto-3|<tuple|1.2|?|../../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|auto-4|<tuple|2|?|../../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:bellman|<tuple|1|?|../../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|thm:convergence-of-value-iteration|<tuple|8|?|../../../.TeXmacs/texts/scratch/no_name_12.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Markov
      Decision Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>