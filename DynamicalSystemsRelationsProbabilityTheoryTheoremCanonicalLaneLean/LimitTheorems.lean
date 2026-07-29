import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean

structure LimitTheoremsPackage where
  lawOfLargeNumbers : Prop
  centralLimitTheorem : Prop
  largeDeviations : Prop

def LimitTheoremsClosed (L : LimitTheoremsPackage) : Prop :=
  L.lawOfLargeNumbers ∧ L.centralLimitTheorem ∧ L.largeDeviations

structure LimitTheoremsEvidence (L : LimitTheoremsPackage) where
  lawOfLargeNumbersClosed : L.lawOfLargeNumbers
  centralLimitTheoremClosed : L.centralLimitTheorem
  largeDeviationsClosed : L.largeDeviations

theorem limit_theorems_closed_from_evidence (L : LimitTheoremsPackage) (E : LimitTheoremsEvidence L) : LimitTheoremsClosed L :=
  And.intro E.lawOfLargeNumbersClosed (And.intro E.centralLimitTheoremClosed E.largeDeviationsClosed)

end DynamicalSystemsRelationsProbabilityTheoryTheoremCanonicalLaneLean
end HautevilleHouse