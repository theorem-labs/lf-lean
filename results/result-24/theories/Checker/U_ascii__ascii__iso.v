From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_ascii__ascii__iso.
From IsomorphismChecker Require Isomorphisms.U_ascii__ascii__iso.

Module Type Args <: Interface.U_ascii__ascii__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.U_ascii__ascii__iso.imported_Ascii_ascii Isomorphisms.U_ascii__ascii__iso.Ascii_ascii_iso ].

Module Checker (Import args : Args) <: Interface.U_ascii__ascii__iso.Interface args
  with Definition imported_Ascii_ascii := Imported.Ascii_ascii.

Definition imported_Ascii_ascii := Isomorphisms.U_ascii__ascii__iso.imported_Ascii_ascii.
Definition Ascii_ascii_iso := Isomorphisms.U_ascii__ascii__iso.Ascii_ascii_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Ascii_ascii_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.