From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.nil__iso.
From IsomorphismChecker Require Isomorphisms.nil__iso.
From IsomorphismChecker Require Checker.list__iso.

Module Type Args <: Interface.nil__iso.Args := Checker.list__iso.Args <+ Checker.list__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.nil__iso.imported_nil Isomorphisms.nil__iso.nil_iso ].

Module Checker (Import args : Args) <: Interface.nil__iso.Interface args
  with Definition imported_nil := (@Imported.nil).

Definition imported_nil := Isomorphisms.nil__iso.imported_nil.
Definition nil_iso := Isomorphisms.nil__iso.nil_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions nil_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.