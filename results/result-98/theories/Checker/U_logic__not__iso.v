From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_logic__not__iso.
From IsomorphismChecker Require Isomorphisms.U_logic__not__iso.
From IsomorphismChecker Require Checker.U_false__iso.

Module Type Args <: Interface.U_logic__not__iso.Args := Checker.U_false__iso.Args <+ Checker.U_false__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_logic__not__iso.imported_Logic_not Isomorphisms.U_logic__not__iso.Logic_not_iso ].

Module Checker (Import args : Args) <: Interface.U_logic__not__iso.Interface args
  with Definition imported_Logic_not := Imported.Logic_not.

Definition imported_Logic_not := Isomorphisms.U_logic__not__iso.imported_Logic_not.
Definition Logic_not_iso := Isomorphisms.U_logic__not__iso.Logic_not_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Logic_not_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.