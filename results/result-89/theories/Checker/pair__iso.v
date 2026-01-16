From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.pair__iso.
From IsomorphismChecker Require Isomorphisms.pair__iso.
From IsomorphismChecker Require Checker.prod__iso.

Module Type Args <: Interface.pair__iso.Args := Checker.prod__iso.Args <+ Checker.prod__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.pair__iso.imported_pair Isomorphisms.pair__iso.pair_iso ].

Module Checker (Import args : Args) <: Interface.pair__iso.Interface args
  with Definition imported_pair := (@Imported.pair).

Definition imported_pair := Isomorphisms.pair__iso.imported_pair.
Definition pair_iso := Isomorphisms.pair__iso.pair_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions pair_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.