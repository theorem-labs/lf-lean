From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_false__iso.
From IsomorphismChecker Require Isomorphisms.U_false__iso.

Module Type Args <: Interface.U_false__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.U_false__iso.imported_False Isomorphisms.U_false__iso.False_iso ].

Module Checker (Import args : Args) <: Interface.U_false__iso.Interface args
  with Definition imported_False := Imported.MyFalse.

Definition imported_False := Isomorphisms.U_false__iso.imported_False.
Definition False_iso := Isomorphisms.U_false__iso.False_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions False_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.