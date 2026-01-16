From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf__U_rel__le____not____symmetric__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf__U_rel__le____not____symmetric__iso.
From IsomorphismChecker Require Checker.U_false__iso Checker.U_logic__not__iso Checker.U_original__U2_lf__U_rel__relation__iso Checker.U_original__U2_lf__U_rel__symmetric__iso Checker.nat__iso Checker.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.

Module Type Args <: Interface.U_original__U2_lf__U_rel__le____not____symmetric__iso.Args := Checker.U_false__iso.Checker <+ Checker.U_logic__not__iso.Checker <+ Checker.U_original__U2_lf__U_rel__relation__iso.Checker <+ Checker.U_original__U2_lf__U_rel__symmetric__iso.Checker <+ Checker.nat__iso.Checker <+ Checker.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__le__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf__U_rel__le____not____symmetric__iso.imported_Original_LF_Rel_le__not__symmetric Isomorphisms.U_original__U2_lf__U_rel__le____not____symmetric__iso.Original_LF_Rel_le__not__symmetric_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf__U_rel__le____not____symmetric__iso.Interface args
  with Definition imported_Original_LF_Rel_le__not__symmetric := Imported.Original_LF_Rel_le__not__symmetric.

Definition imported_Original_LF_Rel_le__not__symmetric := Isomorphisms.U_original__U2_lf__U_rel__le____not____symmetric__iso.imported_Original_LF_Rel_le__not__symmetric.
Definition Original_LF_Rel_le__not__symmetric_iso := Isomorphisms.U_original__U2_lf__U_rel__le____not____symmetric__iso.Original_LF_Rel_le__not__symmetric_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF_Rel_le__not__symmetric_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.