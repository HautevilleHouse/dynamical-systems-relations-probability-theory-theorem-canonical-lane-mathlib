import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure SpectralMeasurePackage (X : ℕ → ℝ) where
  stationaryCondition : Prop
  autocovarianceFunction : ℕ → ℝ
  spectralDensity : ℝ → ℝ
  spectralRepresentation : Prop
  ergodicTheoremApplication : Prop

structure SpectralMeasureEvidence {X : ℕ → ℝ} (S : SpectralMeasurePackage X) where
  stationaryConditionClosed : S.stationaryCondition
  autocovarianceFunctionDefined : S.autocovarianceFunction 0 > 0
  spectralDensityPositive : ∀ ω, S.spectralDensity ω ≥ 0
  spectralRepresentationClosed : S.spectralRepresentation
  ergodicTheoremApplicationClosed : S.ergodicTheoremApplication

def SpectralAnalysisClosed {X : ℕ → ℝ} (S : SpectralMeasurePackage X) : Prop :=
  S.stationaryCondition ∧ (S.autocovarianceFunction 0 > 0) ∧ (∀ ω, S.spectralDensity ω ≥ 0) ∧ S.spectralRepresentation ∧ S.ergodicTheoremApplication

theorem spectral_analysis_closed_from_evidence {X : ℕ → ℝ} (S : SpectralMeasurePackage X) (Ev : SpectralMeasureEvidence S) : SpectralAnalysisClosed S := by
  exact And.intro Ev.stationaryConditionClosed (And.intro Ev.autocovarianceFunctionDefined (And.intro Ev.spectralDensityPositive (And.intro Ev.spectralRepresentationClosed Ev.ergodicTheoremApplicationClosed)))

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse