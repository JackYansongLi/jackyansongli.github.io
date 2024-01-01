<TeXmacs|2.1.2>

<style|generic>

<\body>
  <doc-data|<doc-title|Diverse Hypothesis Set
  Generation>|<doc-author|<author-data|<author-name|Jack Yansong Li>>>>

  The following notes mainly focus on generating a hypothesis set
  <math|\<cal-H\>> that is diverse enough to caputure as many as possible
  human policies.

  <section|Background>

  We use the following notations: <math|\<Pi\>>: set of all policies,
  <math|\<cal-H\><rsup|\<ast\>>>: set of all policies adopted by potential
  partners, and <math|\<cal-H\>>: hypothesis set that contains the policies
  generated. The goal of hypothesis set generation is

  <\itemize>
    <item><em|Goal>: Generating <math|\<cal-H\>> such that
    <math|\<cal-H\><rsup|\<ast\>>\<subset\>\<cal-H\>> and
    <math|<around*|\||\<cal-H\>|\|>\<less\><around*|\||\<Pi\>|\|>>.
  </itemize>

  However, <math|\<cal-H\><rsup|\<ast\>>> may contain many redundant
  policies. We classify these policies by an equivalence relation called
  <em|type>. A set of policies that policies belongs to distinct type is call
  <em|type-independent> set. The set of all largest type-independent subset
  of a set <math|\<cal-E\>> is denoted as
  <math|\<cal-P\><rsub|type><around*|(|\<cal-E\>|)>>.

  <\itemize>
    <item><em|Goal (given an online glancing algorithm)>: Generating
    <math|\<cal-H\>> such that <math|\<exists\>\<cal-H\><rsub|type>\<in\>\<cal-P\><rsub|type><around*|(|\<cal-H\><rsup|\<ast\>>|)>>,
    <math|\<cal-H\><rsub|type>\<subset\>\<cal-H\>>.
  </itemize>

  Since we have no information about <math|\<cal-H\><rsup|\<ast\>>>, it is
  hard to verify whether the above goal is achieved. However, it is clear if
  the following goal is achieved, the above goal is also achieved:

  <\itemize>
    <item><em|Opt-Goal (stronger, given an online glancing algorithm)>:
    Generating <math|\<cal-H\>> such that
    <math|\<exists\>\<cal-H\><rsub|type>\<in\>\<cal-P\><rsub|type><around*|(|\<Pi\>|)>>,
    <math|\<cal-H\><rsub|type>\<subset\>\<cal-H\>>.
  </itemize>

  However, <math|<around*|\||\<cal-H\><rsub|type>|\|>> may be large. Instead,
  we want to achieve the following suboptimal goal.

  <\itemize>
    <item><em|SubOpt-Goal (weaker, given an online glancing algorithm)>:
    Generating <math|\<cal-H\>> with <math|<around*|\||\<cal-H\>|\|>=N> such
    that <math|\<cal-H\>> is type-independent.
  </itemize>

  However, it is unclear how \Psuboptimal\Q the above goal is given a
  generated <math|\<cal-H\>> with <math|<around*|\||\<cal-H\>|\|>=N>. In the
  following, we give several ideas to formalize the problem and solve it.

  <section|TODO>

  <\enumerate>
    <item>The current definition of type does not match the intuition. A new
    definition of type should be considered. For example,
    <math|\<pi\><above|\<sim\>|\<psi\>>\<pi\><rprime|'>> if <math|\<psi\>>
    returns the same best response and <math|V<rsup|\<ast\>><around*|(|\<pi\>|)>=V<rsup|\<ast\>><around*|(|\<pi\><rsup|\<ast\>>|)>>.

    <item>Construct an example of a non online glancing algorithm.

    <item>It is still unclear what will happen if
    <math|\<pi\><rsup|\<ast\>>\<nin\>\<cal-H\>>. The analysis of infinite
    hypothesis set need to be revised. It will be helpful if the regret bound
    is a sublinear term adding a linear term that decreases w.r.t. some
    error. Thus, the error can be use in discretization to generate
    <math|\<cal-H\>>. To see this, adopt the result of our current (false)
    analysis and define <math|r<rsub|max>\<triangleq\>max<rsub|\<pi\>\<in\>\<Pi\>>
    V<around*|(|\<psi\><around*|(|\<pi\>|)>\<comma\>\<pi\>|)>> and
    <math|r<rsub|min>\<triangleq\>min<rsub|\<pi\>\<in\>\<Pi\>>V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>>.
    Now, construct a discretization sequence
    <math|<around*|{|r<rsub|j>|}><rsub|j=1><rsup|N+1>>, where
    <math|r<rsub|1>=r<rsub|min>>, <math|r<rsub|i>\<less\>r<rsub|j>> if
    <math|i\<less\>j>, and <math|r<rsub|N+1>=r<rsub|max>>. For every
    <math|j\<in\><around*|[|N+1|]>>, (Suppose we) can generate a policy
    <math|\<pi\><rsub|j>> such that <math|V<around*|(|\<psi\><around*|(|\<pi\><rsub|j>|)>,\<pi\><rsub|j>|)>\<in\><around*|[|r<rsub|j>,r<rsub|j+1>|]>><\footnote>
      In here, the definition of type follows our current definition of type,
      i.e., <math|\<pi\>\<sim\>\<pi\><rprime|'>> if
      <math|V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>=V<around*|(|\<psi\><around*|(|\<pi\><rprime|'>|)>,\<pi\><rprime|'>|)>>.
      If we follow the type definition that also requires
      <math|\<psi\><around*|(|\<pi\>|)>=\<psi\><around*|(|\<pi\><rprime|'>|)>>
      for <math|\<pi\>\<sim\>\<pi\><rprime|'>>, we need to add more
      requirement on the hypothesis generation. For example, instead of
      generating a single <math|\<pi\><rsub|j>> such that
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsub|j>|)>,\<pi\><rsub|j>|)>\<in\><around*|[|r<rsub|j>,r<rsub|j+1>|]>>,
      we need to generate a series of <math|<around*|{|\<pi\><rsub|j><rsup|i>|}>>
      such that <math|V<around*|(|\<psi\><around*|(|\<pi\><rsub|j><rsup|i>|)>,\<pi\><rsub|j><rsup|i>|)>=V<around*|(|\<psi\><around*|(|\<pi\><rsub|j><rsup|k>|)>,\<pi\><rsub|j><rsup|k>|)>>
      and <math|\<psi\><around*|(|\<pi\><rsup|i><rsub|j>|)>=\<psi\><around*|(|\<pi\><rsup|k><rsub|j>|)>>
      for all <math|i\<neq\>k>.\ 
    </footnote>. It is clear that <math|\<cal-H\>\<triangleq\><around*|{|\<pi\><rsub|j>|}><rsub|j=1><rsup|N>>
    is type-independent and

    <\equation*>
      <around*|\||V<around*|(|\<psi\><around*|(|\<pi\><rsub|j>|)>,\<pi\><rsub|j>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsub|j+1>|)>,\<pi\><rsub|j+1>|)>|\|>\<leq\>max<rsub|j\<in\><around*|[|N+1|]>><around*|(|r<rsub|j+1>-r<rsub|j>|)><space|1em>\<forall\>j\<in\><around*|[|N+1|]>.
    </equation*>

    Then, the metric <math|max<rsub|j\<in\><around*|[|N+1|]>><around*|(|r<rsub|j+1>-r<rsub|j>|)>>
    can be use in an upper bound of the linear term in the regret analysis.
    The key question of this work is: What the linear term actually depends
    on? Can we generate a hypothesis set so the factor of the linear term is
    small?

    <item>Can we make a switch rule so that the AI agent will switch to a
    standard RL algorithm such as PPO (starting from
    <math|\<mu\><rsup|0>=\<psi\><around*|(|\<pi\><rsup|\<ast\>><rsub|fin>|)>>,
    where <math|\<pi\><rsup|\<ast\>><rsub|fin>\<triangleq\>min<rsub|\<pi\>\<in\>\<cal-H\>><around*|\||V<rsup|\<ast\>><around*|(|\<pi\>|)>-V<rsup|\<ast\>><around*|(|\<pi\><rsup|\<ast\>>|)>|\|>>)
    when she noticed that <math|\<pi\><rsup|\<ast\>>\<nin\>\<cal-H\>>?
  </enumerate>

  <section|Comments by Shuo>

  I have some additional thoughts after reading your note:

  Why is explicit construction of $\\mathcal{H}$ necessary after all? Why is
  directly running a glancing online algorithm on $\\Pi$ a bad idea? Wouldn't
  the algorithm implicitly exploit the intrinsic complexity (defined by the
  equivalence relation) of $\\Pi$?

  I think item 4 in the to-do list is an interesting direction to look into,
  but I haven't read much on this topic. Before deciding whether to pursue
  this direction, you should ask people round (e.g., Mesrob) and conduct a
  literature survey to see what has been done \V I would be very surprised if
  similar problems have not been looked into. For example, I suspect that
  \Pinstance-optimal learning/interactive decision making\Q is relevant:

  https://arxiv.org/abs/2206.02326

  https://arxiv.org/abs/2304.12466

  If you do not plan to address these questions immediately, you should
  create a personal note to collect questions like these so that you have an
  opportunity to revisit them later. (If you don't, then you will soon forget
  these questions.)
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
    <associate|auto-3|<tuple|3|2>>
    <associate|footnote-1|<tuple|1|1>>
    <associate|footnr-1|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Background>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>TODO>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Comments
      by Shuo> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>