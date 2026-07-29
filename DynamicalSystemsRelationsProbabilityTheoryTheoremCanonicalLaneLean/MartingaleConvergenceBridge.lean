import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure MartingalePackage (Ω : Type) [MeasureSpace Ω] (ℱ : ℕ → MeasurableSpace Ω) where
  adaptedSequence : ℕ → Ω → ℝ
  integrability : ∀ n, Integrable (adaptedSequence n)
  martingaleProperty : ∀ n, ∀ A ∈ ℱ n, ∫ x in A, adaptedSequence (n+1) x ∂ volume = ∫ x in A, adaptedSequence n x ∂ volume
  almostSureConvergence : Prop
  limitRandomVariable : Ω → ℝ
  integrableLimit : Integrable limitRandomVariable

structure MartingaleEvidence {Ω : Type} [MeasureSpace Ω] {ℱ : ℕ → MeasurableSpace Ω} (M : MartingalePackage Ω ℱ) where
  adaptedSequenceClosed : ∀ n, Measurable (M.adaptedSequence n)
  integrabilityClosed : ∀ n, Integrable (M.adaptedSequence n)
  martingalePropertyClosed : ∀ n, ∀ A ∈ ℱ n, ∫ x in A, M.adaptedSequence (n+1) x ∂ volume = ∫ x in A, M.adaptedSequence n x ∂ volume
  almostSureConvergenceClosed : M.almostSureConvergence
  limitIntegrableClosed : Integrable M.limitRandomVariable

def MartingaleClosed {Ω : Type} [MeasureSpace Ω] {ℱ : ℕ → MeasurableSpace Ω} (M : MartingalePackage Ω ℱ) : Prop :=
  (∀ n, Measurable (M.adaptedSequence n)) ∧ (∀ n, Integrable (M.adaptedSequence n)) ∧ (∀ n, ∀ A ∈ ℱ n, ∫ x in A, M.adaptedSequence (n+1) x ∂ volume = ∫ x in A, M.adaptedSequence n x ∂ volume) ∧ M.almostSureConvergence ∧ Integrable M.limitRandomVariable

theorem martingale_closed_from_evidence {Ω : Type} [MeasureSpace Ω] {ℱ : ℕ → MeasurableSpace Ω} (M : MartingalePackage Ω ℱ) (Ev : MartingaleEvidence M) : MartingaleClosed M := by
  exact And.intro Ev.adaptedSequenceClosed (And.intro Ev.integrabilityClosed (And.intro Ev.martingalePropertyClosed (And.intro Ev.almostSureConvergenceClosed Ev.limitIntegrableClosed)))

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse