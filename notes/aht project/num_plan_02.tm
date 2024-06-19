<TeXmacs|2.1.2>

<style|<tuple|generic|no-page-numbers|reduced-margins|algorithm-2e>>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>

    <assign|cH|<macro|<with|font|cal|H>>>

    <assign|cR|<macro|<with|font|cal|R>>>

    <assign|cU|<macro|\<Pi\>>>

    <assign|pgap|<macro|<cR><around*|(|\<lambda\>|)>>>

    <assign|mr|<macro|<math|\<pi\><rsub|rob>>>>

    <assign|lm|<macro|<math|\<lambda\><rsub|mm>>>>

    <assign|lo|<macro|<math|\<lambda\><rsup|\<ast\>>>>>

    <\new-theorem|hyp>
      Hypothesis
    </new-theorem>
  </hide-preamble>

  <with|font-series|bold|Notation>:

  <\itemize>
    <item>We use <with|font-family|tt|\<backslash\>lam> to represent
    <with|font-family|tt|\<backslash\>lambda>

    <item>We use <with|font-family|tt|\<backslash\>pirob> to represent
    <with|font-family|tt|\<backslash\>pi_{\<backslash\>mathrm{rob}}>
  </itemize>

  <subsection|Compare robust policies with Bayes-optimal policies under true
  prior (finished)>

  Currently, we have computed <mr> and <math|\<pi\><rsub|\<lambda\><rsup|\<ast\>>>>
  for <math|\<lambda\><rsup|\<ast\>>=<around*|[|1/2,1/2|]><rsup|\<top\>>>.
  Next, we need to compute, <math|\<pi\><rsub|\<lambda\><rsup|\<ast\>>>> for
  all <math|\<lambda\><rsup|\<ast\>>\<in\>\<Delta\><rsub|2>>. Numerically,
  this is done by discretize <math|\<lambda\><rsup|\<ast\>>\<triangleq\><around*|[|\<lambda\><rsub|1>,\<lambda\><rsub|2>|]><rsup|\<top\>>>.
  The following is an example:

  <\session|octave|default>
    <\output>
      GNU Octave (9.1.0) Session in GNU TeXmacs

      Welcome to star and fork it at https://github.com/texmacs/octave
    </output>

    <\unfolded-io>
      \<gtr\>\<gtr\>\ 
    <|unfolded-io>
      for lam_1 = 0:0.1:1

      \ \ \ \ lam_2 = 1 - lam_1;

      \ \ \ \ lam_1

      \ \ \ \ lam_2

      \ \ \ \ % compute \\pi_{\\lambda}, where \\lambda = [lam_1, \\lam_2]

      end \ \ \ 
    <|unfolded-io>
      lam_1 = 0

      lam_2 = 1

      lam_1 = 0.1000

      lam_2 = 0.9000

      lam_1 = 0.2000

      lam_2 = 0.8000

      lam_1 = 0.3000

      lam_2 = 0.7000

      lam_1 = 0.4000

      lam_2 = 0.6000

      lam_1 = 0.5000

      lam_2 = 0.5000

      lam_1 = 0.6000

      lam_2 = 0.4000

      lam_1 = 0.7000

      lam_2 = 0.3000

      lam_1 = 0.8000

      lam_2 = 0.2000

      lam_1 = 0.9000

      lam_2 = 0.1000

      lam_1 = 1

      lam_2 = 0
    </unfolded-io>
  </session>

  Now we want to compare <math|L<around*|(|<mr>,<lo>|)>> with
  <math|L<around*|(|\<pi\><rsub|<lo>>,<lo>|)>> for all
  <math|<lo>\<in\>\<Delta\><rsub|2>>. The plot should be\ 

  <\session|octave|default>
    <\input>
      \<gtr\>\<gtr\>\ 
    <|input>
      % compute \\pirob

      for lam_1 = 0:0.1:1

      \ \ \ \ lam_2 = 1 - lam_1;

      \ \ \ \ % compute \\pi_\\lambda, where \\lambda = [lam_1, \\lam_2]

      \ \ \ \ % compute L(\\pirob,\\lambda) and L(\\pi_\\lambda,\\lambda),
      where \\lambda = [lam_1, \\lam_2]

      end

      % Draw L(\\pirob,\\lambda) w.r.t. lam_1

      % Draw L(\\pi_\\lambda,\\lambda) w.r.t. lam_1

      % Draw L(\\pirob,\\lambda) - L(\\pi_\\lambda,\\lambda) w.r.t. lam_1
    </input>
  </session>

  <subsection|Compare robust policies with Bayes-optimal policies under
  adversarial prior>

  First, we need a function that computes an adversarial/worst-case prior
  <math|\<lambda\><rsub|\<pi\>>> for a given policy <math|\<pi\>>. Recall
  that an adversarial prior is defined as

  <\equation*>
    \<lambda\><rsub|\<pi\>>\<in\><below|argmax|\<lambda\>\<in\>\<Delta\><rsub|M>>
    L<around*|(|\<pi\>,\<lambda\>|)>,
  </equation*>

  where <math|L<around*|(|\<pi\>,\<lambda\>|)>> is the Bayesian regret.

  <\session|octave|default>
    <\input>
      \<gtr\>\<gtr\>\ 
    <|input>
      function adv_prior = compute_adv_prior(policy)

      \ \ \ \ \ \ \ \ \ pass;

      end \ \ \ \ \ \ \ \ 
    </input>

    <\input>
      \<gtr\>\<gtr\>\ 
    <|input>
      \;
    </input>
  </session>

  Also, we already have the function to compute the Bayes-optimal policy
  under a subjective prior <math|\<lambda\>>, i.e.,

  <\session|octave|default>
    <\input>
      \<gtr\>\<gtr\>\ 
    <|input>
      function pi_prior = compute_bayes_opt(prior)

      \ \ \ \ \ \ \ \ \ pass;

      end \ \ \ \ \ \ \ \ 
    </input>

    <\input>
      \<gtr\>\<gtr\>\ 
    <|input>
      \;
    </input>
  </session>

  Now we compare the performance of Bayes-optimal policies with minimax
  policies under adversarial prior.

  <\session|octave|default>
    <\input>
      \<gtr\>\<gtr\>\ 
    <|input>
      % compute \\pirob as pirob

      for lam_1 = 0:0.1:1

      \ \ \ \ lam_2 = 1 - lam_1;

      \ \ \ \ lam = [lam_1; lam_2];

      \ \ \ \ pi_lam = compute_bayes-opt(lam);

      \ \ \ \ adv_prior = compute_adv_prior(pi_lam);
      \ \ \ \ \ \ \ \ \ \ \ \ \ 

      \ \ \ \ % TODO: compute L(pirob, adv_prior) and L(pi_lam,lam)

      end

      % TODO: Draw L(pirob, adv_prior) w.r.t. lam_1

      % TODO: Draw L(pi_lam, adv_propr) w.r.t. lam_1

      % TODO: Draw L(pi_lam, adv_prior) - L(pirob, adv_prior) w.r.t. lam_1
      \ \ \ \ \ \ \ 
    </input>
  </session>

  <subsection|Do not read>

  Using the package: <hlink|highway_env|https://highway-env.farama.org/quickstart/>.

  MDPs varing in the reward function by changing the
  <with|font-family|tt|lane_change_reward> or
  <with|font-family|tt|<code|other_vehicles_type>>? Please check the
  <hlink|APIs|https://github.com/Farama-Foundation/HighwayEnv/blob/master/highway_env/vehicle/behavior.py>.

  Now, we compute two Bayes-optimal policies
  <math|\<pi\><rsub|\<lambda\><rsub|uni>>> and <math|\<pi\><rsub|<lm>>>,
  where <math|\<lambda\><rsub|uni>> is the uniform prior and <math|<lm>> is
  the maximin prior defined as

  <\equation*>
    <lm>\<in\><below|argmax|\<lambda\>\<in\>\<Delta\><rsub|M>><space|1em>min<rsub|\<pi\>\<in\>\<Pi\>>
    L<around*|(|\<pi\>,\<lambda\>|)>.
  </equation*>
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
    <associate|auto-3|<tuple|3|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|1tab>|1<space|2spc>Compare robust policies with
      Bayes-optimal policies under true prior (finished)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|1tab>|2<space|2spc>Compare robust policies with
      Bayes-optimal policies under adversarial prior
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|3<space|2spc>Do not read
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>