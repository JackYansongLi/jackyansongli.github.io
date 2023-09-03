<TeXmacs|2.1>

<style|generic>

<\body>
  <section|Subtasks in AHT>

  In <cite|baumeister_survey_2022>, the author separate the AHT problem into
  <math|4> subtasks, <with|font-shape|italic|Knowledge Representation>,
  <with|font-shape|italic|Modelling Teammates>,
  <with|font-shape|italic|Action Selection> and
  <with|font-shape|italic|Adapting to Changes>. We discuss these four
  subtasks in our setting separately.

  <subsection|Knowledge Representation>

  <\quote-env>
    <with|font-shape|italic|\PThe learner requires a representation of the
    domain knowledge. This includes knowledge about the environment (e.g.,
    discrete or continuous, static or dynamic, etc.), its capabilities, and
    knowledge about potential teammates (e.g., similarity to past teammates,
    their theory of mind, etc.).\Q> <cite|baumeister_survey_2022>
  </quote-env>

  The only knowledge that is not well-defined to the AI agent in our setting
  is the knowledge about potential teammates. We adopt the
  <with|font-series|bold|Type-based> method
  <cite|rabinowitz_machine_2018><cite|xie_learning_2020><cite|zintgraf_deep_2022>
  for knowledge representation. In our setting, the knowledge of potential
  humans (teammate) is fully characterized by the policy set
  <math|\<Pi\><rsup|<around*|(|2|)>>>. Thus, each
  <math|\<pi\><rsup|<around*|(|2|)>>\<in\>\<Pi\><rsup|<around*|(|2|)>>>
  represents a type of human agent.\ 

  <subsection|Modeling Teammates>

  <\quote-env>
    <with|font-shape|italic|A key subtask for the learner is to model the
    information pertaining to teammates' behavior (e.g., classifying
    teammates by type in order to adapt to different teammates).>
    <cite|baumeister_survey_2022>
  </quote-env>

  <subsubsection|Explicit Representation of
  <math|\<pi\><rsup|<around*|(|2|)>>>>

  PLASTIC-MODEL is an algorithm proposed by Barrett et al.
  <cite|barrett_making_2017> for type-based ad hoc teamwork. In our setting,
  the main idea behind PLASTIC-MODEL is to learn a policy
  <math|\<pi\><rsup|<around*|(|2|)>>> of the the human agent based on a set
  of predefined types <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>>> (We add
  <wide||^> here to represent that the set of predefined types is ). The
  <math|\<pi\><rsup|<around*|(|2|)>>> is learned in a supervised manner.

  <subsubsection|Latent Variable Representation of
  <math|\<pi\><rsup|<around*|(|2|)>>>>

  Instead of learning an explicit form of
  <math|\<pi\><rsup|<around*|(|2|)>>>, the work in
  <cite|albrecht_belief_2016> learns <math|z<rsup|<around*|(|2|)>><rsub|t>\<in\>\<cal-Z\><rsup|<around*|(|2|)>>>
  by building a function

  <\equation*>
    \<psi\>:<space|1em><around*|(|S\<times\>A|)><rsup|t-1>\<rightarrow\>\<cal-Z\><rsup|<around*|(|2|)>>.
  </equation*>

  <subsection|Action Selection>

  <\quote-env>
    <with|font-shape|italic|The third subtask is the design of mechanisms
    used by the learner to select actions once it has an estimate of its
    teammates' behavior (observed or based on models of teammates).>
    <cite|baumeister_survey_2022>
  </quote-env>

  <subsection|Adapting to Changes>

  <\quote-env>
    <with|font-shape|italic|During interaction, the learner might receive new
    information about its teammates, the environment, or task objectives.
    Based on this information, the learner needs to adapt its behavior to
    improve coordination. This adaptation also includes merging the models
    provided by teammates>. <cite|baumeister_survey_2022>
  </quote-env>

  <\remark>
    Some works <cite|ravula_ad_2019> in solving
    <with|font-shape|italic|Adapting to Changes> reset the beliefs over
    <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>>> instead of adding new
    policies. We only consider the case that adding new policies to
    <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>>> in the following.
  </remark>

  PLASTIC-MODEL learns an explicit statistical model
  <math|\<pi\><rsup|<around*|(|2|)>,m+1><around*|(|a<rsub|2>\<mid\>s|)>> of
  the human agent's behavior in episode <math|m+1> based on their observed
  actions <math|<around*|{|s<rsub|t><rsup|m>,a<rsub|2,t><rsup|m>|}><rsub|t=1><rsup|m>>
  and the predefined types <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>><rsub|m>>.
  Formally, in PLASTIC-MODEL, <math|<wide|\<Pi\>|^><rsup|<around*|(|2|)>>> is
  updated in the end of each episode with\ 

  <\equation*>
    <wide|\<Pi\>|^><rsup|<around*|(|2|)>><rsub|m+1>\<leftarrow\>TransferLearning<around*|(|<wide|\<Pi\>|^><rsup|<around*|(|2|)>><rsub|m>,<around*|{|s<rsub|t><rsup|m>,a<rsub|2,t><rsup|m>|}><rsub|t=1><rsup|T>|)>.
  </equation*>

  <\bibliography|bib|tm-plain|AHT>
    <\bib-list|7>
      <bibitem*|1><label|bib-albrecht_belief_2016>Stefano<nbsp>V.<nbsp>Albrecht,
      Jacob<nbsp>W.<nbsp>Crandall<localize|, and >Subramanian Ramamoorthy.
      <newblock>Belief and Truth in Hypothesised Behaviours.
      <newblock><with|font-shape|italic|Artificial Intelligence>, 235:63\U94,
      jun 2016.<newblock>

      <bibitem*|2><label|bib-barrett_making_2017>Samuel Barrett, Avi
      Rosenfeld, Sarit Kraus<localize|, and >Peter Stone. <newblock>Making
      friends on the fly: Cooperating with new teammates.
      <newblock><with|font-shape|italic|Artificial Intelligence>,
      242:132\U171, jan 2017.<newblock>

      <bibitem*|3><label|bib-baumeister_survey_2022>Reuth Mirsky, Ignacio
      Carlucho, Arrasy Rahman, Elliot Fosong, William Macke, Mohan Sridharan,
      Peter Stone<localize|, and >Stefano<nbsp>V.<nbsp>Albrecht. <newblock>A
      Survey of Ad Hoc Teamwork Research. <newblock><localize|In >Dorothea
      Baumeister<localize| and >Jörg Rothe<localize|, editors>,
      <with|font-shape|italic|Multi-Agent Systems>, <localize|volume> 13442,
      <localize|pages >275\U293. Springer International Publishing, Cham,
      2022.<newblock>

      <bibitem*|4><label|bib-rabinowitz_machine_2018>Neil<nbsp>C.<nbsp>Rabinowitz,
      Frank Perbet, H.<nbsp>Francis Song, Chiyuan Zhang, S.<nbsp>M.<nbsp>Ali
      Eslami<localize|, and >Matthew Botvinick. <newblock>Machine Theory of
      Mind. <newblock>mar 2018.<newblock>

      <bibitem*|5><label|bib-ravula_ad_2019>Manish Ravula, Shani
      Alkoby<localize|, and >Peter Stone. <newblock>Ad Hoc Teamwork With
      Behavior Switching Agents. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of the Twenty-Eighth International
      Joint Conference on Artificial Intelligence>, <localize|pages
      >550\U556. Macao, China, aug 2019. International Joint Conferences on
      Artificial Intelligence Organization.<newblock>

      <bibitem*|6><label|bib-xie_learning_2020>Annie Xie,
      Dylan<nbsp>P.<nbsp>Losey, Ryan Tolsma, Chelsea Finn<localize|, and
      >Dorsa Sadigh. <newblock>Learning Latent Representations to Influence
      Multi-Agent Interaction. <newblock>nov 2020.<newblock>

      <bibitem*|7><label|bib-zintgraf_deep_2022>Luisa Zintgraf, Sam Devlin,
      Kamil Ciosek, Shimon Whiteson<localize|, and >Katja Hofmann.
      <newblock>Deep Interactive Bayesian Reinforcement Learning via
      Meta-Learning. <newblock>apr 2022.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-2|<tuple|1.1|1|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-3|<tuple|1.2|1|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-4|<tuple|1.2.1|1|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-5|<tuple|1.2.2|1|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-6|<tuple|1.3|1|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-7|<tuple|1.4|1|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-8|<tuple|1|2|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-albrecht_belief_2016|<tuple|1|2|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-barrett_making_2017|<tuple|2|2|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-baumeister_survey_2022|<tuple|3|2|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-rabinowitz_machine_2018|<tuple|4|2|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-ravula_ad_2019|<tuple|5|2|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-xie_learning_2020|<tuple|6|2|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-zintgraf_deep_2022|<tuple|7|2|../../../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      baumeister_survey_2022

      baumeister_survey_2022

      rabinowitz_machine_2018

      xie_learning_2020

      zintgraf_deep_2022

      baumeister_survey_2022

      barrett_making_2017

      albrecht_belief_2016

      baumeister_survey_2022

      baumeister_survey_2022

      ravula_ad_2019
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Subtasks
      in AHT> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Knowledge Representation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Modeling Teammates
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Explicit Representation of
      <with|mode|<quote|math>|\<pi\><rsup|<around*|(|2|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Latent Variable
      Representation of <with|mode|<quote|math>|\<pi\><rsup|<around*|(|2|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Action Selection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Adapting to Changes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>