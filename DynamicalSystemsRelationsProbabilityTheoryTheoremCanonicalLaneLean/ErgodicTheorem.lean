import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure ErgodicTheorem (X : Type u) [MeasurableSpace X] where
  dynamicalSystem : X → X
  invariantMeasure : Set X → ℝ
  meanErgodic : Prop
  pointwiseErgodic : Prop
  integrableFunction : X → ℝ

structure ErgodicTheoremEvidence (E : ErgodicTheorem X) where
  meanErgodicClosed : E.meanErgodic
  pointwiseErgodicClosed : E.pointwiseErgodic

def ErgodicTheoremClosed (E : ErgodicTheorem X) : Prop :=
  E.meanErgodic ∧ E.pointwiseErgodic

theorem ergodic_theorem_closed_from_evidence
    (E : ErgodicTheorem X) (Ev : ErgodicTheoremEvidence E) :
    ErgodicTheoremClosed E := by
  exact And.intro Ev.meanErgodicClosed Ev.pointwiseErgodicClosed

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse