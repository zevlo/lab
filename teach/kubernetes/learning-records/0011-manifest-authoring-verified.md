# Manifest authoring workflow verified; quiz position bias flagged

User scored 5/5 on lesson 0010 quiz and completed the lab (after step 2 fix for `expose` vs `create service clusterip`).

## Evidence
- Quiz 5/5 on dry-run scaffold, strip server fields, server dry-run, selector typo symptom, kubectl diff purpose.
- User noticed correct answers were always option A in lessons 0009 and 0010 (also true of 0008) — valid pattern-matching leak; not real retention signal if exploited.

## Diagnosis
Authoring habit placed correct answer first in HTML (`data-correct="0"`) for recent lessons when writing equal-length distractors. User's 5/5 is still credible (lab + prior lesson knowledge) but quiz difficulty was undermined.

## Implications
- Manifest authoring workflow can advance.
- All lessons updated: quiz JS shuffles options on page load. Future lessons: vary `data-correct` in source AND keep shuffle JS.
