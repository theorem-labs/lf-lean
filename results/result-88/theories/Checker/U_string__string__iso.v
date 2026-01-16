From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_string__string__iso.
From IsomorphismChecker Require Isomorphisms.U_string__string__iso.

Module Type Args <: Interface.U_string__string__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.U_string__string__iso.imported_String_string Isomorphisms.U_string__string__iso.String_string_iso ].

Module Checker (Import args : Args) <: Interface.U_string__string__iso.Interface args
  with Definition imported_String_string := Imported.String_string.

Definition imported_String_string := Isomorphisms.U_string__string__iso.imported_String_string.
Definition String_string_iso := Isomorphisms.U_string__string__iso.String_string_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions String_string_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.