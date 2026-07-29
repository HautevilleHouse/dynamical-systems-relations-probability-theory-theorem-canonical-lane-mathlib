import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure ErgodicityPackage (X : Type) [MeasureSpace X] (T : X → X) where
  invariantMeasure : Measure X
  ergodicCondition : Prop
  mixingProperty : Prop
  spectralGap : ℝ
  decayOfCorrelations : Prop

structure ErgodicityEvidence {X : Type} [MeasureSpace X] {T : X → X} (E : ErgodicityPackage X T) where
  invariantMeasureClosed : E.invariantMeasure = volume
  ergodicConditionClosed : E.ergodicCondition
  mixingPropertyClosed : E.mixingProperty
  spectralGapPositive : E.spectralGap > 0
  decayOfCorrelationsClosed : E.decayOfCorrelations

def ErgodicityClosed {X : Type} [MeasureSpace X] {T : X → X} (E : ErgodicityPackage X T) : Prop :=
  E.invariantMeasure = volume ∧ E.ergodicCondition ∧ E.mixingProperty ∧ (E.spectralGap > 0) ∧ E.decayOfCorrelations

theorem ergodicity_closed_from_evidence {X : Type} [MeasureSpace X] {T : X → X} (E : ErgodicityPackage X T) (Ev : ErgodicityEvidence E) : ErgodicityClosed E := by
  exact And.intro Ev.invariantMeasureClosed (And.intro Ev.ergodicConditionClosed (And.intro Ev.mixingPropertyClosed (And.intro Ev.spectralGapPositive Ev.decayOfCorrelationsClosed)))

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse