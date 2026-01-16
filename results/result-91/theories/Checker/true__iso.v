From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.true__iso.
From IsomorphismChecker Require Isomorphisms.true__iso.
From IsomorphismChecker Require Checker.bool__iso.

Module Type Args <: Interface.true__iso.Args := Checker.bool__iso.Args <+ Checker.bool__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.true__iso.imported_true Isomorphisms.true__iso.true_iso ].

Module Checker (Import args : Args) <: Interface.true__iso.Interface args
  with Definition imported_true := Imported.mybool_mytrue.

Definition imported_true := Isomorphisms.true__iso.imported_true.
Definition true_iso := Isomorphisms.true__iso.true_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions true_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.