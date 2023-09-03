- ## Planning
	- Many AHT approaches use planning methods to select actions. Some, such as Bowling and McCracken [16] and Ravula et al. [55], use bespoke planning methods suited to the specific task, and chosen by a human expert.
	- TODO [55] [[@Ad Hoc Teamwork With Behavior Switching Agents]]
	  :LOGBOOK:
	  CLOCK: [2023-04-30 Sun 16:22:03]--[2023-04-30 Sun 16:22:03] =>  00:00:00
	  :END:
	- Many approaches use the more general Monte Carlo tree search (MCTS) planning procedure [4, 10, 14, 28, 44, 60, 68, 70]. The upper confidence tree (UCT) algorithm [38] for MCTS is often used due to its ability to perform well when the branching factor is large, as is the case when multiple agents are present. These MCTS-based methods require that types are represented by explicit behavioral models to sample teammate actions during rollouts.
- ## Expert Policy Methods
	- One of the advantages of expert policy methods over type-based planning methods is that they can handle large or continuous state and action spaces, where MCTS approaches may struggle [15]. However, type-based planning methods are more appropriate when the ad hoc team is likely to have a previously unseen com- position, as type-based methods can reason at the level of the types of individual agents. Also, creating expert policies may be impossible when a large variation of situations are encountered. The E-HBA method attempts to achieve the advantages of both type- based reasoning methods and expert policy methods by combining the two [7]. The GPL method [53], suitable in open AHT problems, uses an action-selection mechanism based on E-HBA .
	  id:: 644ee3e7-4991-4bfd-960f-f853a10f9b5f
	- TODO [7] [[@E-HBA: Using Action Policies for Expert Advice and Agent Typification]]
		- TODO [[@Individual Q-Learning in Normal Form Games]]
- ## Leading
- ## Metalearning