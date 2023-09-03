<TeXmacs|2.1>

<style|generic>

<\body>
  <doc-data|<doc-title|[Leslie 2005]>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>>>>

  First note that two ODEs are used in the proof of [Leslie 2005], one
  related to the dynamics of the <math|Q> value, <math|Q>-ODE, another
  related to the dynamics of the policy <math|\<pi\>>, <math|\<pi\>>-ODE. The
  proof can be summarized by the following procedure:

  <\enumerate>
    <item>Lemma 3.1 shows that the <math|Q> value will converge a.s. to a
    connected internally chain-recurrent set of the flow defined by the
    <math|Q>-ODE, we denoted it as <math|\<cal-Q\>>. In plain words, the
    <math|Q> value converges to an invariant set that contains
    <math|Q<rsup|\<star\>>> (By page 21 of [Benaim 1999<name|>]). So, we need
    to make this set be smaller in the following steps.

    <item>(Only holds for 2-player game): Lemma 4.1 proved that
    <math|\<cal-Q\>> can only have the form

    <\equation*>
      \<cal-Q\>=r<around*|(|\<cal-C\>|)>\<triangleq\><around*|{|<around*|(|r<rsup|1><around*|(|\<cdot\>,\<pi\><rsup|-1>|)>,\<ldots\>,r<rsup|N><around*|(|\<cdot\>,\<pi\><rsup|-N>|)>|)>:\<pi\>\<in\>\<cal-C\>|}>
    </equation*>

    where <math|\<cal-C\>> is a connected internally chain-recurrent set of
    the flow defined by the <math|\<pi\>>-ODE.

    <item>[Hofbauer and Hopkins 2005] provides a Lyapunov function for the
    <math|\<pi\>>-ODE dynamics of 2-player zero-sum and partnership game.
    Based on this Lyapunov function [Benaim 1999, Corollary 6.6] shows that
    the <math|\<pi\>> will converge to the equilibrium of the
    <math|\<pi\>>-ODE, which implies <math|\<cal-C\>> is of the form

    <\equation*>
      \<cal-C\>=<around*|{|<wide|\<pi\>|~>|}>,
    </equation*>

    where <math|<wide|\<pi\>|~>\<in\>\<Delta\>> is a Nash distribution. Based
    on Lemma 4.1,\ 

    <\equation*>
      \<cal-Q\>=r<around*|(|\<cal-C\>|)>\<triangleq\><around*|{|<around*|(|r<rsup|1><around*|(|\<cdot\>,<wide|\<pi\>|~><rsup|-1>|)>,\<ldots\>,r<rsup|N><around*|(|\<cdot\>,<wide|\<pi\>|~><rsup|-N>|)>|)>|}>=<around*|{|Q<rsup|\<star\>>|}>.
    </equation*>
  </enumerate>

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>