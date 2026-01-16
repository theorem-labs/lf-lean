From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_s__iso.
From IsomorphismChecker Require Isomorphisms.U_s__iso.
From IsomorphismChecker Require Checker.nat__iso.

Module Type Args <: Interface.U_s__iso.Args := Checker.nat__iso.Args <+ Checker.nat__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_s__iso.imported_S Isomorphisms.U_s__iso.S_iso ].

Module Checker (Import args : Args) <: Interface.U_s__iso.Interface args
  with Definition imported_S := Imported.nat_S.

Definition imported_S := Isomorphisms.U_s__iso.imported_S.
Definition S_iso := Isomorphisms.U_s__iso.S_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions S_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.