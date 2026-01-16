From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_string__U_string__iso.
From IsomorphismChecker Require Isomorphisms.U_string__U_string__iso.
From IsomorphismChecker Require Checker.U_ascii__ascii__iso Checker.U_string__string__iso.

Module Type Args <: Interface.U_string__U_string__iso.Args := Checker.U_ascii__ascii__iso.Checker <+ Checker.U_string__string__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_string__U_string__iso.imported_String_String Isomorphisms.U_string__U_string__iso.String_String_iso ].

Module Checker (Import args : Args) <: Interface.U_string__U_string__iso.Interface args
  with Definition imported_String_String := Imported.String_String.

Definition imported_String_String := Isomorphisms.U_string__U_string__iso.imported_String_String.
Definition String_String_iso := Isomorphisms.U_string__U_string__iso.String_String_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions String_String_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.