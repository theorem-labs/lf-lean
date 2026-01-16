From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_original__U2_lf__U_rel__rtc____rsc____coincide__iso.
From IsomorphismChecker Require Isomorphisms.U_original__U2_lf__U_rel__rtc____rsc____coincide__iso.
From IsomorphismChecker Require Checker.U_original__U2_lf__U_rel__relation__iso Checker.U_original__U2_lf__U_rel__clos____refl____trans____1n__iso Checker.U_original__U2_lf__U_rel__clos____refl____trans__iso Checker.iff__iso.

Module Type Args <: Interface.U_original__U2_lf__U_rel__rtc____rsc____coincide__iso.Args := Checker.U_original__U2_lf__U_rel__relation__iso.Checker <+ Checker.U_original__U2_lf__U_rel__clos____refl____trans____1n__iso.Checker <+ Checker.U_original__U2_lf__U_rel__clos____refl____trans__iso.Checker <+ Checker.iff__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_original__U2_lf__U_rel__rtc____rsc____coincide__iso.imported_Original_LF_Rel_rtc__rsc__coincide Isomorphisms.U_original__U2_lf__U_rel__rtc____rsc____coincide__iso.Original_LF_Rel_rtc__rsc__coincide_iso ].

Module Checker (Import args : Args) <: Interface.U_original__U2_lf__U_rel__rtc____rsc____coincide__iso.Interface args
  with Definition imported_Original_LF_Rel_rtc__rsc__coincide := Imported.Original_LF_Rel_rtc__rsc__coincide.

Definition imported_Original_LF_Rel_rtc__rsc__coincide := Isomorphisms.U_original__U2_lf__U_rel__rtc____rsc____coincide__iso.imported_Original_LF_Rel_rtc__rsc__coincide.
Definition Original_LF_Rel_rtc__rsc__coincide_iso := Isomorphisms.U_original__U2_lf__U_rel__rtc____rsc____coincide__iso.Original_LF_Rel_rtc__rsc__coincide_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Original_LF_Rel_rtc__rsc__coincide_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.