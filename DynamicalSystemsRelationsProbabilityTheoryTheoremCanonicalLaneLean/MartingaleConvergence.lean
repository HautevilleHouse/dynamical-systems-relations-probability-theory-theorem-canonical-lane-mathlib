import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure MartingaleConvergence (Ω : Type u) [MeasureTheory.IsProbabilityMeasure (μ : MeasureTheory.Measure Ω)] where
  filtration : MeasureTheory.Filtration ℕ
  martingaleSequence : ℕ → (Ω → ℝ)
  almostSureLimit : Prop
  integrable : Prop

structure MartingaleConvergenceEvidence (M : MartingaleConvergence Ω) where
  almostSureLimitClosed : M.almostSureLimit
  integrableClosed : M.integrable

def MartingaleConvergenceClosed (M : MartingaleConvergence Ω) : Prop :=
  M.almostSureLimit ∧ M.integrable

theorem martingale_convergence_closed_from_evidence
    (M : MartingaleConvergence Ω) (E : MartingaleConvergenceEvidence M) :
    MartingaleConvergenceClosed M := by
  exact And.intro E.almostSureLimitClosed E.integrableClosed

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse