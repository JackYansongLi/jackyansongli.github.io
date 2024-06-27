<TeXmacs|2.1.2>

<style|<tuple|generic|no-page-numbers|reduced-margins|python>>

<\body>
  <doc-data|<doc-title|ML Theory Week 1>|<doc-author|<author-data|<author-name|Jack
  Yansong Li>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>|<author-email|yli340@uic.edu>>>>

  <section|A tutorial on PyTorch>

  <\session|python|conda_hands_on_RL>
    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      import torch
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      import torch.nn as nn
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      import torch.optim as optim
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      \;
    </input>
  </session>

  The goal is to approximate the <with|font-family|tt|XOR> gate defined as
  follows:

  <\session|python|conda_hands_on_RL>
    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      def xor(a,b):

      \ \ \ \ return a ^ b
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      inputs = [(0, 0), (0, 1), (1, 0), (1, 1)]

      outputs = [xor(x[0], x[1]) for x in inputs]
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      \;
    </input>
  </session>

  The <with|font-family|tt|XOR> gate is approximated by a single layer neural
  net defined as:

  <\session|python|conda_hands_on_RL>
    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      class XORNet(nn.Module):

      \ \ \ \ def __init__(self):

      \ \ \ \ \ \ \ \ super(XORNet, self).__init__()

      \ \ \ \ \ \ \ \ self.layer1 = nn.Linear(2,4)

      \ \ \ \ \ \ \ \ self.layer2 = nn.Linear(4,1)

      \ \ \ \ def forward(self, x):

      \ \ \ \ \ \ \ \ x = torch.relu(self.layer1(x))

      \ \ \ \ \ \ \ \ x = self.layer2(x)

      \ \ \ \ \ \ \ \ return x
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      model = XORNet()
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      # Define the loss function and optimizer

      loss_func = nn.MSELoss() \ # Mean Squared Error Loss

      optimizer = optim.SGD(model.parameters(), lr=0.01) \ # Stochastic
      Gradient Descent
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      def weights_init(model):

      \ \ \ \ for m in model.modules():

      \ \ \ \ \ \ \ \ if isinstance(m, nn.Linear):

      \ \ \ \ \ \ \ \ \ \ \ \ # initialize the weight tensor, here we use a
      normal distribution

      \ \ \ \ \ \ \ \ \ \ \ \ m.weight.data.normal_(0, 1)

      \;

      weights_init(model)
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      \;
    </input>
  </session>

  Convert inputs and outputs data to torch tensors for training

  <\session|python|conda_hands_on_RL>
    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      X = torch.tensor(inputs, dtype=torch.float32)
    </input>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      Y = torch.tensor([y for y in outputs], dtype=torch.float32).view(-1,1)

      print("Inputs:", X)

      print("Outputs:", Y)

      #print(model(X))
    <|unfolded-io>
      Inputs: tensor([[0., 0.],

      \ \ \ \ \ \ \ \ [0., 1.],

      \ \ \ \ \ \ \ \ [1., 0.],

      \ \ \ \ \ \ \ \ [1., 1.]])

      Outputs: tensor([[0.],

      \ \ \ \ \ \ \ \ [1.],

      \ \ \ \ \ \ \ \ [1.],

      \ \ \ \ \ \ \ \ [0.]])
    </unfolded-io>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      epochs = 2000 \ # Increased epochs

      for epoch in range(epochs):

      \ \ \ \ Y_pred = model(X)

      \ \ \ \ loss = loss_func(Y_pred, Y)

      \ \ \ \ if epoch % 500 == 0:

      \ \ \ \ \ \ \ \ print(f'Epoch {epoch} Loss: {loss.item()}')

      \;

      \ \ \ \ optimizer.zero_grad()

      \ \ \ \ loss.backward()

      \ \ \ \ optimizer.step()
    <|unfolded-io>
      Epoch 0 Loss: 3.7070677280426025

      Epoch 500 Loss: 0.014563385397195816

      Epoch 1000 Loss: 0.001690817647613585

      Epoch 1500 Loss: 0.00018612013082019985
    </unfolded-io>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      # Test the model

      with torch.no_grad():

      \ \ \ \ test_pred = model(X)

      \ \ \ \ print("Predicted outputs:")

      \ \ \ \ print(test_pred.round())
    <|unfolded-io>
      Predicted outputs:

      tensor([[0.],

      \ \ \ \ \ \ \ \ [1.],

      \ \ \ \ \ \ \ \ [1.],

      \ \ \ \ \ \ \ \ [0.]])
    </unfolded-io>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      \;
    </input>
  </session>

  However, if we only use a single layer network defined below, it cannot
  approximate the <with|font-family|tt|XOR> gate:

  <\session|python|conda_hands_on_RL>
    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      class XORNetSingleLayer(nn.Module):

      \ \ \ \ def __init__(self):

      \ \ \ \ \ \ \ \ super(XORNetSingleLayer, self).__init__()

      \ \ \ \ \ \ \ \ self.layer1 = nn.Linear(2,1)

      \ \ \ \ def forward(self, x):

      \ \ \ \ \ \ \ \ x = torch.relu(self.layer1(x))

      \ \ \ \ \ \ \ \ return x
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      model_single_layer = XORNetSingleLayer()
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      # Define the loss function and optimizer

      loss_func = nn.MSELoss() \ # Mean Squared Error Loss

      optimizer = optim.SGD(model.parameters(), lr=0.01) \ # Stochastic
      Gradient Descent
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      weights_init(model)
    </input>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      epochs = 2000 \ # Increased epochs

      for epoch in range(epochs):

      \ \ \ \ Y_pred = model_single_layer(X)

      \ \ \ \ loss = loss_func(Y_pred, Y)

      \ \ \ \ if epoch % 500 == 0:

      \ \ \ \ \ \ \ \ print(f'Epoch {epoch} Loss: {loss.item()}')

      \;

      \ \ \ \ optimizer.zero_grad()

      \ \ \ \ loss.backward()

      \ \ \ \ optimizer.step()
    <|unfolded-io>
      Epoch 0 Loss: 0.2725851237773895

      Epoch 500 Loss: 0.2725851237773895

      Epoch 1000 Loss: 0.2725851237773895

      Epoch 1500 Loss: 0.2725851237773895
    </unfolded-io>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      # Test the model

      with torch.no_grad():

      \ \ \ \ test_pred = model_single_layer(X)

      \ \ \ \ print("Predicted outputs:")

      \ \ \ \ print(test_pred.round())
    <|unfolded-io>
      Predicted outputs:

      tensor([[0.],

      \ \ \ \ \ \ \ \ [0.],

      \ \ \ \ \ \ \ \ [1.],

      \ \ \ \ \ \ \ \ [0.]])
    </unfolded-io>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      \;
    </input>
  </session>

  <section|Homework>

  <\problem>
    Formally state and prove that a single layer neural network (also known
    as perceptron) cannot approximate the <with|font-family|tt|XOR> gate.
    Verify your result empirically. <em|Hint: derive a lower bound of the
    approximation error. Verify your bound by drawing the approximation error
    w.r.t. number of iterations.>
  </problem>

  <\problem>
    Formally state and prove that a two-layer neural network with more than
    <math|2> neurons in the hidden layer can approximate the
    <with|font-family|tt|XOR> gate. <em|Hint: Manually construct a neural
    network that gives the same outputs as <with|font-family|tt|XOR> gate and
    computes its parameters by hand.>
  </problem>
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
    <associate|auto-2|<tuple|2|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>A
      tutorial on PyTorch> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Homework>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>