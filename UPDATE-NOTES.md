# Revised methodology

Based on thesis main commit 1ebfe3d. Extract into the repository root preserving
folders, or apply the separate patch. Do not use both methods.

This revision replaces the prior methodology draft. It presents the models
mathematically, with an alphabetical constraint list, explicit arc definitions,
a justified default trip limit, numbered MILP constraints and explanations,
four algorithms, named CP relations, and a piecewise transition-cost matrix.
The bibliography retains attribution and adds the MTZ reference.

The chapter preserves the given MILP allowance for zero-quantity visits;
requiring positive deliveries is explained as an additional constraint.
No solver experiments were run. Numerical experimental settings remain to be
completed from the actual experiment records.

The preview is a standalone report layout, not the university template. The
chapter and bibliography compile; citation keys, references and mathematical
layout were checked. The existing thesis class already loads algorithm2e.
