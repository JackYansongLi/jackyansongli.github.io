<TeXmacs|2.1.2>

<style|generic>

<\body>
  <doc-data|<doc-title|IJCAI/ICML Plan>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<\author-email>
    yli340@uic.edu
  </author-email>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>>>>

  Our current paper contains several significant technical issues:

  <\itemize>
    <item>The model induced by a partner's policy <math|\<pi\>> is denoted as
    <math|<around*|(|\<bbb-P\><rsub|\<pi\>>,r<rsub|\<pi\>>|)>>, our current
    selection of the loss function <math|L<rsup|k><around*|(|\<pi\>|)>>
    (Section 2.2) and the Hellinger distance (Section 4.1) only measures the
    distance between <math|\<bbb-P\><rsub|\<pi\>>> and
    <math|\<bbb-P\><rsub|\<ast\>>>. However, this selection fails to work on
    MAB since there is no transition.

    <item>The regret analysis of the non-realizable case is incorrect; a new
    linear term, <math|K\<varepsilon\><rsub|app>>, should be added to the
    upper bound., Here, <math|\<varepsilon\><rsub|app>> measures the distance
    between the model induced by <math|\<pi\><rsup|\<ast\>><rsub|fin>> (a
    best policy in the hypothesis set) and <math|\<pi\><rsup|\<ast\>>>.

    <item>The MEX algorithm is not an online glacing algorithm under our
    current definition of type. To see this, consider that for
    <math|\<pi\>\<sim\>\<pi\><rsup|\<ast\>>> (under our current definition),
    if <math|\<pi\><rsup|\<ast\>>\<nin\>\<cal-H\>>, the MEX algorithm can not
    guarantee sublinear regret (according to the correct regret
    analysis<\footnote>
      In our previous false analysis, the linear term is
      <math|K\<varepsilon\><rsub|fin>> where
      <math|\<varepsilon\><rsub|fin>=0> if
      <math|\<pi\>\<sim\>\<pi\><rsup|\<ast\>>>. However,
      <math|\<pi\>\<sim\>\<pi\><rsup|\<ast\>>> cannot gurantee
      <math|\<varepsilon\><rsub|app>=0>. Thus, the\ 
    </footnote>). Therefore, to make MEX algorithm be online glacing, we need
    to introduce a stronger notion of the type<\footnote>
      Our current definition of type can still be used in the realizability
      case.\ 
    </footnote>.
  </itemize>

  For the next week (until Tuesday 11:59 P.M., Chicago time):

  <\itemize>
    <item>Revise the regret analysis in the realizability case by
    incorporating a newly defined loss function and a Hellinger distance that
    accounts for both transitions and rewards.

    <item>Given a formal definition of the online glacing algorithm. Why
    should an online algorithm be glacing? Is there any online algorithm that
    is not glacing? (Maybe a theorem that states MEX is online glacing under
    the stronger type definition but not online glacing under our current
    type definition.)

    <item>Give a stronger definition of type. Correct the regret analysis of
    the non-realizability case under the new definition of type. (This may
    not be completed within a week. However, the case study on this should be
    finished in this week.)

    <item>Draft a brief note on algorithms capable of switching strategies,
    such as one transitioning from MEX to Q-learning when it believes
    <math|\<pi\><rsup|\<ast\>>\<nin\>\<cal-H\>>. Circulate this note among
    colleagues to inquire about any related existing research on this topic.
    (This may not be completed within a week. It requires additional readings
    and a formal description of this work.)
  </itemize>

  Some other minor problems that should be fixed in the next few weeks (but
  not so urgent)

  <\itemize>
    <item>Revise section 6.2, the current version contaions too many
    \Phumans\Q.

    <item>Add a subsection to Section 2 that introduces the ad hoc teamwork
    in a formal way. State the existing results in this formal framework.

    <item>Add a subsection to Section 6 comparing the original overcooked-AI
    with our simplified overcooked-AI. This can be illustated by comparing
    the computational complexity of value iteration (treated as an oracle in
    our paper) in both environments. This aim is to convince readers that the
    simplification is only in the oracle, while the potential collaboration
    paradigms remains complex (even more complex compare to some pre-defined
    games in the original overcooked-AI.)
  </itemize>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|footnote-1|<tuple|1|1>>
    <associate|footnote-2|<tuple|2|1>>
    <associate|footnr-1|<tuple|1|1>>
    <associate|footnr-2|<tuple|2|1>>
  </collection>
</references>