file:: [Mirsky et al. - 2022 - A Survey of Ad Hoc Teamwork Research.pdf](file:///Users/yansongli/zotero/storage/9YM8QPDM/Mirsky et al. - 2022 - A Survey of Ad Hoc Teamwork Research.pdf)
file-path:: file:///Users/yansongli/zotero/storage/9YM8QPDM/Mirsky et al. - 2022 - A Survey of Ad Hoc Teamwork Research.pdf

- Input. The inputs of the AHT problem are the teamwork task to be executed, domain knowledge comprising a description of the domain/environment in which the task is to be executed, a (possibly incomplete) list of attributes characterizing each agent (e.g., a set of goals, perception, and action capabilities), a description of the learner’s abilities, and a list of teammates. The agent attributes’ values might differ between each teammate—also see first assumption below—and some teammates might be able to communicate with each other.
  ls-type:: annotation
  hl-page:: 2
  hl-color:: yellow
  id:: 644d94ff-effc-425d-8f85-b103583bd564
- The output of the problem is the learner, represented by a policy that determines the action this agent should execute in any given state of the domain. Depending on the agent’s sensors, actuators, and the available communication channels, this policy can be deterministic or stochastic, static or adaptable, and might include ontic (physical) actions and epistemic (knowledge-producing) actions, which in turn may contain verbal or non-verbal communication.
  ls-type:: annotation
  hl-page:: 3
  hl-color:: yellow
  id:: 644d968a-687e-4e56-9fe5-37ff63c19346
- The learner requires a representation of the domain knowledge. This includes knowledge about the environment (e.g., discrete or continuous, static or dynamic, etc.), its capabilities, and knowledge about potential teammates(e.g., similarity to past teammates, their theory of mind, etc.).
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 644d99de-4c29-45ef-aaa0-5da3c96c42bd
- model the information pertaining to teammates’ behavior (e.g., classifying teammates by type in order to adapt to different teammates).
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 644d9a1f-c398-4081-b971-96376d29e3b8
- the design of mechanisms used by the learner to select actions once it has an estimate of its teammates’ behavior (observed or based on models of teammates)
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 644d9a63-ff29-4b7a-9f27-b068b3d2646b
- During interaction, the learner might receive new information about its teammates, the environment, or task objectives. Based on this information, the learner needs to adapt its behavior to improve coordination. This adaptation also includes merging the models provided by teammates.
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 644d9a8d-3554-4e3a-9558-c9980d3e5b5a
- An example of such a setup is flocking, where the teammates have a fixed policy, but their actions are directly influenced by the learner[30].
  ls-type:: annotation
  hl-page:: 5
  hl-color:: yellow
  id:: 644d9f72-bab2-4231-ac60-9108be52a305
- Zero-shot coordination (ZSC). A special case of AHT where teammates’ behavior are assumed to arise from a reward function that always provides identical rewards for every agent is known as ZSC [18, 19, 36, 42]. 
  ls-type:: annotation
  hl-page:: 6
  hl-color:: yellow
  id:: 644ed11d-b116-490d-9b98-19a62542df73
- Type-based methods. The use of type-based methods is common in the AHT literature. These methods represent prior experience with agents (in the target domain) by a set of hypothesized types, where each type models an action selection policy. It is assumed that new teammates encountered by the learner have behaviors specified by one of these types.
  ls-type:: annotation
  hl-page:: 7
  hl-color:: yellow
  id:: 644ed76c-515a-40f2-93a0-edcff4c18f6c
- More recently, latent type methods have been used which learn a neural network-based encoder to map observations of teammates to an embedding of the agent’s type [52, 53, 69, 71]
  ls-type:: annotation
  hl-page:: 7
  hl-color:: yellow
  id:: 644ed77b-0428-4140-84f9-8ac86687b037
- Experience replay. Rather than encoding experience in explicit behavioural models, experience replay methods store transition data in a buffer. Transitions observed during an interaction are compared against the stored transitions to identify the current teammate [24].
  ls-type:: annotation
  hl-page:: 7
  hl-color:: yellow
  id:: 644ed877-3288-4265-b810-313e5951a2e8
- Task recognition. In methods based on task recognition, prior experience or information provided by an expert is encoded as a library of tasks referred to as plays, macro actions, or options [65]. Tasks then encode prior experience as applicability conditions, termination conditions, and high-level specifications of a sequence of low-level actions [67].
  ls-type:: annotation
  hl-page:: 7
  hl-color:: yellow
  id:: 644ed88a-52d1-4fea-991e-b56ce37a625b
- However, if it is assumed that teammates’ types change over time, the learner must also adapt. The ConvCPD method[55] considers settings in which the type space is known, but agents can switch types. For these settings, they employ a convolutional neural network (CNN)-based changepoint detection approach, which uses image-like representations of type likelihoods across time to detect changes. 
  ls-type:: annotation
  hl-page:: 9
  hl-color:: yellow
  id:: 644ee727-9dfb-44e2-bf2e-973c47d026ae
- Approaches exist for adapting to agents whose behavior may not be adequately represented in the hypothesized space. TwoStageTransfer is a transfer learning method employed by PLASTIC-Model [15] which uses observations of new teammates and prior models to finetune a model for the new teammate.
  ls-type:: annotation
  hl-page:: 9
  hl-color:: yellow
  id:: 644ee7b0-cb3e-4123-aa67-1eca687cb6e7
- The ZSC problem does not allow the learner any behavioral adaptation during ad hoc interactions. For this reason, the focus of these methods is on training agents which robustly coordinate with other agents trained using the same algorithm. 
  ls-type:: annotation
  hl-page:: 10
  hl-color:: yellow
  id:: 644ee802-dc3b-4994-93bd-df397bd084ca
- Current approaches to AHT are not designed to work with adaptive teammates (one notable exception being HBA [8]), whose presence would mean that the learner needs not only to adapt to teammates’ behaviors, but also consider how the teammates adapt to its own behavior.
  ls-type:: annotation
  hl-page:: 13
  hl-color:: red
  id:: 644ee8cc-4e76-41fd-812d-f540921e69a6