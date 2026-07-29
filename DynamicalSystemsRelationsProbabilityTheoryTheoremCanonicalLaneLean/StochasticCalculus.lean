import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure StochasticCalculusPackage where
  brownianMotion : Type u
  stochasticIntegral : Type v
  itoFormula : Prop
  quadraticVariation : Prop

def StochasticCalculusClosed (S : StochasticCalculusPackage) : Prop :=
  S.itoFormula ∧ S.quadraticVariation

structure StochasticCalculusEvidence (S : StochasticCalculusPackage) where
  itoFormulaClosed : S.itoFormula
  quadraticVariationClosed : S.quadraticVariation

theorem stochastic_calculus_closed_from_evidence (S : StochasticCalculusPackage) (E : StochasticCalculusEvidence S) : StochasticCalculusClosed S :=
  And.intro E.itoFormulaClosed E.quadraticVariationClosed

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse