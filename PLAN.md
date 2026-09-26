# MPVRP-CC thesis writing plan

**Revision 4 — 26 September 2026 — CP research framing and first prose drafts**
**Companion bibliography:** `biblio.bib`

**Working title:** Solving the Multi-Product Vehicle Routing Problem with Changeover Costs with Constraint Programming and Sequence Variables

This guide specifies what to say, how to present it, and which sources to consult. It follows the agreed preference for simple section names, a short introduction, a shared problem definition, and the MILP model in the main text. Follow university rules for numbering: if the Introduction is unnumbered, renumber the subsequent chapters accordingly. Numbers below serve as stable references within this guide.

Citation keys refer to the companion `.bib` file; for example, use `\cite{cattaruzza2016multipletrips}` in LaTeX. Cite sources only for claims they support. Sentence examples below are original suggestions, not quotations. Planned analyses must not be described as completed experiments.

**Revised overall structure**

1. **Introduction** — Context and Motivation; Problem Statement; Objectives; Thesis Organization.
2. **Literature Review** — Relevant Routing Variants; Cleaning and Changeover Costs; Solution Methods; Research Gap.
3. **Theoretical Background** — Routing Problems; Optimization Methods; Constraint Programming.
4. **Methodology** — Problem Definition; MILP Model; Proposed Approach; Experimental Setup.
5. **Results and Discussion** — Method Comparison; Effect of Changeover Costs; Discussion and Limitations.
6. **Conclusion and Future Work**.
7. **References**.
8. **Appendices** — data formats, generator, checker, visualization, and supplementary model or experimental details.

The Literature Review explains what others studied. The Theoretical Background explains the concepts needed to understand this thesis. The Methodology explains your choices. The Results and Discussion presents and interprets your evidence. Avoid repeating the same explanation across these chapters.

**Research position — guidance for the thesis as a whole**

Existing routing studies consider cleaning and cargo transitions. Present MPVRP-CC as a precisely specified rich VRP, and establish its relationship to those studies. Naming the problem is not evidence of novelty. A claim that the combination of features has not previously been studied must follow a comparison of mathematical decisions, constraints, and objectives, including whether an existing general model contains yours as a special case.

CP is an established approach to routing. Motivate it through its suitability for your assignment and sequencing decisions, not a broad claim that few researchers use it. Your method constructs mini-trips and then uses CP to assign and order them. Optimality for the resulting restricted problem does not establish optimality for the original MPVRP-CC.

**Central question:** To what extent can constraint programming with sequence variables provide effective solutions to MPVRP-CC, and how does accounting for changeover costs influence route planning and total modeled operational cost?

**Research framing:** The initial aim is to investigate CP and sequence variables for this problem. Present mini-trip construction as a methodological choice developed during the research, explaining its rationale and restrictions in Methodology. It is not an initial research objective. Retain an accurate description of the complete implemented method and its limitations.

Use the same three specific research questions in the introduction and throughout the analysis:

| Question | Evidence | Location |
| --- | --- | --- |
| How can the operational constraints and changeover costs of MPVRP-CC be represented in a solution approach using CP and sequence variables? | Shared definition, MILP, construction, CP, and solution validation | Chapter 4 |
| How does the proposed approach compare with a MILP baseline in terms of feasible solutions found, solution cost, and computation time? | Valid solutions, objectives, runtime, bounds, and solver statuses | Section 5.1 |
| How do the resulting vehicle routes, product sequences, and total modeled costs differ when changeover costs are included in planning rather than ignored? | Controlled with/without-changeover comparisons using common cost accounting | Section 5.2 |

## 1. Introduction

**Purpose:** Allow reviewers to understand the motivation, question, approach, and document rapidly. Keep it short and accessible. Avoid equations, detailed notation, sequence-variable domains, propagation, and solver configuration. Do not give the introduction a separate subsection for every idea.

### 1.1 Context and Motivation

**What to say:** Introduce fleet route planning and repeated loading operations. Explain that carrying different products can require cleaning or preparation, and that these activities can make a short-distance plan expensive overall. Give one simple industrial illustration without presenting it as observed company data.

**How to say it:** Use two or three short paragraphs: operational setting → overlooked cost → reason to study it. Define VRP in ordinary language. Avoid conversational phrasing such as “you guessed it.” Discuss improved working conditions only as motivation unless the study measures working hours or workload.

**Sources:** `toth2014vehicle`, `wen2010rich`, `lahyani2015oilmulticompartment`, `TAMBURINI2025104019`. Select a few citations; do not turn this section into a review.

### 1.2 Problem Statement

**What to say:** Explain the difficulty of planning travel and product changes together. Acknowledge that related cleaning models exist. State the specific setting studied, name MPVRP-CC, and motivate the investigation of CP and sequence variables. Present construction as a later methodological choice, not the starting research aim. End with the central research question.

**How to say it:** Use a compact progression of three paragraphs: what is known and the remaining issue; what this thesis investigates; the research question. State the research gap in concrete terms established by Section 2.4. Avoid an unsupported “no author has clearly defined this problem” claim. Explain CP briefly as a way to express operational rules and search for feasible, low-cost plans. Do not promise global optimality for the complete hybrid approach.

**Sources:** Closest selected studies: `lahyani2015oilmulticompartment`, `TAMBURINI2025104019`, and others only as needed. Use `lahyani2015taxonomy` for rich-VRP positioning. Detailed comparisons belong in Chapter 2.

### 1.3 Objectives

**What to say:** State one overall objective: develop and assess an approach using CP and sequence variables while examining the effect of changeover costs. Follow with four specific objectives:

1. Define MPVRP-CC and formulate a MILP reference model.
2. Design and implement a solution approach using CP and sequence variables.
3. Evaluate the proposed approach against the MILP baseline on the synthetic instances.
4. Analyze how including changeover costs changes plans and modeled costs.

**How to say it:** Use action verbs and distinguish completed contributions from intended outcomes. Briefly state the synthetic-data scope and any central restriction. Do not add an open-source-library objective merely because it appeared in the example thesis; include software dissemination only if it is an actual contribution.

**Sources:** Your work needs internal evidence, not external authority. Attribute adopted sequence-variable concepts where appropriate using `delecluse2022sequence` and `delecluse2025sequence`.

### 1.4 Thesis Organization

**What to say:** Summarize the purpose of each remaining chapter.

**How to say it:** One short paragraph or several brief paragraphs. Explain the progression without repeating every subsection title. Match university numbering exactly. No external citation is normally required.

## 2. Literature Review

Open with a short paragraph describing the review scope and how sources were identified. Record actual search dates, terms, inclusion criteria, and reference tracing; do not call it a systematic review unless that procedure was followed. A search log can go in an appendix.

### 2.1 Relevant Routing Variants

**What to say:** Review multiple trips, multiple products, heterogeneous fleets, multiple depots, split deliveries, and rich VRPs as relevant to the actual specification. Explain how these features interact rather than listing every known variant.

**How to say it:** Organize by operational features. Compare assumptions and decisions across papers. Reserve elementary TSP/VRP explanations for Section 3.1. Distinguish supplying depots from home garages.

**Sources:** `cattaruzza2016multipletrips`, `lahyani2015taxonomy`, `wen2010rich`, `toth2014vehicle`.

### 2.2 Cleaning and Changeover Costs

**What to say:** Explain the relationship to sequence-dependent setups in scheduling, then compare the selected routing and production-routing studies.

| Study | Use in the argument | Distinction to preserve |
| --- | --- | --- |
| Lahyani et al. | Close product-dependent cleaning precedent | Compare collection, compartments, time structure, and cleaning rule with your specification |
| Tamburini et al. | Cargo succession and cleaning in ship routing | Its experiments use a fixed cleaning charge and cleanliness state; do not assume a general pairwise cost matrix |
| Chokanat et al. | Cleaning expenditure in repeated milk collection | Cleaning costs do not automatically establish dependence on the preceding and next product |
| Miranda et al. | Sequence-dependent setups integrated with routing | The setup occurs on the production line, not on a vehicle |
| Haase | Setup-cost foundations | This is lot-sizing research, not evidence of a routing gap |

**How to say it:** For each close study, state setting → decisions → setup trigger → cost/time treatment → relevant difference. End each group with a synthesis. Avoid disconnected paper summaries or treating all cleaning costs as identical mechanisms.

**Sources:** `lahyani2015oilmulticompartment`, `TAMBURINI2025104019`, `agriengineering1010006`, `MIRANDA2018211`, `haase1994setup`.

### 2.3 Solution Methods

Use three simple subsections if helpful: **Exact Methods**, **Heuristics and Hybrid Methods**, and **Constraint Programming for Routing**.

**What to say:** Compare the approaches used in the relevant literature. Explain the role of construction and improvement heuristics, decomposition, CP routing representations, and hybridization. Discuss circuit-based and sequence-based representations without suggesting that every reviewed constraint is used in your implementation.

**How to say it:** Describe what each method optimizes, what it fixes, and where it was evaluated. Sacramento et al. uses CP within a local-search framework; your architecture constructs mini-trips before CP assignment and ordering. The comparison is methodological, not proof that the algorithms are identical. Treat interval-based and insertion-based sequence representations distinctly.

**Sources:** `laporte2000heuristics`, `MIRANDA2018211`, `sacramento2020feeder`, `shaw1998constraint`, `vali2017mtsp`, `vismara2018circuit`, `delecluse2022sequence`, `delecluse2025sequence`. Use `lahyani2015unified` for its thesis-summary scope, not as a substitute for the full thesis.

### 2.4 Research Gap

**What to say:** Present a compact comparison matrix and identify the specific operational combination and methodological question addressed by MPVRP-CC. Suggested columns: routes optimized/given; repeated trips; products/compartments; stock constraints; split deliveries; product-history dependence; cost/time mechanism; solution method.

**How to say it:** Mark unverified features “not reported,” not “absent.” Check whether a previous model already includes yours as a special case. Explain why the distinction affects decisions. Acknowledge existing cleaning work and then identify your narrower contribution. A qualified absence claim must be supported by the reviewed evidence.

**Sources:** The papers actually compared. Neither your project website nor a new acronym provides independent evidence of novelty.

## 3. Theoretical Background

**Purpose:** Provide just enough theory to understand Chapter 4. Use a small running example where useful. Keep problem-specific rules and notation in Problem Definition.

### 3.1 Routing Problems

Suggested subsections: **Traveling Salesman Problem**, **Vehicle Routing Problem**, **Relevant VRP Variants**.

**What to say:** Define graphs, nodes, arcs, tours, routes, and costs. Explain the progression from one tour to a fleet and then repeated trips. Briefly explain multi-product and rich-routing features. Introduce sequence-dependent costs as a general idea, including the distinction between cost and duration.

**How to say it:** Use short definitions and one illustration. Explain what a trip means in the cited multi-trip literature and state your convention explicitly; do not silently equate every literature tour with your open mini-trip. Avoid a lengthy history of TSP.

**Sources:** `flood1956tsp`, `toth2014vehicle`, `cattaruzza2016multipletrips`, `lahyani2015taxonomy`, `haase1994setup` where needed. Flood's article is from 1956, not 1965.

### 3.2 Optimization Methods

Suggested subsections: **Mathematical Programming** and **Heuristics**.

**What to say:** Introduce decision variables, objectives, constraints, and MILP. Explain the difference between an exact formulation and a run that proves optimality. Introduce construction heuristics, improvement heuristics, and hybrid methods. Briefly explain best-fit packing, nearest neighbor, and 2-opt as used later.

**How to say it:** Give the principle of each method before its adaptation. Do not present API calls here. Explain that your internal ordering is an open path if that is how it is implemented. Do not claim heuristic guarantees without evidence.

**Sources:** `toth2014vehicle`, `laporte2000heuristics`; `sacramento2020feeder` for hybrid context. Add original algorithm references if making a detailed historical or theoretical claim beyond these surveys.

### 3.3 Constraint Programming

Suggested subsections: **Basic Concepts**, **Routing Models**, **Sequence Variables**.

**What to say:** Explain variables, domains, constraints, propagation, search, and optimization. Briefly introduce circuit/successor and other routing representations, then explain the insertion-based sequence variables used in your work: membership, ordering, possible insertions, and endpoints.

**How to say it:** Use one domain-reduction example and one partial sequence. Distinguish a constraint's meaning from the strength of its propagator. Avoid confusing insertion-based sequence variables with similarly named scheduling constructs. Keep detailed cost integration in Section 4.3.

**Sources:** `rossi2006handbook`, `vali2017mtsp`, `vismara2018circuit`, `delecluse2022sequence`, `delecluse2025sequence`. Use `maxicp` and `maxicpDocs` when discussing solver-specific behavior.

## 4. Methodology

### 4.1 Problem Definition

This is the single shared foundation for the MILP and hybrid approaches. Define the physical setting and mathematical representation once. It is not preprocessing exclusive to CP.

#### 4.1.1 Description

**What to say:** Describe the physical stations, depots, vehicles, products, home garages, and repeated loading/delivery operations. State inputs, decisions, feasible operations, and planning horizon.

**How to say it:** Begin in ordinary language, then connect the explanation to a small figure. Clarify whether vehicles carry one product at a time, unload a load completely before reloading, and can visit different loading depots.

#### 4.1.2 Notation

**What to say:** Define common sets and parameters, quantities, capacity, stock, physical locations, travel costs, initial product states, and the changeover matrix.

**How to say it:** Use one table, define each symbol before use, and keep units visible. Leave model-specific decision variables to the MILP or CP sections. Mathematical relationships should follow the implementation, not an illustrative slide if the two differ.

#### 4.1.3 Requests and Supply Nodes

Use the following shared terminology throughout:

| Term | Meaning |
| --- | --- |
| Station | Physical delivery location |
| Depot | Physical loading location |
| Request | A station–product pair with positive demand |
| Supply node | A depot–product pair with available stock |
| Delivery piece | A portion of a request created when splitting its demand |
| Mini-trip | A unit constructed by the hybrid method: one loading operation followed by deliveries of that product |

For station demand `q_sp` and depot stock `S_dp`, define request set `R = {(s,p) : q_sp > 0}` and supply-node set `U = {(d,p) : S_dp > 0}`. Choose notation compatible with the rest of the thesis.

**What to say:** Each request retains its station and product; each supply node retains its depot and product. Multiple logical nodes can share one physical location. Travel costs derive from the associated physical locations. A supply node represents a stock source, not a separate physical depot or a single-use visit. A request is not necessarily indivisible.

**How to say it:** Explain the pairs once, illustrate them briefly, and subsequently use “request” and “supply node.” Both MILP and CP use this representation. Introduce mini-trip construction only in Section 4.3.

#### 4.1.4 Assumptions and Constraints

**What to say:** List every original operational rule explicitly, before presenting either formulation. At minimum address:

1. **Demand satisfaction:** required quantities must be delivered to each request.
2. **Stock availability:** withdrawals cannot exceed the stock of a supply node.
3. **Vehicle capacity:** carried quantities cannot exceed vehicle capacity.
4. **Product consistency:** loading and deliveries must obey the product rules.
5. **Loading and delivery:** deliveries must be supported by permitted loading operations; state replenishment and residual-load rules.
6. **Route continuity:** each vehicle follows connected permitted operations.
7. **Departure and return:** vehicles obey the specified home-garage rules.
8. **Demand splitting:** specify whether and how a request can be split across vehicles or trips.
9. **Other actual restrictions:** include time, visit, or transition restrictions only when they belong to the intended problem.

**How to say it:** Separate assumptions about the operating environment from rules enforced on solutions. Explain any at-most-one-piece-per-request-per-vehicle rule explicitly: is it an original requirement or a restriction of the hybrid method? Do not quietly impose a heuristic restriction on the mathematical problem. Charging a changeover cost is an objective term, not itself a feasibility constraint unless transitions are prohibited.

#### 4.1.5 Objective Function

**What to say:** Define total travel plus changeover cost, including the initial product state, same-product transitions, and final cleaning if applicable. State whether other loading charges exist and whether costs can be asymmetric.

**How to say it:** Align units: convert distance into monetary travel cost or declare normalized synthetic cost units. Do not add kilometers directly to currency without explanation. Show one complete cost calculation on a small route. State assumptions such as a zero diagonal or triangle inequality only if actually used.

**Sources for 4.1:** Your problem specification and `mpvrpccProject` for provenance; cite specific predecessors for adopted assumptions. Your website is not independent novelty evidence.

### 4.2 MILP Model

Place the core formulation immediately after Problem Definition. Use **Decision Variables**, **Objective Function**, and **Constraints** as subsections.

**What to say:** Introduce MILP-specific variables and their domains. Present the objective using the common cost definitions. Group equations by operational purpose and connect each family to the constraints listed in Section 4.1.4. Explain how repeated loading, product-state transitions, splitting, stock, and route continuity are represented. Justify any finite visit/trip limits and big-M values.

**How to say it:** Reuse common sets and parameters instead of redefining the physical representation. Introduce equations with a sentence and explain what they enforce afterward. Keep the full core model in the main text; move lengthy bound derivations, strengthening inequalities, or technical details to an appendix. The MILP is a reference formulation, while the hybrid method remains the main algorithmic focus.

**Evidence:** Notation consistency, model-to-rule mapping, and independent validation of resulting solutions. Call individual MILP results optimal only when certified. Cite adapted formulations if any; use `gurobiDocs` for solver behavior, not as the source of your equations.

### 4.3 Proposed Approach

Suggested subsections: **Overview**, **Mini-Trip Construction**, **CP Model**, **Search Strategy**, **Implementation**.

#### Overview

**What to say:** Explain why the construction stage was introduced as the approach developed, using the actual reasoning and evidence without inventing earlier failed experiments. Then explain how the method starts from the shared requests and supply nodes, constructs delivery pieces and mini-trips, and then assigns/sequences mini-trips using CP. State which decisions construction fixes.

**How to say it:** Use a short diagram and a decision-allocation table. Explain the reduction in search space and the loss of flexibility together. Do not imply that requests and supply nodes are introduced only for CP.

#### Mini-Trip Construction

**What to say:** Describe request ordering, splitting, supply-node selection, stock updates, compatible packing, internal station ordering, tie-breaking, and failure handling. Define the output attributes: supply node, product, quantity, ordered deliveries, final station, internal travel, and originating requests.

**How to say it:** For each stage give inputs, outputs, rule, rationale, and guarantees. Present core pseudocode here. Reconcile splitting by vehicle capacities with packing using the minimum fleet capacity, especially oversized pieces. Distinguish construction failure from proof of original-problem infeasibility. Locally valid mini-trips can still be difficult or impossible to assign jointly.

#### CP Model

**What to say:** Define one sequence per vehicle, mini-trip membership, exactly-once assignment, capacity compatibility, and any split-request restriction. Explain which constraints were already enforced by construction. Define garage-to-trip, trip-to-trip, trip-to-garage, and unused-vehicle costs.

**How to say it:** Explain each constraint in words and equations. Every internal mini-trip cost must be counted once. With fixed mini-trips served once and vehicle-independent internal costs, their total is constant; sequencing changes connector travel and changeovers. Distinguish the transition-cost matrix you define for MPVRP-CC from the reused constraint that sums transition costs.

#### Search Strategy

**What to say:** Describe first-fail mini-trip selection, minimum-detour placement, insert/forbid branching, incumbent management, stopping conditions, and actual propagation.

**How to say it:** Separate feasibility enforcement, search ordering, and cost bounding. A cheap insertion is a search preference, not a global quality guarantee. The presentation describes exact cost evaluation when sequences are fixed; check the integrated implementation before making a final claim about propagation strength.

#### Implementation

**What to say:** Explain MaxiCP usage and the port/adaptation of `TransitionCost` from the earlier `minicp-sequences` repository. State what was reused and what was modified.

| Component | Attribution |
| --- | --- |
| Sequence-variable domain | Existing sequence-variable research |
| Original TransitionCost source | Earlier minicp-sequences implementation |
| Port or adaptation to the project's MaxiCP version | Your implementation work |
| Product/travel transition matrix for MPVRP-CC | Your problem-specific modeling |
| Additional propagation or search modifications | Describe individually, only if implemented |

**How to say it:** Write that the component was unavailable in the MaxiCP version used by this project, rather than claiming it is absent from every MaxiCP release. Do not describe the original constraint as your invention. Record the upstream commit, original file, your changes, and the project commit; preserve attribution and applicable license notices. Citation and code provenance are separate from algorithmic novelty.

**Source verification limit:** The GitHub file could not be retrieved through the available web reader during preparation. Its provenance is recorded from your account. Behavior must be verified from the code actually used, not inferred from the class name. The bibliography includes the supplied live URL without inventing a commit or publication year.

**Sources for 4.3:** `delecluse2022sequence`, `delecluse2025sequence`, `maxicp`, `maxicpDocs`, `minicpTransitionCost`; `laporte2000heuristics` for standard heuristic background. `sacramento2020feeder` and `MIRANDA2018211` are comparisons, not sources of your exact algorithm unless directly adapted.

### 4.4 Experimental Setup

Suggested subsections: **Instances**, **Environment and Validation**, **Experiments and Metrics**.

**Instances — what to say:** Document the 100 synthetic instances, configuration counts, distributions, spatial design, demand/stock generation, capacities, product states, cost matrices, seeds, feasibility checks, and rejection or repair rules. Explain the version difference from the project's earlier 50-instance description.

**Instances — how to say it:** Use parameter and dataset-composition tables. Describe selected operational features rather than asserting industrial realism without calibration. Aggregate stock adequacy alone does not guarantee feasibility. Disclose any construction used to plant feasible solutions.

**Environment and Validation — what to say:** Report hardware, languages, solver versions, code commits, thread counts, budgets, seeds, and checker rules. Check original-problem feasibility and independently recompute costs for both methods.

**Environment and Validation — how to say it:** Give reproducible configuration, not a software-development diary. Include construction in hybrid runtime. Screenshots help explain results but do not prove feasibility. Cite `maxicp`, `maxicpDocs`, `gurobiDocs`, and project artifacts as appropriate.

**Experiments and Metrics — what to say:** Define the method comparison and with/without-changeover comparison. Distinguish valid solution found, optimality certificate, no incumbent, timeout, construction failure, and proven infeasibility. Define denominators and zero handling for all percentages.

**Experiments and Metrics — how to say it:** Specify the protocol before presenting results. Use paired comparisons when both methods return valid solutions, and report unpaired cases separately. State whether randomization requires repeated runs. Distinguish differences to a MILP incumbent from optimality gaps. A reduced-CP bound is not automatically a bound for the original problem.

## 5. Results and Discussion

### 5.1 Method Comparison

**What to say:** First report coverage, validation, and statuses. Then compare solution quality, cost components, runtime, bounds, and behavior by instance size/configuration. Distinguish original-problem and reduced-problem optimality.

**How to say it:** Main observation → numbers → conditions → interpretation. The presentation reports hybrid availability on 100/100 and MILP on 82/100, with 59 versus 23 wins among paired cases. Verify these counts from logs before writing them as final results. Investigate the missing MILP cases rather than assuming infeasibility. A hybrid solution cannot beat a correctly certified optimum of an equivalent original-problem MILP.

**Evidence:** Outcome table, paired objective plot, cost-component comparison, and runtime plot if runtime data exist. For positive MILP incumbents, a signed difference may be defined as `100 * (z_H - z_M) / z_M`; negative means lower hybrid cost. This is not necessarily an optimality gap.

**Sources:** Your outputs support your findings. `gurobiDocs` supports interpretation of solver statuses; external method papers provide context, not proof of your numerical claims.

### 5.2 Effect of Changeover Costs

**What to say:** Generate plans with changeovers ignored and included in optimization. Evaluate both using the same full operational cost function. Compare travel, changeover expense, total cost, product switches, vehicle use, and changed sequences.

**How to say it:** Explain the controlled comparison first. Do not subtract a distance-only objective from a distance-plus-changeover objective. A longer route can have a lower total cost. With positive baseline full cost, savings can be defined as `100 * (C_full(plan_ignored) - C_full(plan_included)) / C_full(plan_ignored)`. Report negative savings and search limitations honestly.

If mini-trips are held fixed, the experiment isolates assignment/sequencing effects within that constructed set, not effects across every original routing decision. If this experiment has not been performed, complete it or narrow the claims; comparing CP and MILP alone does not answer the changeover-impact question.

**Optional additions:** Sensitivity to changeover magnitude and carefully controlled ablations, only if run. Show representative paired route diagrams with consistent scale and labels. Explain case selection and include a counterexample where useful. Examples explain mechanisms; aggregate data show how common they are.

**Sources:** Your experiments, with `lahyani2015oilmulticompartment` and `TAMBURINI2025104019` for contextual discussion.

### 5.3 Discussion and Limitations

**What to say:** Answer the research questions, interpret the trade-offs, and discuss fixed construction decisions, propagation behavior, synthetic validity, parameter ranges, computational budgets, and comparison fairness.

**How to say it:** Separate observation from explanation. Use “may be explained by” for a mechanism not isolated experimentally. Do not attribute all improvements to CP without an ablation. Restrict operational conclusions to the modeled cost components and tested settings. General claims about employee welfare, emissions, or industrial savings require corresponding measurements.

**Sources:** Revisit the closest cleaning papers and methodological references where comparisons are meaningful. Do not compare savings percentages across unrelated datasets as if they measure the same effect.

## 6. Conclusion and Future Work

Use two simple sections: **Conclusion** and **Future Work**.

**Conclusion — what to say:** Answer the central question, summarize the contributions, give a few decisive verified results, and state the main limitation affecting interpretation.

**Conclusion — how to say it:** Synthesize rather than repeat every chapter. Distinguish adopted methods, your adaptations, and your findings. Introduce no new experiments or unsupported novelty claims. If changeover effects remain untested, say so.

**Future Work — what to say:** Prioritize revisable or multiple mini-trip constructions, improvement neighborhoods, stronger cost propagation, calibrated data, and additional operational constraints where justified.

**Future Work — how to say it:** Link each proposal to an observed limitation and an evaluation plan. Do not claim that a proposed insertion-cost lower bound is valid for arbitrary cost matrices without proving it. Two or three concrete directions are enough.

**Sources:** Mostly internal cross-references; cite established approaches only when proposing a specific extension based on them.

## 7. References

Use one institutional citation style. Keep all existing citation keys stable. The companion bibliography now contains the selected papers plus foundational, software, and writing references, with section mappings in comments.

Important distinctions:

- `lahyani2015unified` is the published two-page thesis summary, not the full thesis.
- `wen2010rich` is a PhD thesis.
- `cattaruzza2016multipletrips` uses the original 2016 4OR version. If your reading copy is the corresponding 2018 Annals version, change the record consistently; do not count both as independent evidence.
- `flood1956tsp` uses the verified 1956 publication year.
- `vali2017mtsp` is a ModRef workshop paper; no unverified DOI or page range is supplied.
- `maxicp` records the author/year citation you supplied; `maxicpDocs` remains useful for documentation-specific claims. Neither substitutes for the exact solver commit used.
- `minicpTransitionCost` documents code provenance. Replace the moving branch URL with a verified commit permalink before submission.
- The 2025 sequence-variable item is recorded as the supplied arXiv preprint.
- Phrasebank and mathematical-writing references support writing practice, not routing claims; cite them in the submitted thesis only if appropriate.

### Reference map

| Section | Primary keys |
| --- | --- |
| 1.1–1.2 | `toth2014vehicle`, `wen2010rich`, `lahyani2015oilmulticompartment`, `TAMBURINI2025104019` |
| 2.1 | `cattaruzza2016multipletrips`, `lahyani2015taxonomy`, `wen2010rich` |
| 2.2 | `haase1994setup`, `lahyani2015oilmulticompartment`, `TAMBURINI2025104019`, `agriengineering1010006`, `MIRANDA2018211` |
| 2.3 | `laporte2000heuristics`, `sacramento2020feeder`, `lahyani2015unified`, `shaw1998constraint`, `vali2017mtsp`, `vismara2018circuit`, `delecluse2022sequence`, `delecluse2025sequence` |
| 2.4 | Papers actually compared in the feature matrix |
| 3.1 | `flood1956tsp`, `toth2014vehicle`, `cattaruzza2016multipletrips`, `lahyani2015taxonomy` |
| 3.2 | `toth2014vehicle`, `laporte2000heuristics` |
| 3.3 | `rossi2006handbook`, `vismara2018circuit`, `vali2017mtsp`, `delecluse2022sequence`, `delecluse2025sequence` |
| 4.1–4.2 | Own model; `mpvrpccProject` for provenance; any genuinely adapted model source |
| 4.3 | `delecluse2022sequence`, `delecluse2025sequence`, `maxicp`, `maxicpDocs`, `minicpTransitionCost` |
| 4.4 | `maxicp`, `maxicpDocs`, `gurobiDocs`, `mpvrpccProject`, and actual experimental records |
| 5 | Own evidence plus specific related work used for discussion |
| 6 | Primarily internal cross-references |
| Writing practice | `morleyPhrasebank`, `knuth1989writing` |

## 8. Appendices

| Appendix | What to include | How to present it |
| --- | --- | --- |
| A. Data Formats | Instance and solution schemas, types, units, IDs, small valid examples | Distinguish syntax from operational feasibility |
| B. Instance Generator | Complete generator pseudocode, distributions, seeds, configuration listing | Enable reproduction of the exact dataset |
| C. Solution Checker | Validation rules, tolerances, objective recomputation, error reporting | State what is checked and what is not |
| D. Visualization Tool | Selected labeled screenshots | Explain what each demonstrates; avoid an unexplained gallery |
| E. Supplementary Model Details | Long big-M derivations, valid inequalities, or implementation details if needed | Keep the complete core MILP in Section 4.2; omit this appendix if unnecessary |
| F. Supplementary Experimental Details | Per-instance outputs, statuses, settings, extra plots | Link instance IDs to data and logs; distinguish missing values from zero |

Core construction and search pseudocode remain in Section 4.3. If lengthy porting details are included in Appendix E or another technical appendix, cite the upstream TransitionCost source there as well.

**Writing workflow and final checks — guide only, not an additional thesis section**

Draft in the order **Problem Definition → MILP → Proposed Approach → Experimental Setup → Results → Literature Review → Background → Introduction → Conclusion → Abstract**. Keep the introduction short by moving detail to the relevant chapter rather than deleting important methodological information.

For each paragraph use **main point → evidence/explanation → interpretation**. Define mathematical symbols before use, explain equations in prose, and give algorithm inputs, outputs, and failure behavior. Use present tense for definitions, past tense for completed experiments, and cautious language for explanations. Consult [Academic Phrasebank](https://www.phrasebank.manchester.ac.uk/) by rhetorical function and [Mathematical Writing](https://jmlr.csail.mit.edu/reviewing-papers/knuth_mathematical_writing.pdf) for mathematical exposition.

Useful original sentence patterns:

- Literature: “The study addresses [setting] and represents cleaning through [verified mechanism]. The present specification differs in [precise feature].”
- Definition: “A request represents the demand for one product at one station. A supply node represents the stock of one product at one depot.”
- Method: “Construction fixes [decisions], after which CP assigns and orders the resulting mini-trips.”
- Attribution: “The TransitionCost implementation was adapted from [source] to the MaxiCP version used in this project; the modifications concern [verified changes].”
- Results: “Among [defined subset], the method achieved [verified outcome]. Cases without a valid solution are reported separately.”
- Discussion: “This behavior may be explained by [mechanism], although the experiment does not isolate that effect.”

Before submission:

- [ ] Requests and supply nodes are defined once and reused in both models.
- [ ] The operational constraints are distinct from construction restrictions.
- [ ] The core MILP follows Problem Definition in the main text.
- [ ] Splitting, packing, and vehicle-separation rules match the implementation.
- [ ] Travel and changeover units, initial states, and final charges are explicit.
- [ ] TransitionCost provenance and actual behavior are documented without inventing a new constraint contribution.
- [ ] Solver/code versions and upstream commit are recorded.
- [ ] All results trace to checked outputs and correct comparison denominators.
- [ ] Changeover-impact claims have a controlled experiment behind them.
- [ ] Every research question has a method, evidence, and a bounded answer.
