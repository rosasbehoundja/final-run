# Original TikZ examples

Load `figures/tikz-style.tex` in the preamble. Each `.tex` file here contains
one `tikzpicture` and is included from `2-partie/1-fichier.tex`.

1. `routes.tex`: same four customers, one TSP tour versus two capacity-feasible
   VRP routes (demands 2, 3, 2, 2; vehicle capacity 5).
2. `multiple-trips.tex`: repeated depot visits by a single vehicle.
3. `changeovers.tex`: invented costs; 40+12+8=60 versus 44+0+12=56.
4. `two-opt.tex`: symmetric Euclidean open-path improvement, with fixed ends;
   2*sqrt(13)+3 versus 7. It is not an asymmetric-cost guarantee.
5. `propagation.tex`: two indivisible loads (6, 4), capacities (5, 10).
6. `sequence-insertion.tex`: required unplaced r, optional o, excluded x;
   partial sequence order is retained. Dashed arrows are alternative gaps.

Colours are paired with text labels and/or line styles. All examples are
illustrations, not the thesis dataset or reported solver results. They are
new drawings, not reproductions of figures from the cited papers.
