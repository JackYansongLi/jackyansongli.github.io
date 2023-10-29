<TeXmacs|2.1.2>

<style|generic>

<\body>
  <\hide-preamble>
    \;

    <assign|algo-while|<\macro|cond|block>
      <numbered-line|><render-while> <arg|cond> <render-do><no-page-break>

      <\indent>
        <arg|block>
      </indent>

      <numbered-line|><render-end-while><right-flush>
    </macro>>
  </hide-preamble>

  <\algorithm>
    <\algo-require>
      \;
    </algo-require>

    <\algo-ensure>
      \;
    </algo-ensure>

    <\numbered>
      \;

      <inactive|<algo-if-else-if|<math|N\<leq\>0>|<algo-state|a=b>>>

      \ 

      <\algo-if-else-if|<math|N> is even>
        <algo-state|<math|X\<leftarrow\>X\<times\>X>>

        <algo-state|<math|N\<leftarrow\><frac|N|2>> <algo-comment|This is a
        comment>>
      </algo-if-else-if>

      \;

      \;
    </numbered>
  </algorithm>

  <\algorithm>
    <\numbered>
      <\algo-while|dds>
        <\indent>
          ddad
        </indent>
      </algo-while>

      \;

      \;

      \;
    </numbered>
  </algorithm>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>