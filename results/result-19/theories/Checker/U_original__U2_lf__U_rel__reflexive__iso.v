From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf__U_rel__reflexive__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf__U_rel__reflexive__iso.
From IsomorphismChecker Require Checker.U_original__U2_lf__U_rel__relation__iso.

Module Type Args <: Interface.U_original__U2_lf__U_rel__reflexive__iso.Args := Checker.U_original__U2_lf__U_rel__relation__iso.Args <+ Checker.U_original__U2_lf__U_rel__relation__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf__U_rel__reflexive__iso.imported_Original_LF_Rel_reflexive Isomorphisms.U_original__U2_lf__U_rel__reflexive__iso.Original_LF_Rel_reflexive_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf__U_rel__reflexive__iso.Interface args
  with Definition imported_Original_LF_Rel_reflexive := (@Imported.Original_LF_Rel_reflexive).

Definition imported_Original_LF_Rel_reflexive := Isomorphisms.U_original__U2_lf__U_rel__reflexive__iso.imported_Original_LF_Rel_reflexive.
Definition Original_LF_Rel_reflexive_iso := Isomorphisms.U_original__U2_lf__U_rel__reflexive__iso.Original_LF_Rel_reflexive_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF_Rel_reflexive_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.