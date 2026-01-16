From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.iff__iso.
From IsomorphismChecker Require Isomorphisms.iff__iso.

Module Type Args <: Interface.iff__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.iff__iso.imported_iff Isomorphisms.iff__iso.iff_iso ].

Module Checker (Import args : Args) <: Interface.iff__iso.Interface args
  with Definition imported_iff := Imported.iff.

Definition imported_iff := Isomorphisms.iff__iso.imported_iff.
Definition iff_iso := Isomorphisms.iff__iso.iff_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions iff_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.