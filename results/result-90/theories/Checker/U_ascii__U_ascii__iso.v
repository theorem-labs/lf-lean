From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_ascii__U_ascii__iso.
From IsomorphismChecker Require Isomorphisms.U_ascii__U_ascii__iso.
From IsomorphismChecker Require Checker.U_ascii__ascii__iso Checker.bool__iso.

Module Type Args <: Interface.U_ascii__U_ascii__iso.Args := Checker.U_ascii__ascii__iso.Checker <+ Checker.bool__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_ascii__U_ascii__iso.imported_Ascii_Ascii Isomorphisms.U_ascii__U_ascii__iso.Ascii_Ascii_iso ].

Module Checker (Import args : Args) <: Interface.U_ascii__U_ascii__iso.Interface args
  with Definition imported_Ascii_Ascii := Imported.Ascii_ascii_Ascii.

Definition imported_Ascii_Ascii := Isomorphisms.U_ascii__U_ascii__iso.imported_Ascii_Ascii.
Definition Ascii_Ascii_iso := Isomorphisms.U_ascii__U_ascii__iso.Ascii_Ascii_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Ascii_Ascii_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.