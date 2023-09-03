<TeXmacs|2.1.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Laurent et al. 2012>|<doc-author|<author-data|<author-name|Jack
  Yansong LI>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    <with|font-series|bold|(Sufficient Condition for Non-Markovian)> The
    local decision process from the <math|i>-th agent's perspective is not
    Markovian.

    <\enumerate>
      <item>Some other agent <math|j> is a learner, i.e., history dependent.

      <item>Some divergent learning paths of the learner must be attainable.

      <item>The effects of the actions of the learner <math|j> must be
      observable by <math|i> in the same state as the end of divergent
      learning paths. <with|color|red|(YL: This is hard to justify)>
    </enumerate>
  </theorem>

  <\remark>
    RL algorithms with exploration such as <math|Q>-learning ensure that the
    learning paths of the learner are attainable.
  </remark>

  <\remark>
    The author gives an case example in section 5 by constructing an
    environment and altering the <math|Q>-learning factors to satisfy the
    above 3 conditions.\ 
  </remark>

  \;
</body>

<initial|<\collection>
</collection>>