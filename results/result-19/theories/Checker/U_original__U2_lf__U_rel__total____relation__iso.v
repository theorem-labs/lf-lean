From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf__U_rel__total____relation__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf__U_rel__total____relation__iso.
From IsomorphismChecker Require Checker.nat__iso.

Module Type Args <: Interface.U_original__U2_lf__U_rel__total____relation__iso.Args := Checker.nat__iso.Args <+ Checker.nat__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf__U_rel__total____relation__iso.imported_Original_LF_Rel_total__relation Isomorphisms.U_original__U2_lf__U_rel__total____relation__iso.Original_LF_Rel_total__relation_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf__U_rel__total____relation__iso.Interface args
  with Definition imported_Original_LF_Rel_total__relation := Imported.Original_LF_Rel_total__relation.

Definition imported_Original_LF_Rel_total__relation := Isomorphisms.U_original__U2_lf__U_rel__total____relation__iso.imported_Original_LF_Rel_total__relation.
Definition Original_LF_Rel_total__relation_iso := Isomorphisms.U_original__U2_lf__U_rel__total____relation__iso.Original_LF_Rel_total__relation_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF_Rel_total__relation_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.