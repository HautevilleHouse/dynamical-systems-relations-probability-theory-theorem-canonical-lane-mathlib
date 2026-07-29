import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure StochasticProcess (Ω : Type u) [MeasureTheory.IsProbabilityMeasure (μ : MeasureTheory.Measure Ω)] where
  timeIndex : Type v
  process : timeIndex → Ω → ℝ
  adapted : Prop
  markovProperty : Prop

structure StochasticProcessEvidence (S : StochasticProcess Ω) where
  adaptedClosed : S.adapted
  markovPropertyClosed : S.markovProperty

def StochasticProcessClosed (S : StochasticProcess Ω) : Prop :=
  S.adapted ∧ S.markovProperty

theorem stochastic_process_closed_from_evidence
    (S : StochasticProcess Ω) (E : StochasticProcessEvidence S) :
    StochasticProcessClosed S := by
  exact And.intro E.adaptedClosed E.markovPropertyClosed

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse