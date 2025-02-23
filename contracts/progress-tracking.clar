;; Progress Tracking Contract

(define-map terraforming-progress
  { planet-id: uint }
  {
    atmosphere-quality: uint,
    water-coverage: uint,
    biodiversity: uint
  }
)

(define-public (update-progress (planet-id uint) (atmosphere-quality uint) (water-coverage uint) (biodiversity uint))
  (ok (map-set terraforming-progress
    { planet-id: planet-id }
    {
      atmosphere-quality: atmosphere-quality,
      water-coverage: water-coverage,
      biodiversity: biodiversity
    }
  ))
)

(define-read-only (get-planet-progress (planet-id uint))
  (map-get? terraforming-progress { planet-id: planet-id })
)

