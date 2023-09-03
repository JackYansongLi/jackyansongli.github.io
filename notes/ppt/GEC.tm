<TeXmacs|2.1.1>

<style|<tuple|beamer|framed-theorems>>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>

    <assign|definition-text|<macro|<localize|Definition> (Generalized Eluder
    Coefficient)>>
  </hide-preamble>

  <screens|<\shown>
    <tit|Generalized Eluder Coefficient>

    <section*|Episodic Interactive Decision Making Problem:
    <math|<around*|(|\<cal-O\>,\<cal-A\>,H,\<bbb-P\>,R|)>>>

    <\itemize>
      <item><math|\<cal-O\>,\<cal-A\> >: observation and action space

      <item><math|H>: length of horizon

      <item><math|\<bbb-P\>= {\<bbb-P\><rsub|h>}<rsub|h\<in\><around*|[|H|]>>>:
      <math|\<bbb-P\><rsub|h><around*|(|o<rsub|h+1>\<mid\>\<tau\><rsub|h>|)>>

      <item><math|R=<around*|{|R<rsub|h>|}><rsub|h\<in\><around*|[|H|]>>>:
      <math|R<rsub|h><around*|(|o<rsub|h>,a<rsub|h>|)>>
    </itemize>

    <section*|Example>

    <\itemize>
      <item>Markov Decision Process: <math|\<cal-O\>=S>

      <item>Partially Observable MDP

      <item>Predictive State Representation
    </itemize>
  </shown>|<\hidden>
    <tit|Exploration-Exploitation Tradeoff>

    <\itemize>
      <item>optimism in the face of uncertainty

      <item>posterior sampling
    </itemize>

    \;
  </hidden>|<\hidden>
    <tit|Unknown Model>

    <\definition*>
      A model-based hypothesis class is a set of model <math|\<cal-H\>> such
      that

      <\equation*>
        f=<around*|(|\<bbb-P\><rsub|f>,R<rsub|f>|)>\<in\>\<cal-H\>
      </equation*>
    </definition*>

    <\enumerate>
      <\itemize>
        <item><math|\<pi\><rsub|f>=<around*|{|\<pi\><rsub|h,f>|}><rsub|h\<in\><around*|[|H|]>>>

        <item><math|V<rsub|f>=<around*|{|V<rsub|h,f>|}><rsub|h\<in\><around*|[|H|]>>>
      </itemize>
    </enumerate>
  </hidden>|<\hidden>
    <tit|Generalized Eluder Coefficient>

    \;

    <\definition*>
      Given a <math|\<cal-H\>>, a discrepancy function
      <math|\<ell\>=<around*|{|\<ell\><rsub|f>|}><rsub|f\<in\>\<cal-H\>>>, an
      exploration policy class <math|\<Pi\><rsub|exp>>, and
      <math|\<epsilon\>\<gtr\>0>, the generalized eluder coefficient
      <math|GEC<around*|(|\<cal-H\>,\<ell\>,\<Pi\><rsub|exp>,\<epsilon\>|)>>
      is the smallest <math|d\<gtr\>0> such that

      <\equation*>
        <big|sum><rsub|k=1><rsup|K>V<rsub|f<rsup|k>>-V<rsup|\<pi\><rsub|f<rsup|k>>>\<leq\><around*|[|d<big|sum><rsub|h=1><rsup|H><big|sum><rsub|k=1><rsup|K><around*|(|<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<pi\><rsub|exp><around*|(|f<rsup|s>,h|)>>\<ell\><rsub|f<rsup|s>><around*|(|f<rsup|k>,\<xi\><rsub|h>|)>|)>|]><rsup|1/2>+2<sqrt|d
        H T>+\<epsilon\>H T
      </equation*>
    </definition*>
  </hidden>|<\hidden>
    <tit|Generalized Eluder Coefficient>

    <section*|Optimism + Low GEC \<approx\> Sample Efficiency>

    <\align>
      <tformat|<table|<row|<cell|Reg<around*|(|K|)>=>|<cell|<big|sum><rsub|k=1><rsup|K>V<rsup|*<lprime|\<asterisk\>>>-V<rsup|\<pi\><rsub|f<rsup|k>>>>>|<row|<cell|<above|\<leq\>|optimism>>|<cell|<big|sum><rsub|k=1><rsup|K>V<rsub|f<rsup|k>>-V<rsup|\<pi\><rsub|f<rsup|k>>>>>|<row|<cell|<above|\<leq\>|GEC>>|<cell|<around*|[|d<big|sum><rsub|h=1><rsup|H><big|sum><rsub|k=1><rsup|K><around*|(|<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<pi\><rsub|exp><around*|(|f<rsup|s>,h|)>>\<ell\><rsub|f<rsup|s>><around*|(|f<rsup|k>,\<xi\><rsub|h>|)>|)>|]><rsup|1/2>+2<sqrt|d
      H T>+\<epsilon\>H T>>|<row|<cell|<above|\<leq\>|training<space|1em>error\<leq\>\<beta\>>>|<cell|<sqrt|d
      H T\<beta\>>>>>>
    </align>
  </hidden>|<\hidden>
    <tit|Maximize to Explore>

    For episode <math|k>, choose <math|f<rsup|k>> such that

    <\equation*>
      f<rsup|k>=<below|argsup|f\<in\>\<cal-H\>><around*|{|V<rsub|1,f><around*|(|x<rsub|1>|)>-\<eta\>L<rsub|f><around*|(|\<cal-D\><rsup|k-1>|)>|}>
    </equation*>

    Execute <math|\<pi\><rsub|exp><around*|(|f<rsup|k>|)>> to collect data.

    \;
  </hidden>|<\hidden>
    <tit|Generic Posterior Sampling Algorithm>

    For episode <math|k>, sample <math|f<rsup|k>\<sim\>p<rsup|k>> such that

    <\equation*>
      p<rsup|k><around*|(|f|)>\<propto\>p<rsup|0><around*|(|f|)>\<cdot\>exp<around*|(|V<rsub|1,f><around*|(|x<rsub|1>|)>-\<eta\>L<rsub|f><around*|(|\<cal-D\><rsup|k-1>|)>|)>
    </equation*>

    Execute <math|\<pi\><rsub|exp><around*|(|f<rsup|k>|)>> to collect data.

    \;
  </hidden>|<\hidden>
    <tit|Regret Analysis for MEX>

    <\align>
      <tformat|<table|<row|<cell|Reg<around*|(|K|)>=>|<cell|<big|sum><rsub|k=1><rsup|K>V<rsup|*<lprime|\<asterisk\>>>-V<rsup|\<pi\><rsub|f<rsup|k>>>>>|<row|<cell|=>|<cell|<with|color|red|<big|sum><rsub|k=1><rsup|K>V<rsup|*<lprime|\<asterisk\>>>-V<rsub|f<rsup|k>>>+<wide*|<with|color|blue|<big|sum><rsub|k=1><rsup|K>V<rsub|f<rsup|k>>-V<rsup|\<pi\><rsub|f<rsup|k>>>>|\<wide-underbrace\>><rsub|GEC>>>>>
    </align>

    <\align>
      <tformat|<table|<row|<cell|<with|color|red|<big|sum><rsub|k=1><rsup|K>V<rsup|*<lprime|\<asterisk\>>>-V<rsub|f<rsup|k>>>=>|<cell|<big|sum><rsub|k=1><rsup|K>V<rsub|f<rsup|\<ast\>>>-V<rsub|f<rsup|k>>>>|<row|<cell|\<leq\>>|<cell|\<eta\><big|sum><rsub|k=1><rsup|K>L<rsub|f<rsup|\<ast\>>><around*|(|\<cal-D\><rsup|k-1>|)>-L<rsub|f<rsup|k>><around*|(|\<cal-D\><rsup|k-1>|)>>>|<row|<cell|\<leq\>>|<cell|-\<eta\>d<big|sum><rsub|h=1><rsup|H><big|sum><rsub|k=1><rsup|K><around*|(|<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<pi\><rsub|exp><around*|(|f<rsup|s>,h|)>>\<ell\><rsub|f<rsup|s>><around*|(|f<rsup|k>,\<xi\><rsub|h>|)>|)>+\<cdots\>>>>>
    </align>
  </hidden>|<\hidden>
    <tit|Regret Analysis for GPS>

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><rsub|f<rsup|k>\<sim\>p<rsup|k>><around*|(|Reg<around*|(|K|)>|)>=>|<cell|\<bbb-E\><around*|(|<big|sum><rsub|k=1><rsup|K>V<rsup|*<lprime|\<asterisk\>>>-V<rsup|\<pi\><rsub|f<rsup|k>>>|)>>>|<row|<cell|=>|<cell|\<bbb-E\><around*|[|<with|color|red|<big|sum><rsub|k=1><rsup|K>V<rsup|*<lprime|\<asterisk\>>>-V<rsub|f<rsup|k>>>+<wide*|<with|color|blue|<big|sum><rsub|k=1><rsup|K>V<rsub|f<rsup|k>>-V<rsup|\<pi\><rsub|f<rsup|k>>>>|\<wide-underbrace\>><rsub|GEC>|]>>>>>
    </align>

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|<with|color|red|<big|sum><rsub|k=1><rsup|K>V<rsup|*<lprime|\<asterisk\>>>-V<rsub|f<rsup|k>>>|]>=>|<cell|\<bbb-E\><around*|[|<big|sum><rsub|k=1><rsup|K>V<rsub|f<rsup|\<ast\>>>-V<rsub|f<rsup|k>>|]>>>>>
    </align>

    <\lemma>
      <\equation*>
        \<bbb-E\><around*|[|V<rsub|f<rsup|\<ast\>>>-V<rsub|f<rsup|k>>|]>\<leq\>\<bbb-E\><around*|[|-\<eta\>d<big|sum><rsub|h=1><rsup|H><around*|(|<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<pi\><rsub|exp><around*|(|f<rsup|s>,h|)>>\<ell\><rsub|f<rsup|s>><around*|(|f<rsup|k>,\<xi\><rsub|h>|)>|)>|]>+\<cdots\>
      </equation*>
    </lemma>

    \;
  </hidden>>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|11>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|4:3>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|<with|mode|<quote|math>|\<bullet\>>|?>>
    <associate|auto-3|<tuple|<with|mode|<quote|math>|\<bullet\>>|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Episodic
      Interactive Decision Making Problem:
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<around*|(|\<cal-O\>,\<cal-A\>,H,\<bbb-P\>,R|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Example>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Optimism
      + Low GEC \<approx\> Sample Efficiency>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>