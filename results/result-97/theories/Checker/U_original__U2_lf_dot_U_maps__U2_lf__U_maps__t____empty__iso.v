From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____empty__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____empty__iso.
From IsomorphismChecker Require Checker.U_string__string__iso Checker.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____empty__iso.Args := Checker.U_string__string__iso.Checker <+ Checker.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____empty__iso.imported_Original_LF__DOT__Maps_LF_Maps_t__empty Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____empty__iso.Original_LF__DOT__Maps_LF_Maps_t__empty_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____empty__iso.Interface args
  with Definition imported_Original_LF__DOT__Maps_LF_Maps_t__empty := (@Imported.Original_LF__DOT__Maps_LF_Maps_t__empty).

Definition imported_Original_LF__DOT__Maps_LF_Maps_t__empty := Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____empty__iso.imported_Original_LF__DOT__Maps_LF_Maps_t__empty.
Definition Original_LF__DOT__Maps_LF_Maps_t__empty_iso := Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__t____empty__iso.Original_LF__DOT__Maps_LF_Maps_t__empty_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Maps_LF_Maps_t__empty_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.