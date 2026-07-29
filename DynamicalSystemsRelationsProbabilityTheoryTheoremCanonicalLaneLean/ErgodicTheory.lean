import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean.ProbabilitySpace

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure MeasurePreservingMap (Ω : ProbabilitySpace) (T : Ω → Ω) : Prop where
  measurable : Measurable T
  preservesMeasure : ∀ s, Ω.measure (T⁻¹' s) = Ω.measure s

structure Ergodic (Ω : ProbabilitySpace) (T : Ω → Ω) (h : MeasurePreservingMap Ω T) : Prop where
  invariantSetsAreTrivial : ∀ s, (T⁻¹' s = s) → (Ω.measure s = 0 ∨ Ω.measure s = 1)

theorem birkhoff_ergodic_theorem (Ω : ProbabilitySpace) (T : Ω → Ω) (h : MeasurePreservingMap Ω T) (hErgodic : Ergodic Ω T h) (f : Ω → ℝ) (integrable : ...) :
  (∀ ω, lim_{n→∞} (1/n) ∑_{k=0}^{n-1} f (T^k ω) = 𝔼[f]) ∧ (this convergence is almost sure) := by
  sorry

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse