From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_true__iso.
From IsomorphismChecker Require Isomorphisms.U_true__iso.

Module Type Args <: Interface.U_true__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.U_true__iso.imported_True Isomorphisms.U_true__iso.True_iso ].

Module Checker (Import args : Args) <: Interface.U_true__iso.Interface args
  with Definition imported_True := Imported.MyTrue.

Definition imported_True := Isomorphisms.U_true__iso.imported_True.
Definition True_iso := Isomorphisms.U_true__iso.True_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions True_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.