import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure ItoProcessPackage (Ω : Type) [MeasureSpace Ω] (W : ℕ × Ω → ℝ) where
  driftCoefficient : ℝ → ℝ → ℝ
  diffusionCoefficient : ℝ → ℝ → ℝ
  initialCondition : ℝ
  sdeSolution : Ω → ℝ → ℝ
  itoFormula : Prop
  quadraticVariation : Prop
  stochasticIntegralDefined : Prop

structure ItoProcessEvidence {Ω : Type} [MeasureSpace Ω] {W : ℕ × Ω → ℝ} (I : ItoProcessPackage Ω W) where
  driftMeasurable : Measurable (λ x => I.driftCoefficient x 0)
  diffusionMeasurable : Measurable (λ x => I.diffusionCoefficient x 0)
  initialConditionClosed : I.initialCondition = 0
  sdeSolutionContinuous : Continuous (I.sdeSolution 0)
  itoFormulaClosed : I.itoFormula
  quadraticVariationClosed : I.quadraticVariation
  stochasticIntegralDefinedClosed : I.stochasticIntegralDefined

def ItoCalculusClosed {Ω : Type} [MeasureSpace Ω] {W : ℕ × Ω → ℝ} (I : ItoProcessPackage Ω W) : Prop :=
  Measurable (λ x => I.driftCoefficient x 0) ∧ Measurable (λ x => I.diffusionCoefficient x 0) ∧ I.initialCondition = 0 ∧ Continuous (I.sdeSolution 0) ∧ I.itoFormula ∧ I.quadraticVariation ∧ I.stochasticIntegralDefined

theorem ito_calculus_closed_from_evidence {Ω : Type} [MeasureSpace Ω] {W : ℕ × Ω → ℝ} (I : ItoProcessPackage Ω W) (Ev : ItoProcessEvidence I) : ItoCalculusClosed I := by
  exact And.intro Ev.driftMeasurable (And.intro Ev.diffusionMeasurable (And.intro Ev.initialConditionClosed (And.intro Ev.sdeSolutionContinuous (And.intro Ev.itoFormulaClosed (And.intro Ev.quadraticVariationClosed Ev.stochasticIntegralDefinedClosed)))))

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse