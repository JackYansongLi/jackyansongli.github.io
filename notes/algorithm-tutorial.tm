<TeXmacs|2.1.1>

<style|<tuple|generic|centered-program>>

<\body>
  <\hide-preamble>
    \;

    <assign|algo-require|<macro|body|<surround|<with|font-series|bold|Input:>
    ||<arg|body>>>>

    <assign|algo-ensure|<macro|body|<surround|<with|font-series|bold|Output:>
    ||<arg|body>>>>
  </hide-preamble>

  \ 

  <\named-algorithm|An algorithm with caption>
    <algo-require|<math|n\<geq\>0>>

    <algo-ensure|<math|y=x<rsup|n>>>

    <with|numbered-color|dark blue|<\numbered>
      <algo-state|<\math>
        y\<leftarrow\>1
      </math>>

      <algo-state|<math|N\<leftarrow\>n>>

      <\algo-state>
        <\algo-while|<math|N\<neq\>0>>
          <\algo-if-else-if|<math|N> is even>
            <algo-state|<math|X\<leftarrow\>X\<times\>X>>

            <algo-state|<math|N\<leftarrow\><frac|N|2>> <algo-comment|This is
            a comment>>
          <|algo-if-else-if|<math|N> is odd>
            <algo-state|<math|y\<leftarrow\>y\<times\>X>>

            <algo-state|<math|N\<leftarrow\>N-1>>
          </algo-if-else-if>
        </algo-while>
      </algo-state>
    </numbered>>
  </named-algorithm>

  \;

  <\algorithm>
    <\algo-if-else-if|<math|N> is even>
      <algo-state|<math|X\<leftarrow\>X\<times\>X>>

      <algo-state|<math|N\<leftarrow\><frac|N|2>> <algo-comment|This is a
      comment>>
    <|algo-if-else-if|<math|N> is odd>
      <algo-state|<math|y\<leftarrow\>y\<times\>X>>

      <algo-state|<math|N\<leftarrow\>N-1>>
    </algo-if-else-if>
  </algorithm>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>