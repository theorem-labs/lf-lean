From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf__U_rel__symmetric__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf__U_rel__symmetric__iso.
From IsomorphismChecker Require Checker.U_original__U2_lf__U_rel__relation__iso.

Module Type Args <: Interface.U_original__U2_lf__U_rel__symmetric__iso.Args := Checker.U_original__U2_lf__U_rel__relation__iso.Args <+ Checker.U_original__U2_lf__U_rel__relation__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf__U_rel__symmetric__iso.imported_Original_LF_Rel_symmetric Isomorphisms.U_original__U2_lf__U_rel__symmetric__iso.Original_LF_Rel_symmetric_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf__U_rel__symmetric__iso.Interface args
  with Definition imported_Original_LF_Rel_symmetric := (@Imported.Original_LF_Rel_symmetric).

Definition imported_Original_LF_Rel_symmetric := Isomorphisms.U_original__U2_lf__U_rel__symmetric__iso.imported_Original_LF_Rel_symmetric.
Definition Original_LF_Rel_symmetric_iso := Isomorphisms.U_original__U2_lf__U_rel__symmetric__iso.Original_LF_Rel_symmetric_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF_Rel_symmetric_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.