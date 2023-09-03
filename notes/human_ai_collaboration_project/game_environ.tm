<TeXmacs|2.1.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Game Environment>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|Set of Best Response>

  Through this note, we denote <math|\<pi\><rsup|k>> as the guesses policy of
  player <math|2> in episode <math|k> and <math|\<pi\><rsup|\<ast\>>> as the
  true policy of player <math|2>. For each player <math|2>'s policy
  <math|\<pi\>>, the set of all best response policies is denoted as
  <math|BR<around*|(|\<pi\>|)>>. The hypothesis set of all possible policies
  of player <math|2> is denoted as <math|\<cal-H\>>.

  <\def>
    <label|def:same-type>We call two policies <math|\<pi\>> and
    <math|\<pi\><rprime|'>> to be of the same <with|font-shape|italic|type>
    if\ 

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<mu\>,\<pi\><rprime|'>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\><rprime|'>|)>
    </equation*>

    for all <math|\<mu\>\<in\>BR<around*|(|\<pi\>|)>> and
    <math|\<mu\><rprime|'>\<in\>BR<around*|(|\<pi\><rprime|'>|)>>. Given a
    hypothesis set <math|\<cal-H\>>, for every <math|\<pi\>>,
    <math|\<pi\><rprime|'>\<in\>\<cal-H\>> that are in the same type, we
    eliminate <math|\<pi\>> or <math|\<pi\><rprime|'>>. The reduced
    hypothesis set is denoted as <math|\<cal-H\><rsub|type>>.
  </def>

  <subsection|Requirement of the Game Environment>

  <\enumerate>
    <item><math|<around*|\||\<cal-H\><rsub|type>|\|>> must be large.\ 

    <item><math|<around*|\||BR<around*|(|\<pi\>|)>|\|>\<gtr\>1>, for all
    <math|\<pi\>\<in\>\<cal-H\>>.
  </enumerate>

  <section|Sequential Task >

  <\equation*>
    \<cal-H\><rsup|1>\<rightarrow\>\<cal-H\><rsup|2>\<rightarrow\>\<cal-H\><rsup|3>\<rightarrow\>\<cdots\>\<rightarrow\>\<cal-H\><rsup|n>
  </equation*>

  <\equation*>
    \<cal-H\><rsup|1><rsub|type>\<rightarrow\>\<cal-H\><rsup|2><rsub|type>\<rightarrow\>\<cal-H\><rsup|3><rsub|type>\<rightarrow\>\<cdots\>\<rightarrow\>\<cal-H\><rsup|n><rsub|type>
  </equation*>

  <\equation*>
    <around*|\||\<cal-H\>|\|>=<big|prod><rsub|t=1><rsup|n><around*|\||\<cal-H\><rsup|t>|\|>
  </equation*>

  <\conjecture>
    \;

    <\equation*>
      <around*|\||\<cal-H\><rsub|type>|\|>=?
    </equation*>
  </conjecture>

  <\proof>
    \;

    <\equation*>
      <around*|\||\<cal-H\><rsub|type>|\|>=<big|prod><rsub|t=1><rsup|n><around*|\||\<cal-H\><rsup|t><rsub|type>|\|>
    </equation*>

    \;
  </proof>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|?>>
    <associate|auto-3|<tuple|2|?>>
    <associate|def:same-type|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Set
      of Best Response> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>