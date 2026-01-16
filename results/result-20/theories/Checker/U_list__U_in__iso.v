From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_list__U_in__iso.
From IsomorphismChecker Require Isomorphisms.U_list__U_in__iso.
From IsomorphismChecker Require Checker.list__iso.

Module Type Args <: Interface.U_list__U_in__iso.Args := Checker.list__iso.Args <+ Checker.list__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_list__U_in__iso.imported_List_In Isomorphisms.U_list__U_in__iso.List_In_iso ].

Module Checker (Import args : Args) <: Interface.U_list__U_in__iso.Interface args
  with Definition imported_List_In := Imported.List_In.

Definition imported_List_In := Isomorphisms.U_list__U_in__iso.imported_List_In.
Definition List_In_iso := Isomorphisms.U_list__U_in__iso.List_In_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions List_In_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.