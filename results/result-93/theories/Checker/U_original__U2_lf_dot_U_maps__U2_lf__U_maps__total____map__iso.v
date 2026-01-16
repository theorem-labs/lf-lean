From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.
From IsomorphismChecker Require Checker.U_string__string__iso.

Module Type Args <: Interface.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.Args := Checker.U_string__string__iso.Args <+ Checker.U_string__string__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.imported_Original_LF__DOT__Maps_LF_Maps_total__map Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.Original_LF__DOT__Maps_LF_Maps_total__map_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.Interface args
  with Definition imported_Original_LF__DOT__Maps_LF_Maps_total__map := Imported.Original_LF__DOT__Maps_LF_Maps_total__map.

Definition imported_Original_LF__DOT__Maps_LF_Maps_total__map := Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.imported_Original_LF__DOT__Maps_LF_Maps_total__map.
Definition Original_LF__DOT__Maps_LF_Maps_total__map_iso := Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__total____map__iso.Original_LF__DOT__Maps_LF_Maps_total__map_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF__DOT__Maps_LF_Maps_total__map_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.