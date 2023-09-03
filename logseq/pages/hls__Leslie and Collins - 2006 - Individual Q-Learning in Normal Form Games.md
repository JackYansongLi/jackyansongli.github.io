file:: [Leslie and Collins - 2006 - Individual Q-Learning in Normal Form Games.pdf](file://C:/Users/Haggi/Zotero/storage/37W8LRRU/Leslie and Collins - 2006 - Individual Q-Learning in Normal Form Games.pdf)
file-path:: file://C:/Users/Haggi/Zotero/storage/37W8LRRU/Leslie and Collins - 2006 - Individual Q-Learning in Normal Form Games.pdf

- One of the best studied models of adaptation in iterated normal form games is fictitious play (Brown (1951), Fudenberg and Levine (1998)). However, this paradigm requires each player to know her own reward function, to observe the actions of all players, and to calculate expected rewards from this information. 
  ls-type:: annotation
  hl-page:: 1
  hl-color:: yellow
  id:: 63d1b04c-ca75-483c-a561-daa7d6f2c119
- Therefore we study models of adaptation under which agents simply respond to observations of the rewards they receive for playing actions, as in the simple and successful approach used by Sutton and Barto (1998) to solve the single-agent multiarmed bandit problem. Agents estimate the value of each action, and play a strategy that is a simple function of these estimates; we will call such agents value-based learners. 
  ls-type:: annotation
  hl-page:: 2
  hl-color:: yellow
  id:: 63d1b08d-16f5-4b85-be6e-6895c559c3a6
- Actor-critic learning is a more sophisticated framework that explicitly links rewards and strategies. In this model, agents maintain separate value functions and strategies and map the value function to strategy space in order to update the strategy. It has been used in several recent approaches to learning in games (Borkar(2001), Bowling and Veloso (2002), Leslie and Collins (2003)), but, in contrast with the value-based approach considered in this paper, the extra complication involved in separating the values and the strategies is unnecessary and overly sophisticated when applied in a single-agent setting.
  ls-type:: annotation
  hl-page:: 2
  hl-color:: yellow
  id:: 63d1b204-88aa-4a27-82d2-aaed43692df1
- It is appropriate to comment here on a recent result of Hart and Mas-Colell (2003) showing that no “uncoupled” adaptive dynamics can converge to equilibrium in all games. The dynamics we consider in this paper are certainly uncoupled, and indeed the dynamics resulting from any system where players do not observe opponent payoffs must necessarily be uncoupled. However, as we shall see later, convergence to Nash distribution may be a more attainable goal than convergence to Nash equilibrium (see section 2 for details).
  ls-type:: annotation
  hl-page:: 3
  hl-color:: yellow
  id:: 63d1b7a8-2886-46e7-a1a7-26bbb8ecd7e5
- In particular, we will show that value-based players cannot generally play at a Nash equilibrium, but if smooth best responses are used, equilibrium play becomes possible (although this will no longer be at the classical Nash equilibrium).
  ls-type:: annotation
  hl-page:: 3
  hl-color:: yellow
  id:: 63d1c5a1-0cf1-46e9-8c4a-453ede17d288
- for any joint action the reward given to each player is the same
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 63d1c6a8-be09-4308-9f8f-86f69ea1dc54
- [:span]
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 63d1ca2d-40cf-4762-999c-85548ea0df8c
  hl-type:: area
  hl-stamp:: 1674693163141
- [:span]
  ls-type:: annotation
  hl-page:: 5
  hl-color:: yellow
  id:: 63d1ccbe-0e67-4ddc-9dc5-054f8ae9cda1
  hl-type:: area
  hl-stamp:: 1674693821501
- Thus we have shown that a value-based approach cannot result in Nash equilibrium play in general games but can result in strategies that are close to a Nash equilibrium if players use smooth best responses
  ls-type:: annotation
  hl-page:: 5
  hl-color:: yellow
  id:: 63d1d513-716a-4319-bd6d-0a6c98f1bdeb
- The use of smooth best responses means that, in general, Nash equilibria are no longer fixed points in strategy space, and an alternative equilibrium concept must be defined. 
  ls-type:: annotation
  hl-page:: 5
  hl-color:: yellow
  id:: 63d1d825-9cf0-49a1-a8cc-55a376432949
- The interested reader may wish to consult Bena ̈ım and Hirsch (1999) for an introduction to the ODE method of stochastic approximation in the context of game theory. 
  ls-type:: annotation
  hl-page:: 6
  hl-color:: yellow
  id:: 63d1daee-41b6-4231-a1ab-b9f1c786fc8e
- Hofbauer and Hopkins(2005) provide Lyapunov functions for the set of Nash distributions under the SBR dynamics, and this set is isolated (by assumption in the case of partnership games and by a result of Hofbauer and Hopkins (2005) for zero-sum games). 
  ls-type:: annotation
  hl-page:: 9
  hl-color:: yellow
  id:: 63d2cae5-26a9-4669-b7de-88c1b3f96077
- convergence to a point can occur only at Nash distribution values.
  ls-type:: annotation
  hl-page:: 7
  hl-color:: yellow
  id:: 63d9d786-e832-4695-afab-57d337fd45e9
- This is a2-player zero-sum game, and therefore strategies converge to the unique Nash distribution where all actions are played with probability 1/3 (this is the same as the Nash equilibrium, although for general games the Nash equilibria and Nash distributions do not coincide). 
  ls-type:: annotation
  hl-page:: 9
  hl-color:: yellow
  id:: 63e428e4-df5c-4bff-a8b3-eddb4f979661