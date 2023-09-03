<TeXmacs|2.1.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Claus and Boutilier
  1998>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Overview>

  <\enumerate>
    <item><with|font-series|bold|Setting>: Cooperative game with common
    interest, i.e., the reward <math|R> is defined as
    <math|R:\<cal-A\>\<rightarrow\>\<bbb-R\><rsub|+>>, where <math|\<cal-A\>>
    is the set of joint actions. No states. The setting adopted in this paper
    is also called <with|font-shape|italic|distributed bandit problem>.

    <item><with|font-series|bold|JAL and ILs>: <with|font-shape|italic|Both
    JALs and ILs will converge to an equilibrium in this specific setting of
    fully cooperative, repeated games (with a simlified version of Q
    learning, i.e., <math|Q<around*|(|a|)>\<leftarrow\>Q<around*|(|a|)>+\<lambda\><around*|(|r-Q<around*|(|a|)>|)>>,
    where <math|a> can be a single/joint action in IL/JAL). In fact, even
    though JALs have much more information at their disposal, they do not
    perform much differently from ILs in the straightforward application of
    Q-learning to MASs.> However, JAL can help to increase the likelihood to
    reach an optimal equilibrium in games with multiple equilibrium.

    <item><with|font-series|bold|Convergence of <math|Q> value in MAS>:\ 

    <with|font-shape|italic|When agent <math|i> is learning the value of its
    actions in the presence of other agents, it is learning in a
    nonstationary environment. Thus, the convergence of <math|Q>-values is
    not guaranteed. Naive application of <math|Q>-learning to MASs can be
    successful if we can ensure that each agent's strategy will eventually
    \Psettle.\Q>

    The game structure affects the convergence to the optimal equilibruium in
    JAL and ILs.
  </enumerate>

  <\remark>
    <with|font-shape|italic|An equilibrium (or joint action) is optimal if no
    other has greater value.> Example of a game with multiple equilibruim is
    given in the end of Section 2.1.
  </remark>

  <\def>
    <with|font-series|bold|(Distributed Bandit Problem)> Let <math|\<alpha\>>
    denote the index set of the agents, <math|\<cal-A\>\<triangleq\><below|\<times\>|i\<in\>\<alpha\>>A<rsub|i>>.
    <math|R<around*|(|a|)>=\<bbb-E\><around*|(|a|)>>, where
    <math|a\<in\>\<cal-A\>>. Strategy <math|\<pi\><rsub|i>\<in\>\<Delta\><around*|(|A<rsub|i>|)>>.
    Strategy profile <math|\<Pi\>=<around*|{|\<pi\><rsub|i>,i\<in\>\<alpha\>|}>>.
    Reduced strategy profile <math|\<Pi\><rsub|-i>>. A strategy
    <math|\<pi\><rsub|i>> is called best response to <math|\<Pi\><rsub|-i>>
    if <text-dots>
  </def>

  <\def>
    A strategy profile <math|\<Pi\>> is a Nash equilibrium iff
    <math|\<Pi\><around*|[|i|]>> is a best response to
    <math|\<Pi\><rsub|-i>>, for every agent <math|i>.
  </def>

  <\def>
    <with|font-series|bold|(Fictitiousplay)> Every player <math|i>
    create/update a reduced strategy profile <math|\<Pi\><rsub|-i>> based on
    the observed frequncy of other agents and takes a best response based on
    <math|\<Pi\><rsub|-i>>.
  </def>

  <\proposition>
    The fictitiousplay strategy will converge to an equilibrium in our simple
    cooperative games assuming that agents randomize when multiple best
    responses exist, and can be made to converge to an optimal equilibrium if
    appropriate mechanisms are adopted. It is also not hard to see that once
    the agents reach an equilibrium, they will remain there.
  </proposition>

  <\theorem>
    For distributed bandit problem, using an exploitive strategy induced
    <math|Q>-learning is guaranteed to converge to an equilibrium. Not
    guaranteed to optimal equilibrium.\ 
  </theorem>

  <\remark>
    <with|font-shape|italic|This theoretical guarantee of convergence may be
    of limited practical value for sufficiently complicated games. The key
    difficulty is that convergence relies on the use of decaying exploration:
    this is necessary to \Papproximate\Q the best-response condition of
    fictitious play.> The decaying exploration also ensures that concurrent
    exploration happens in a very low probability.
  </remark>

  <\question>
    What is miopic?
  </question>

  <\answer>
    All the agent take greedy policy.
  </answer>

  <\equation*>
    \;
  </equation*>

  \;

  \;
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Overview>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>