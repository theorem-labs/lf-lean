From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.ex__iso.
From IsomorphismChecker Require Isomorphisms.ex__iso.

Module Type Args <: Interface.ex__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.ex__iso.imported_ex Isomorphisms.ex__iso.ex_iso ].

Module Checker (Import args : Args) <: Interface.ex__iso.Interface args
  with Definition imported_ex := Imported.ex.

Definition imported_ex := Isomorphisms.ex__iso.imported_ex.
Definition ex_iso := Isomorphisms.ex__iso.ex_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions ex_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.