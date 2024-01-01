<TeXmacs|2.1.2>

<style|generic>

<\body>
  <doc-data|<doc-title|Memory Leak and Stackoverflow>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>>>>

  <\big-table>
    <with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|1par|0.6par>|gr-grid|<tuple|cartesian|<point|0|0>|2>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|cartesian|<point|0|0>|1>|gr-fill-color|black|<graphics||<line|<point|-2|3.7>|<point|-2.0|-3.0>|<point|2.0|-3.0>|<point|2.0|3.7>|<point|-2.0|3.7>|<point|-2.0|2.6>|<point|2.0|2.6>|<point|2.0|1.5>|<point|-2.0|1.5>>|<with|fill-color|black|<point|0|1>>|<with|fill-color|black|<point|0|1>>|<with|fill-color|black|<point|0.0|0.6>>|<with|fill-color|black|<point|0|0.6>>|<with|fill-color|black|<point|0|0.6>>|<with|fill-color|black|<point|0|0>>|<with|fill-color|black|<point|0|-0.4>>|<with|fill-color|black|<point|0|0.6>>|<with|fill-color|black|<point|0|-1>>|<with|fill-color|black|<line|<point|-2|-1.7>|<point|2.0|-1.7>>>|<text-at|Heap|<point|-0.3999999999999998|-2.5>>|<text-at|Stack|<point|-0.3999999999999998|3.0>>>>
  </big-table|>

  Stack is allocated automatically for local variables and function calls (it
  can be re-allocated). Heap is dynamically allocated using
  <math|<with|font-family|tt|malloc>> function (it cannot be re-allocated
  without free).

  <subsection|Memory Leak>

  Inside a function, if you forget to free the memory dynamically allocated
  by <math|<with|font-family|tt|malloc>>, then, after quiting the function,
  the memory you just allocated can not be used anymore (Recall that the new
  defined local variable are stored in stack, not heap).

  <subsection|Stackoverflow>

  Too many function calls or too many local variables will cause
  stackoverflow (not enough memory in stack).
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../../../.Xmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-2|<tuple|1|1|../../../../.Xmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-3|<tuple|2|1|../../../../.Xmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||>|<pageref|auto-1>>
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|1<space|2spc>Memory Leak
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|2<space|2spc>Stackoverflow
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>