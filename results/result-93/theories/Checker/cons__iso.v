From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.cons__iso.
From IsomorphismChecker Require Isomorphisms.cons__iso.
From IsomorphismChecker Require Checker.list__iso.

Module Type Args <: Interface.cons__iso.Args := Checker.list__iso.Args <+ Checker.list__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.cons__iso.imported_cons Isomorphisms.cons__iso.cons_iso ].

Module Checker (Import args : Args) <: Interface.cons__iso.Interface args
  with Definition imported_cons := (@Imported.cons).

Definition imported_cons := Isomorphisms.cons__iso.imported_cons.
Definition cons_iso := Isomorphisms.cons__iso.cons_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions cons_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.