<TeXmacs|2.1.1>

<style|generic>

<\body>
  <doc-data|<doc-title|arch2vec Questions>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<author-email|<href|yli340@uic.edu>>>>>

  <section|Questions>

  <\enumerate>
    <item>What is the difference between supervised and unsupervised NAS?

    <item>The authors study this method restricted to cell or block based
    architectures as nodes of the graph. Is it possible to discover new
    cell-based architectures using this approach? The cell components itself
    would be nodes and the connections of this graph.

    <item>From Observation (5)/Figure 5, how can we conclude that the
    adjacent architectures of arch2vec change smoothly and embrace similar
    connections and operations?

    <\itemize>
      <item>What are some of the key benefits and limitations of using
      unsupervised architecture representation learning in conjunction with
      neural architecture search, and how do these factors affect the overall
      performance of the system?

      <item>How does the approach to unsupervised architecture representation
      learning presented in the paper compare to other existing methods, and
      what are some potential avenues for future research in this area?
    </itemize>

    <item>Why Graph Isomorphism Networks instead of Graph Convolutional
    Networks are used in autoencoders?

    <item>Could you please give an in-depth explanation of the Validity
    metric mentioned in section 4.1? What do they mean by a random sample
    from the prior distribution generating a "valid" architecture?

    <item>In section 3.1.2 the authors mention that they convert the original
    adjacency matrix A (DAG) to an undirected graph.

    <\itemize>
      <item>Does this mean that the NAS procedure returns an undirected
      graph? If so, then how is a DAG picked, because there can be several
      ways to convert an undirected graph to a DAG?

      <item>In section 3.1.3, is the reconstructed graph a DAG, or an
      undirected one? I believe that all DAG's with the same underlying
      undirected graph will get the same representation by the encoder, so
      either the decoder has to return the undirected graph, or should make a
      choice in picking one of the many possible DAG's for an undirected
      graph.
    </itemize>
  </enumerate>

  \;
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|<with|mode|<quote|math>|\<bullet\>>|?>>
    <associate|bib-kumar_rma_2021|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Questions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>