From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_some__iso.
From IsomorphismChecker Require Isomorphisms.U_some__iso.
From IsomorphismChecker Require Checker.option__iso.

Module Type Args <: Interface.U_some__iso.Args := Checker.option__iso.Args <+ Checker.option__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_some__iso.imported_Some Isomorphisms.U_some__iso.Some_iso ].

Module Checker (Import args : Args) <: Interface.U_some__iso.Interface args
  with Definition imported_Some := (@Imported.Some).

Definition imported_Some := Isomorphisms.U_some__iso.imported_Some.
Definition Some_iso := Isomorphisms.U_some__iso.Some_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Some_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.