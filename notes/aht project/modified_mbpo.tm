<TeXmacs|2.1.2>

<style|<tuple|generic|no-page-numbers|reduced-margins|algorithm-2e>>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>
  </hide-preamble>

  In short, this note:

  <\itemize>
    <item>Fixed the issues in Section 4 of <cite|janner_when_2019>: the bound
    <math|\<eta\><around*|(|\<pi\>|)>\<geq\><wide|\<eta\>|^><around*|(|\<pi\>|)>-c>
    is replaced by <math|<around*|\||\<eta\><around*|(|\<pi\>|)>-<wide|\<eta\>|^><around*|(|\<pi\>|)>|\|>\<leq\>c>.

    <item>Discuss the reason why we should increase the diversity of the
    ensemble: By increasing the diversity of ensemble,
    <math|<wide|\<eta\>|^><around*|(|\<pi\><rsup|k+1>|)>-<wide|\<eta\>|^><around*|(|\<pi\><rsup|k>|)>>
    becomes larger, indicating a more significant increase in cumulative
    reward on the estimated model. <with|color|red|(<with|color|red|>YL: The
    statement is not entirely correct. I demonstrated that greater diversity
    leads to a closer estimation of <math|Q<rsup|\<ast\>><rsub|k>> (defined
    in Section 3). However, since the ensemble <math|Q> underestimates, I
    mistakenly hypothesized that a closer estimation would result in a larger
    <math|Q>, and thus a larger <math|<wide|\<eta\>|^>> \ in practice.)>
  </itemize>

  <section|Model-based ensemble <math|Q>-learning>

  Consider the following algorithm, which integrates a <math|K>-model
  ensemble <math|<around*|{|p<rsub|\<theta\><rsup|m>>|}><rsub|m\<in\><around*|[|M|]>>>
  with a <math|K>-state-action value function ensemble
  <math|<around*|{|Q<rsub|\<psi\><rsup|m>>|}><rsub|m\<in\><around*|[|M|]>>>.
  In this note, we use the term <with|font-shape|italic|model>
  interchangeably with <with|font-shape|italic|transition kernel>.

  Before we proceed, let's clarify several nations as outlined in the list
  below:

  <paragraph|Notation:>

  <\itemize>
    <item><math|Q<rsub|\<psi\><rsup|m><rsub|k>>>: The <math|m>-th individual
    state action value function in episode <math|k> with parameter
    <math|\<psi\><rsub|k><rsup|m>>.

    <item><math|><math|p<rsub|\<theta\><rsup|m><rsub|k>>>: The <math|m>-th
    individual transition kernel in episode <math|k> with parameter
    <math|\<theta\><rsub|k><rsup|m>>.

    <item><math|p<rsup|\<ast\>>>: The transition kernel of the real
    environment.

    <item><math|\<cal-D\><rsub|real>>: Data collected under the real
    transition kernel.

    <item><math|\<cal-D\><rsub|sim><rsup|m>>: Data collected under the
    <math|m>-th individual transition kernel.
  </itemize>

  To simplify the notation, the following term is introduced:

  <\def>
    The <with|font-shape|italic|arithmetic mean combiner>
    <math|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>>> of the ensemble
    <math|><math|<around*|{|Q<rsub|\<psi\><rsup|m><rsub|k>>|}><rsub|m\<in\><around*|[|M|]>>>
    is defined as\ 

    <\equation*>
      <wide|Q|\<bar\>><rsub|\<psi\><rsub|k>>=<frac|1|M><big|sum><rsub|m\<in\><around*|[|M|]>>Q<rsub|\<psi\><rsub|k><rsup|m>>,
    </equation*>

    where <math|\<psi\><rsub|k>\<triangleq\><around*|[|\<psi\><rsub|k><rsup|1>,\<ldots\>,\<psi\><rsub|k><rsup|M>|]><rsup|\<top\>>>.
  </def>

  <\named-algorithm|Model-based ensemble <math|Q>-learning with model
  ensemble (MBEQ)>
    <algo2e-input> episodes number <math|K>, ensemble model number <math|M>,
    time horizon <math|H>.

    <algo2e-output>

    <\numbered>
      <\algo2e-for|<math|k\<in\><around*|[|K|]>>>
        <math|<around*|{|\<theta\><rsub|k><rsup|m>|}><rsub|m\<in\><around*|[|M|]>>\<leftarrow\><with|font-family|tt|ModelEstimation><around*|(|\<cal-D\><rsub|real>|)>>

        <\algo2e-for|<math|h\<in\><around*|[|H|]>>>
          <math|a<rsub|h>\<leftarrow\> \<varepsilon\><text|-><with|font-family|tt|Greedy><around*|(|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>>|)><around*|(|s<rsub|h>|)>>
          under real model <math|p<rsup|\<ast\>>>, add to
          <math|\<cal-D\><rsub|real>>.

          <\algo2e-for|<math|m\<in\><around*|[|M|]>>>
            Perform <math|d>-branched rollout using policy
            <math|\<varepsilon\><text|-><with|font-family|tt|Greedy><around*|(|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>>|)>>
            under estimated model <math|p<rsub|\<theta\><rsub|k><rsup|m>>>,
            add to <math|\<cal-D\><rsub|sim><rsup|m>>.\ 
          </algo2e-for>

          <math|<around*|{|\<psi\><rsub|k+1><rsup|m>|}><rsub|m\<in\><around*|[|M|]>>\<leftarrow\><with|font-family|tt|EnsembleQL><around*|(|<around*|{|\<cal-D\><rsub|sim><rsup|m>|}><rsub|m\<in\><around*|[|M|]>>|)>>.
        </algo2e-for>
      </algo2e-for>
    </numbered>
  </named-algorithm>

  The subroutine <math|<with|font-family|tt|EnsembleQL>> is introduced in
  Algorithm 2 in <cite|peer_ensemble_2021>. Based the result given by
  <cite|zheng_is_2022>, we simplify the above algorithm by removing the
  transition kernel ensemble and add a Lipschitz regularization term in
  <math|<with|font-family|tt|ModelEstimation>>. The modifed algorithm is
  shown in the following:

  <\named-algorithm|Model-based ensemble <math|Q>-learning without model
  ensemble (MBEQLipschitz)>
    <algo2e-input> episodes number <math|K>, ensemble model number <math|M>,
    time horizon <math|H>.

    <algo2e-output>

    <\numbered>
      <\algo2e-for|<math|k\<in\><around*|[|K|]>>>
        <math|\<theta\><rsub|k>\<leftarrow\><with|font-family|tt|ModelEstimation><around*|(|\<cal-D\><rsub|real>|)>>

        <\algo2e-for|<math|h\<in\><around*|[|H|]>>>
          <math|a<rsub|h>\<leftarrow\> \<varepsilon\><text|-><with|font-family|tt|Greedy><around*|(|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>>|)><around*|(|s<rsub|h>|)>>
          under real model <math|p<rsup|\<ast\>>>, add to
          <math|\<cal-D\><rsub|real>>.

          Perform <math|d>-branched rollout using policy
          <math|\<varepsilon\><text|-><with|font-family|tt|Greedy><around*|(|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>>|)>>
          under estimated model <math|p<rsub|\<theta\><rsub|k>>>, add to
          <math|\<cal-D\><rsub|sim>>.

          <math|<around*|{|\<psi\><rsub|k+1><rsup|m>|}><rsub|m\<in\><around*|[|M|]>>\<leftarrow\><with|font-family|tt|EnsembleQLwithLispchitzRegularization><around*|(|\<cal-D\><rsub|sim>|)>>.
        </algo2e-for>
      </algo2e-for>
    </numbered>
  </named-algorithm>

  The algorithm <math|<with|font-family|tt|EnsembleQLwithLispchitzRegularization>>
  is introduced in <cite|zheng_is_2022>.

  <section|Monotonic model-based improvement>

  In this section, we address the theoretical flaw in <cite|janner_when_2019>
  we discussed earlier this week. We denote <math|\<pi\>> as the policy
  <math|0<text|-><with|font-family|tt|Greedy><around*|(|<wide|Q|\<bar\>><rsub|\<psi\>>|)>>
  within episode <math|k>. We will omit the subscript <math|k> from our
  discussion in this section as it pertains solely to the acceleration of
  ensemble <math|Q>-learning using estimated model
  <math|p<rsub|\<theta\><rsub|k>>>, which will be simplified as
  <math|p<rsub|\<theta\>>>. Similarly, <math|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>>>
  is simplifed into <math|<wide|Q|\<bar\>><rsub|\<psi\>>>.

  In the <with|font-family|tt|MBEQLipschitz> algorithm, we maintain only one
  estimated model in each episode. Let's introduce the following quantities:

  <\itemize>
    <item>Generalization error in the <math|k>-th episode:
    <math|\<varepsilon\><rsub|gen>\<triangleq\>max<rsub|h\<in\><around*|[|H|]>>
    \<bbb-E\><rsub|s\<sim\>\<varepsilon\><text|-><with|font-family|tt|Greedy><around*|(|<wide|Q|\<bar\>><rsub|\<psi\>>|)>>
    <around*|[|D<rsub|TV><around*|(|p<rsup|\<ast\>><around*|\|||\|>p<rsub|\<theta\>>|)>|]>>.

    <item>Distribution shift in the <math|k>-th episode:
    <math|\<varepsilon\><rsub|\<pi\>>\<triangleq\>max<rsub|s\<in\>S>
    D<rsub|TV><around*|(|\<pi\><around*|(|s|)><around*|\|||\|>\<varepsilon\><text|-><with|font-family|tt|Greedy><around*|(|<wide|Q|\<bar\>><rsub|\<psi\>>|)><around*|(|s|)>|)>>.

    <item>Expected cumulative reward of policy <math|\<pi\>> under true model
    <math|p<rsup|\<ast\>>>: <math|\<eta\><around*|(|\<pi\>|)>>.

    <item>Expected cumulative reward of policy <math|\<pi\>> under estimated
    model <math|p<rsub|\<theta\>>>: <math|<wide|\<eta\>|^><around*|(|\<pi\>|)>>.
  </itemize>

  The following proposition holds by modifying the proof of Theorem 4.1 in
  <cite|janner_when_2019>.

  <\proposition>
    <label|prop:CumRewardDiff>The distance between the cumulative reward of
    policy <math|\<pi\>> under the true model and under the estimated model
    is bounded by

    <\equation*>
      <around*|\||\<eta\><around*|(|\<pi\>|)>-<wide|\<eta\>|^><around*|(|\<pi\>|)>|\|>\<leq\>C<around*|(|\<varepsilon\><rsub|gen>,\<varepsilon\><rsub|\<pi\>>|)>
    </equation*>

    where\ 

    <\equation*>
      C<around*|(|\<varepsilon\><rsub|gen>,\<varepsilon\><rsub|\<pi\>>|)>\<triangleq\><frac|2\<gamma\>r<rsub|max><around*|(|\<varepsilon\><rsub|gen>+2\<varepsilon\><rsub|\<pi\>>|)>|<around*|(|1-\<gamma\>|)><rsup|2>>+<frac|4r<rsub|max>\<varepsilon\><rsub|\<pi\>>|1-\<gamma\>>.
    </equation*>
  </proposition>

  Proposition <reference|prop:CumRewardDiff> implies the following corollary:

  <\corollary>
    <label|cor:MonoInc>If <math|<wide|\<eta\>|^><around*|(|\<pi\><rprime|'>|)>\<geq\><wide|\<eta\>|^><around*|(|\<pi\>|)>+D>,
    we have <math|\<eta\><around*|(|\<pi\><rprime|'>|)>\<geq\>\<eta\><around*|(|\<pi\>|)>+D-2C<around*|(|\<varepsilon\><rsub|gen>,\<varepsilon\><rsub|\<pi\>>|)>>.
  </corollary>

  <\proof>
    By Proposition <reference|prop:CumRewardDiff>,\ 

    <\equation*>
      \<eta\><around*|(|\<pi\><rprime|'>|)>\<geq\><wide|\<eta\>|^><around*|(|\<pi\><rprime|'>|)>-C<around*|(|\<varepsilon\><rsub|gen>,\<varepsilon\><rsub|\<pi\>>|)>\<geq\><wide|\<eta\>|^><around*|(|\<pi\><rprime|'>|)>+D-C<around*|(|\<varepsilon\><rsub|gen>,\<varepsilon\><rsub|\<pi\>>|)>\<geq\>\<eta\><around*|(|\<pi\>|)>+D-2C<around*|(|\<varepsilon\><rsub|gen>,\<varepsilon\><rsub|\<pi\>>|)>.
    </equation*>

    \;
  </proof>

  Corollary <reference|cor:MonoInc> implies that if we can increase the
  cumulative reward of policy <math|\<pi\>> under the estimated model by
  updating the policy from <math|\<pi\>> to <math|\<pi\><rprime|'>>. Then,
  the updated policy <math|\<pi\><rprime|'>> is guaranteed to perform better
  than <math|\<pi\>> in the real model.\ 

  <section|Diversity of ensemble <math|Q>-learning>

  The following definition is borrowed from <cite|wood_unified_2024>.

  <\def>
    (<em|Ambiguity/Diversity>) The ambiguity/diversity of the ensemble
    <math|<around*|{|Q<rsub|\<psi\><rsub|k><rsup|m>>|}><rsub|m\<in\><around*|[|M|]>>>
    with the combiner <math|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>>> is
    defined as\ 

    <\equation*>
      <frac|1|M><big|sum><rsub|m\<in\><around*|[|M|]>><around*|(|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>><around*|(|s,a|)>-Q<rsub|\<psi\><rsub|k><rsup|m>><around*|(|s,a|)>|)><rsup|2>.
    </equation*>
  </def>

  <\proposition>
    <label|prop:AmbDecop><em|(Ambiguity decomposition)> The following
    equality holds

    <\equation>
      <around*|(|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>><around*|(|s,a|)>-Q<rsup|\<ast\>><rsub|k><around*|(|s,a|)>|)><rsup|2>=<frac|1|M><big|sum><rsub|m\<in\><around*|[|M|]>><around*|(|Q<rsup|\<ast\>><rsub|k><around*|(|s,a|)>-Q<rsub|\<psi\><rsub|k><rsup|m>><around*|(|s,a|)>|)><rsup|2>-<frac|1|M><big|sum><rsub|m\<in\><around*|[|M|]>><around*|(|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>><around*|(|s,a|)>-Q<rsub|\<psi\><rsub|k><rsup|m>><around*|(|s,a|)>|)><rsup|2><label|eq:AmbDecomp>,
    </equation>

    where <math|Q<rsup|\<ast\>><rsub|k>> is the optimal state-action value
    function under model <math|p<rsub|\<theta\><rsub|k>>>.
  </proposition>

  <\proof>
    See Theorem 1 in <cite|wood_unified_2024>.
  </proof>

  <\problem>
    Consider two ensembles <math|<around*|{|Q<rsub|\<psi\><rsup|m>>|}><rsub|m\<in\><around*|[|M|]>>>
    and <math|<around*|{|Q<rsub|\<psi\><rprime|'><rsup|m>>|}><rsub|m\<in\><around*|[|M|]>>>
    with the same arithmetic mean combiner, i.e.,

    <\equation*>
      <wide|Q|\<bar\>><rsub|\<psi\>>=<frac|1|M><big|sum><rsub|m\<in\><around*|[|M|]>>Q<rsub|\<psi\><rsup|m>>=<wide|Q|\<bar\>><rsub|\<psi\><rprime|'>><around*|(|s,a|)>=<frac|1|M><big|sum><rsub|m\<in\><around*|[|M|]>>Q<rsub|\<psi\><rprime|'><rsup|m>>.
    </equation*>

    In this case, the left side of <eqref|eq:AmbDecomp> is identical, thus,
    independent with the diversities of these two ensembles.
  </problem>

  <\solution>
    By <eqref|eq:AmbDecomp>, we must have

    <\equation*>
      <around*|(|<wide|Q|\<bar\>><rsub|\<psi\>><around*|(|s,a|)>-Q<rsup|\<ast\>><around*|(|s,a|)>|)><rsup|2>=<around*|(|<wide|Q|\<bar\>><rsub|\<psi\><rprime|'>><around*|(|s,a|)>-Q<rsup|\<ast\>><around*|(|s,a|)>|)><rsup|2>.
    </equation*>

    Thus,

    <\equation*>
      <frac|1|M><big|sum><rsub|m\<in\><around*|[|M|]>><around*|[|<around*|(|Q<rsup|\<ast\>><around*|(|s,a|)>-Q<rsub|\<psi\><rsup|m>><around*|(|s,a|)>|)><rsup|2>-<around*|(|<wide|Q|\<bar\>><rsub|\<psi\>><around*|(|s,a|)>-Q<rsub|\<psi\><rsup|m>><around*|(|s,a|)>|)><rsup|2>|]>=<frac|1|M><big|sum><rsub|m\<in\><around*|[|M|]>><around*|[|<around*|(|Q<rsup|\<ast\>><around*|(|s,a|)>-Q<rsub|\<psi\><lprime|`><rsup|m>><around*|(|s,a|)>|)><rsup|2>-<around*|(|<wide|Q|\<bar\>><rsub|\<psi\><rprime|'>><around*|(|s,a|)>-Q<rsub|\<psi\><rprime|'><rsup|m>><around*|(|s,a|)>|)><rsup|2>|]>.
    </equation*>

    <\equation*>
      <frac|1|M><big|sum><rsub|m\<in\><around*|[|M|]>><around*|(|Q<rsup|\<ast\>><around*|(|s,a|)>-2Q<rsub|\<psi\><rsup|m>><around*|(|s,a|)>+<wide|Q|\<bar\>><rsub|\<psi\>><around*|(|s,a|)>|)>\<cdot\><around*|(|Q<rsup|\<ast\>><around*|(|s,a|)>-<wide|Q|\<bar\>><rsub|\<psi\>><around*|(|s,a|)>|)>-<around*|(|Q<rsup|\<ast\>><around*|(|s,a|)>-2Q<rsub|\<psi\><rprime|'><rsup|m>><around*|(|s,a|)>+<wide|Q|\<bar\>><rsub|\<psi\>><around*|(|s,a|)>|)>\<cdot\><around*|(|Q<rsup|\<ast\>><around*|(|s,a|)>-<wide|Q|\<bar\>><rsub|\<psi\><rprime|'>><around*|(|s,a|)>|)>=0.
    </equation*>

    <\equation*>
      <frac|1|M><big|sum><rsub|m\<in\><around*|[|M|]>><around*|[|-2Q<rsub|\<psi\><rsup|m>><around*|(|s,a|)>+2Q<rsub|\<psi\><rprime|'><rsup|m>><around*|(|s,a|)>|]>\<cdot\><around*|(|Q<rsup|\<ast\>><around*|(|s,a|)>-<wide|Q|\<bar\>><rsub|\<psi\>><around*|(|s,a|)>|)>=0.
    </equation*>

    <\equation*>
      <big|sum><rsub|m\<in\><around*|[|M|]>><around*|[|-Q<rsub|\<psi\><rsup|m>><around*|(|s,a|)>+Q<rsub|\<psi\><rprime|'><rsup|m>><around*|(|s,a|)>|]>=0.
    </equation*>
  </solution>

  \;

  The left-hand side term is known as <with|font-shape|italic|ensemble loss>.
  The first term on the right of <eqref|eq:AmbDecomp> is the average
  individual loss. The second term in the right-hand side of
  <eqref|eq:AmbDecomp> is the diversity of the ensemble. Since ambiguity is
  non-negative, Proposition <reference|prop:AmbDecop> guarantees the ensemble
  loss will be less than or equal to the average loss.

  Increasing the diversity may also increase the term
  <math|<big|sum><rsub|m\<in\><around*|[|M|]>><around*|(|Q<rsup|\<ast\>><around*|(|s,a|)>-Q<rsub|\<psi\><rsub|k><rsup|m>><around*|(|s,a|)>|)><rsup|2>>.
  Thus, there is a tradeoff between diversity and the estimation accuracy. In
  <cite|wood_unified_2024>, the tradeoff is further decomposed into tradeoff
  between diversity, bias, and variance.

  Inspired by <eqref|eq:AmbDecomp>, we introduce the following regularization
  term:

  <\equation>
    \<cal-L\><rsub|div><around*|(|s|)>\<triangleq\>-min<rsub|a\<in\>A><around*|[|<frac|1|M><big|sum><rsub|m\<in\><around*|[|M|]>><around*|(|<wide|Q|^><rsub|\<psi\><rsub|k>><around*|(|s,a|)>-Q<rsub|\<psi\><rsub|k><rsup|m>><around*|(|s,a|)>|)><rsup|2>|]>.<label|eq:DivRegularization>
  </equation>

  The term <eqref|eq:DivRegularization> can be added into the loss function
  <math|\<cal-L\>> in <with|font-family|tt|<math|EnsembleQL>> (See Algorithm
  2 in <cite|peer_ensemble_2021>). Thus, the modified loss function becomes
  <math|\<cal-L\><rsub|reg>=\<cal-L\>+\<lambda\>\<bbb-E\><rsub|s\<sim\>\<cal-B\>><around*|(|\<cal-L\><rsub|div><around*|(|s|)>|)>>,
  where <math|\<cal-B\>> is the replay buffer and <math|\<lambda\>> is a
  constant factor.

  <\named-algorithm|MBEQLipschitzWithDiversityRegularization>
    <algo2e-input> episodes number <math|K>, ensemble model number <math|M>,
    time horizon <math|H>.

    <algo2e-output>

    <\numbered>
      <\algo2e-for|<math|k\<in\><around*|[|K|]>>>
        <math|\<theta\><rsub|k>\<leftarrow\><with|font-family|tt|ModelEstimation><around*|(|\<cal-D\><rsub|real>|)>>

        <\algo2e-for|<math|h\<in\><around*|[|H|]>>>
          <math|a<rsub|h>\<leftarrow\> \<varepsilon\><text|-><with|font-family|tt|Greedy><around*|(|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>>|)><around*|(|s<rsub|h>|)>>
          under real model <math|p<rsup|\<ast\>>>, add to
          <math|\<cal-D\><rsub|real>>.

          Perform <math|d>-branched rollout using policy
          <math|\<varepsilon\><text|-><with|font-family|tt|Greedy><around*|(|<wide|Q|\<bar\>><rsub|\<psi\><rsub|k>>|)>>
          under estimated model <math|p<rsub|\<theta\><rsub|k>>>, add to
          <math|\<cal-D\><rsub|sim>>.

          <math|<around*|{|\<psi\><rsub|k+1><rsup|m>|}><rsub|m\<in\><around*|[|M|]>>\<leftarrow\><with|font-family|tt|EnsembleQLwithLispchitzAndDiversityRegularization><around*|(|\<cal-D\><rsub|sim>|)>>.
        </algo2e-for>
      </algo2e-for>
    </numbered>
  </named-algorithm>

  <\bibliography|bib|tm-plain|aaai2024>
    <\bib-list|4>
      <bibitem*|1><label|bib-janner_when_2019>Michael Janner, Justin Fu,
      Marvin Zhang<localize|, and >Sergey Levine. <newblock>When to Trust
      Your Model: Model-Based Policy Optimization.
      <newblock><slink|https://arxiv.org/abs/1906.08253v3>, jun
      2019.<newblock>

      <bibitem*|2><label|bib-peer_ensemble_2021>Oren Peer, Chen Tessler,
      Nadav Merlis<localize|, and >Ron Meir. <newblock>Ensemble Bootstrapping
      for Q-Learning. <newblock>apr 2021.<newblock>

      <bibitem*|3><label|bib-wood_unified_2024>Danny Wood, Tingting Mu,
      Andrew Webb, Henry Reeve, Mikel Luján<localize|, and >Gavin Brown.
      <newblock>A Unified Theory of Diversity in Ensemble Learning.
      <newblock>feb 2024.<newblock>

      <bibitem*|4><label|bib-zheng_is_2022>Ruijie Zheng, Xiyao Wang, Huazhe
      Xu<localize|, and >Furong Huang. <newblock>Is Model Ensemble Necessary?
      Model-based RL via a Single Model with Lipschitz Regularized Value
      Function. <newblock><localize|In ><with|font-shape|italic|The Eleventh
      International Conference on Learning Representations>. Sep
      2022.<newblock>
    </bib-list>
  </bibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|font-base-size|11>
    <associate|page-medium|paper>
    <associate|page-screen-margin|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1|1>>
    <associate|auto-3|<tuple|2|2>>
    <associate|auto-4|<tuple|3|2>>
    <associate|auto-5|<tuple|8|4>>
    <associate|bib-janner_when_2019|<tuple|1|4>>
    <associate|bib-peer_ensemble_2021|<tuple|2|4>>
    <associate|bib-wood_unified_2024|<tuple|3|4>>
    <associate|bib-zheng_is_2022|<tuple|4|4>>
    <associate|cor:MonoInc|<tuple|3|2>>
    <associate|eq:AmbDecomp|<tuple|1|3>>
    <associate|eq:DivRegularization|<tuple|2|3>>
    <associate|prop:AmbDecop|<tuple|5|3>>
    <associate|prop:CumRewardDiff|<tuple|2|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      janner_when_2019

      peer_ensemble_2021

      zheng_is_2022

      zheng_is_2022

      janner_when_2019

      janner_when_2019

      wood_unified_2024

      wood_unified_2024

      wood_unified_2024

      peer_ensemble_2021
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Model-based
      ensemble <with|mode|<quote|math>|Q>-learning>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|3tab>|Notation:
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Monotonic
      model-based improvement> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Diversity
      of ensemble <with|mode|<quote|math>|Q>-learning>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>