import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure MeasurePreservingFlow (X : Type u) [MeasurableSpace X] where
  time : Type v
  flowMap : time → X → X
  sigmaFiniteMeasure : Set X → ℝ
  invarianceCondition : Prop
  initialCondition : Prop

structure MeasurePreservingFlowEvidence (M : MeasurePreservingFlow X) where
  invarianceConditionClosed : M.invarianceCondition
  initialConditionClosed : M.initialCondition

def MeasurePreservingFlowClosed (M : MeasurePreservingFlow X) : Prop :=
  M.invarianceCondition ∧ M.initialCondition

theorem measure_preserving_flow_closed_from_evidence
    (M : MeasurePreservingFlow X) (E : MeasurePreservingFlowEvidence M) :
    MeasurePreservingFlowClosed M := by
  exact And.intro E.invarianceConditionClosed E.initialConditionClosed

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse