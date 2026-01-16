From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.false__iso.
From IsomorphismChecker Require Isomorphisms.false__iso.
From IsomorphismChecker Require Checker.bool__iso.

Module Type Args <: Interface.false__iso.Args := Checker.bool__iso.Args <+ Checker.bool__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.false__iso.imported_false Isomorphisms.false__iso.false_iso ].

Module Checker (Import args : Args) <: Interface.false__iso.Interface args
  with Definition imported_false := Imported.Coqbool_Coqfalse.

Definition imported_false := Isomorphisms.false__iso.imported_false.
Definition false_iso := Isomorphisms.false__iso.false_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions false_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.