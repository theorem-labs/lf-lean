From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_string__U_emptyU_string__iso.
From IsomorphismChecker Require Isomorphisms.U_string__U_emptyU_string__iso.
From IsomorphismChecker Require Checker.U_string__string__iso.

Module Type Args <: Interface.U_string__U_emptyU_string__iso.Args := Checker.U_string__string__iso.Args <+ Checker.U_string__string__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_string__U_emptyU_string__iso.imported_String_EmptyString Isomorphisms.U_string__U_emptyU_string__iso.String_EmptyString_iso ].

Module Checker (Import args : Args) <: Interface.U_string__U_emptyU_string__iso.Interface args
  with Definition imported_String_EmptyString := Imported.String_EmptyString.

Definition imported_String_EmptyString := Isomorphisms.U_string__U_emptyU_string__iso.imported_String_EmptyString.
Definition String_EmptyString_iso := Isomorphisms.U_string__U_emptyU_string__iso.String_EmptyString_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions String_EmptyString_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.