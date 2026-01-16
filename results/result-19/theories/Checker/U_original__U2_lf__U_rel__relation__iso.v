From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf__U_rel__relation__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf__U_rel__relation__iso.

Module Type Args <: Interface.U_original__U2_lf__U_rel__relation__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf__U_rel__relation__iso.imported_Original_LF_Rel_relation Isomorphisms.U_original__U2_lf__U_rel__relation__iso.Original_LF_Rel_relation_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf__U_rel__relation__iso.Interface args
  with Definition imported_Original_LF_Rel_relation := Imported.Original_LF_Rel_relation.

Definition imported_Original_LF_Rel_relation := Isomorphisms.U_original__U2_lf__U_rel__relation__iso.imported_Original_LF_Rel_relation.
Definition Original_LF_Rel_relation_iso := Isomorphisms.U_original__U2_lf__U_rel__relation__iso.Original_LF_Rel_relation_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF_Rel_relation_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.