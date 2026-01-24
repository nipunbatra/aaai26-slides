---
marp: true
theme: default
paginate: true
math: mathjax
style: |
  @import url('https://fonts.googleapis.com/css2?family=Fira+Sans:wght@300;400;500;600&display=swap');
  :root {
    --dark: #23373b;
    --accent: #eb811b;
  }
  section {
    font-family: 'Fira Sans', sans-serif;
    background: #fafafa;
    padding: 0;
    overflow: hidden;
  }
  section h1 {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 70px;
    background: var(--dark);
    color: white;
    font-weight: 500;
    font-size: 1.35em;
    margin: 0;
    padding: 0 40px;
    display: flex;
    align-items: center;
    box-sizing: border-box;
  }
  section > *:not(h1) {
    margin-left: 40px;
    margin-right: 40px;
  }
  section > *:nth-child(2) {
    margin-top: 90px;
  }
  section p, section ul, section ol {
    margin-top: 12px;
    margin-bottom: 12px;
  }
  strong { color: var(--accent); font-weight: 600; }
  blockquote {
    border-left: 3px solid var(--accent);
    padding-left: 15px;
    margin: 15px 40px;
    color: #555;
    font-style: italic;
  }
  table { font-size: 0.85em; border-collapse: collapse; margin: 15px 40px; }
  th { background: var(--dark); color: white; padding: 8px 12px; }
  td { padding: 8px 12px; border-bottom: 1px solid #ddd; }
  img[alt~="center"] { display: block; margin: 10px auto; }
  section.lead {
    justify-content: center;
    align-items: center;
    text-align: center;
    background: var(--dark);
    color: white;
    display: flex;
    flex-direction: column;
  }
  section.lead h1 {
    position: relative;
    height: auto;
    background: transparent;
    font-size: 2.2em;
    font-weight: 400;
    padding: 0;
    margin-bottom: 20px;
  }
  section.lead strong { color: var(--accent); }
  section.lead p { font-size: 1.1em; margin: 8px 40px; }
  section::after {
    font-size: 0.65em;
    color: #888;
  }
  .black { color: #000; font-weight: 600; }
  .green { color: #00a651; font-weight: 600; }
  .blue { color: #4a90d9; font-weight: 600; }
  .orange { color: #eb811b; font-weight: 600; }
  .cols { display: flex; gap: 2rem; align-items: center; }
  .col { flex: 1; }
  .col.small { flex: 0.8; }
  .col img { max-width: 100%; height: auto; }
  .author-row { display: flex; justify-content: center; gap: 2rem; margin: 1rem 0; }
  .author { text-align: center; }
  .author img { width: 90px !important; height: 90px !important; border-radius: 50%; object-fit: cover; background: white; }
  .author-name { font-size: 0.65em; margin-top: 0.3rem; }
  .logo-row { display: flex; justify-content: center; align-items: center; gap: 1.5rem; margin-top: 0.8rem; background: rgba(255,255,255,0.95); padding: 0.5rem 1.5rem; border-radius: 8px; }
  .logo-row img { height: 55px !important; width: auto !important; }
  .qr img { width: 70px !important; height: 70px !important; }
---

<!-- _class: lead -->
<!-- _paginate: false -->

# Scalable Sensor Placement for Air Quality via Gradient-Based Optimization of Mutual Information

<div class="author-row">
<div class="author">
<img src="assets/images/authors/zeel_white.png" />
<div class="author-name">Zeel B Patel</div>
</div>
<div class="author">
<img src="assets/images/authors/vinayak_white.png" />
<div class="author-name">Vinayak Rana</div>
</div>
<div class="author">
<img src="assets/images/authors/nipun_white.png" />
<div class="author-name">Nipun Batra</div>
</div>
</div>

AAAI 2026 · AI for Social Impact Track

<div class="logo-row">
<img src="assets/images/aaai_logo.png" />
<img src="assets/images/iitgn_logo.png" />
<img src="assets/images/logo_colored.svg" />
</div>

---

# Air Pollution: A Global Health Crisis

![width:550px center](assets/images/pollution_deaths_stats.png)

- **7 million** premature deaths annually (WHO)
- More than malaria, HIV, and road accidents **combined**
- **91%** of deaths in low/middle-income countries

---

# Current Air Quality Monitoring in India

<div class="cols">
<div class="col">

<img src="assets/images/india_pm_with_stations.png" style="max-height:400px;" />

</div>
<div class="col">

| Metric | Value |
|:-------|------:|
| CPCB stations | ~600 |
| Population | 1.4 billion |
| People per station | **2.3 million** |
| Area per station | **5,400 km²** |

> **Takeaway:** Severely under-monitored for a country of this size and pollution levels

</div>
</div>

---

# The Coverage Gap

<div class="cols">
<div class="col">

<img src="assets/images/india_urban_only_coverage.png" style="max-height:340px;" />

</div>
<div class="col">

**Urban-only coverage**
- Sensors in Delhi, Mumbai, Chennai, Bangalore, Kolkata
- Rural India remains **invisible**

**Hundreds of millions** unmonitored

No data → No policy → No protection

</div>
</div>

---

# Global Comparison: Room for Growth

| Country | Stations ↑ | People/Station ↓ | Stations/1000 km² ↑ |
|---------|----------:|--------------:|-----------------:|
| USA | 4,800 | 69K | 0.49 |
| China | 5,000 | 280K | 0.52 |
| Germany | 500 | 166K | 1.40 |
| UK | 300 | 223K | 1.23 |
| **India** | **611** | **2,290K** | **0.19** |

India has **33× more people per station** than USA — significant opportunity for expansion

---

# Why Not Just Add More Sensors?

**Full CPCB CAAQMS** (BAM + gases + shelter): **₹2-3 crore+** per station

| | Cost (₹) | Cost ($) |
|:--|--:|--:|
| 1 station | ₹2-3 crore | $250-350K |
| 100 stations | ₹200-300 crore | $25-35M |
| 1,000 stations | ₹2,000-3,000 crore | $250-350M |

Current CPCB network: ~600 stations

> **Smart placement is critical** — every sensor must maximize value!

---

# The Core Question

Given a **limited budget** of $k$ new sensors:

**Where should we place them?**

> Goal: Maximize information about the **entire** region

---

# Problem Formulation

<div class="cols">

<div class="col small">

<span class="black">$X_c$</span> — Existing sensors

<span class="green">$X_{\text{pool}}$</span> — Candidate locations ($n$ points)

<span class="blue">$X_t$</span> — Target region to predict

$k$ — Budget for new sensors

**Goal:** Select $k$ from <span class="green">$X_{\text{pool}}$</span> to maximize info about <span class="blue">$X_t$</span>

</div>

<div class="col">

<img src="assets/images/india_problem_green_20260122_182845.png" style="max-height:420px;" />

</div>

</div>

---

# Optimal Sensor Placement (OSP)

| | |
|:--|:--|
| **1. Surrogate Model** — Predicts values + uncertainty; must be differentiable | ![width:360px](assets/images/surrogate_output_20260122_180321.png) |
| **2. Acquisition Function** — Scores candidates; guides placement | ![width:360px](assets/images/acquisition_scores_20260122_180345.png) |

---

# Acquisition 1: Random

> Pick $k$ locations **uniformly at random** from candidates

$$\underbrace{\color{#00a651}{X_{\text{new}}}}_{\text{selected }k\text{ locations}} \sim \text{Uniform}\Big(\underbrace{\color{#00a651}{X_{\text{pool}}}}_{\text{all }n\text{ candidates}}\Big)$$

**In plain English:**

*"Close your eyes and point at the map $k$ times"*

- No optimization — pure luck
- Ignores data completely
- **Baseline** for comparison

---

# Acquisition 2: Maximum Variance (MaxVar)

> **Greedily** pick the location with **highest uncertainty**

$$\underbrace{\color{#00a651}{x^*}}_{\text{best location}} = \arg\max_{x \,\in\, \color{#00a651}{X_{\text{pool}}}} \underbrace{\text{Var}(\color{#4a90d9}{y} \mid X_c, Y_c, x)}_{\text{how uncertain is prediction at }x\text{?}}$$

**In plain English:**

*"Where are we most uncertain? Put a sensor there."*

Repeat $k$ times, each time adding the selected sensor to context.

**Pros:** Fast $O(k)$, intuitive

**Cons:** Doesn't maximize information gain with minimum sensors

---

# The MI Objective: What We Want to Maximize

> **Mutual Information:** How much does knowing $Y_{\text{new}}$ reduce uncertainty about <span class="blue">$Y_t$</span>?

$$I(\color{#4a90d9}{Y_t}; Y_{\text{new}} \mid X_c, Y_c) = \underbrace{H(\color{#4a90d9}{Y_t} \mid X_c, Y_c)}_{\text{uncertainty BEFORE}} - \underbrace{H(\color{#4a90d9}{Y_t} \mid X_c, Y_c, Y_{\text{new}})}_{\text{uncertainty AFTER}}$$

**Reading this:** *"Given existing sensors $(X_c, Y_c)$, how much does adding new sensors reduce our uncertainty about the target region?"*

$$\max_{\color{#00a651}{X_{\text{new}}}} I \;\equiv\; \min_{\color{#00a651}{X_{\text{new}}}} H(\color{#4a90d9}{Y_t} \mid \text{all data})$$

---

# MI vs MaxVar: What's the Difference?

**For Gaussian outputs** (GP/Neural Process): $H \propto \log \sigma^2$ → both use variance

| | MaxVar | MI |
|:--|:------:|:--:|
| Optimizes for | Single point | <span class="blue">Entire target region</span> |
| Variance | **at candidate** | **over target region** |

- MaxVar: *"where am I uncertain?"*
- MI: *"what reduces uncertainty everywhere?"*

**Problem:** Exact MI requires searching $\binom{n}{k}$ subsets — combinatorially explosive!

---

# Acquisition 3: Greedy MI (Standard Approach)

> Since exact MI is intractable, use **greedy approximation**: select one sensor at a time

$$\color{#00a651}{x^*} = \arg\max_{x \in \color{#00a651}{X_{\text{pool}}}} I(\color{#4a90d9}{Y_t}; y_x \mid X_c, Y_c, \text{selected})$$

**Algorithm:** For each of $k$ rounds, evaluate all $n$ candidates → pick best

**Complexity:** $O(n \cdot k)$ evaluations

| $n$ (candidates) | $k$ (budget) | Evaluations |
|:----------------:|:------------:|:-----------:|
| 1,000 | 50 | 50,000 |
| **20,000** | **100** | **2,000,000** |

> For India ($n \approx 20,000$): **computationally infeasible!**

---

<!-- _class: lead -->

# The Challenge

**Greedy MI** gives best quality but doesn't scale

**MaxVar** scales but gives poor quality

Can we get **both**?

---

# Our Solution: GD-MI

> **Key insight:** Don't search discrete candidates — **optimize coordinates directly!**

| | Greedy MI | GD-MI (Ours) |
|:--|:--:|:--:|
| **Search space** | Discrete ($n$ candidates) | Continuous (coordinates) |
| **Optimization** | Enumerate all | Gradient descent |
| **Complexity** | $O(n \cdot k)$ | $O(I)$ iterations |
| **Scalability** | ❌ $n > 1000$ | ✓ Any $n$ |

<div class="cols">
<div class="col">

![width:350px](assets/images/mi_landscape_d.png)
Greedy MI: Search grid

</div>
<div class="col">

![width:350px](assets/images/mi_landscape.png)
GD-MI: Follow gradient

</div>
</div>

---

# GD-MI: How It Works

**What we optimize:** $k$ sensor locations, each a (lat, lon) pair

$$\color{#00a651}{X_{\text{new}}} = \{(lat_1, lon_1), \ldots, (lat_k, lon_k)\}$$

**Objective:** Minimize average variance over <span class="blue">target region</span>

$$\mathcal{L} = \frac{1}{|X_t|} \sum_{x_t \in \color{#4a90d9}{X_t}} \sigma^2\Big(x_t \mid X_c, Y_c, \color{#00a651}{X_{\text{new}}}, \hat{Y}_{\text{new}}\Big)$$

where $\hat{Y}_{\text{new}} = \mu(X_{\text{new}} \mid X_c, Y_c)$ — predicted values at proposed locations

**Algorithm:** Initialize → Forward (get $\sigma^2$) → Backward ($\nabla_{X_{\text{new}}} \mathcal{L}$) → Update → Repeat

> **Key:** Model is **frozen** — only the $2k$ coordinates are optimized

---

# Surrogate Model: Why Neural Processes?

GD-MI needs a model that provides:

| Requirement | Why? |
|:------------|:-----|
| **Predictions** | To impute values at proposed locations |
| **Calibrated uncertainty** | To compute information gain |
| **Differentiable** | To backpropagate through |
| **Fast inference** | To iterate quickly |

> **TNP-D** (Transformer Neural Process) satisfies all!

---

# Surrogate Model: Transformer Neural Process (TNP-D)

<div class="cols">

<div class="col">

<img src="assets/images/np_simple.png" style="max-height:400px;" />

</div>

<div class="col">

- Predicts PM$_{2.5}$ **and** uncertainty
- Fully differentiable
- Fast parallel inference

| Model | RMSE ↓ | NLL ↓ |
|-------|-------:|------:|
| Gaussian Process | 5.16 | -0.19 |
| Convolutional GNP | 5.31 | -0.30 |
| **Transformer NP** | **4.90** | **-0.44** |

</div>

</div>

---

<!-- _class: lead -->

# Experiments

Does GD-MI actually work?

---

# Experiment 1: Regional Validation

> **Madhya Pradesh** — a central Indian state (~size of Germany, $n$=308 candidates)

<div class="cols">

<div class="col">

<img src="assets/images/case_study_MP.png" style="max-height:340px;" />

</div>

<div class="col">

**Results (k=9 sensors):**

| Method | RMSE ↓ |
|:-------|-------:|
| Random | 7.2 |
| MaxVar | 6.3 |
| **GD-MI** | **5.8** |
| Greedy MI | 5.6 |

GD-MI within **0.2 RMSE** of Greedy MI (gold standard)

</div>

</div>

---

# Experiment 2: India-Scale (The Real Test)

> **Greedy MI infeasible** ($n \approx 20,000$) — GD-MI shines here

<div class="cols">

<div class="col">

<img src="assets/images/al_test_rmse_india.png" style="max-height:380px;" />

</div>

<div class="col">

**Key findings:**

- GD-MI **4% better** than MaxVar
- Gap **grows** with more sensors
- Consistent across budgets

</div>

</div>

---

# Why Does GD-MI Win? Qualitative Analysis

<div class="cols">

<div class="col">

<img src="assets/images/quality_20_india.png" style="max-height:400px;" />

</div>

<div class="col">

**MaxVar** (blue dots)
- Optimizes for single-point uncertainty
- Doesn't consider target region

**GD-MI** (red dots)
- Optimizes for entire target region
- Maximizes information gain

*MI objective guides placement for maximum coverage*

</div>

</div>

---

# Scalability: GD-MI vs Greedy MI

![width:650px center](assets/images/scalability.png)

- Greedy MI: **runtime grows** with pool size $n$
- GD-MI: **constant time** regardless of $n$
- At $n = 20,000$: GD-MI is **~100× faster**

---

# Limitations & Future Work

<div class="cols">
<div class="col">

**Current Limitation**

We minimize **average** variance, but pollution burden is **not uniform**

**Equity-Aware Placement:**
$$\mathcal{L}_{\text{fair}} = \mathbb{E}\Big[w(x_t) \cdot \text{Var}(y_t)\Big]$$

Weight by population, pollution, health vulnerability

</div>
<div class="col">

**Beyond Static Sensors**

- **Low-cost sensors:** Dense affordable networks
- **Mobile sensing:** Dynamic routing optimization
- **Multi-pollutant:** Joint PM₂.₅, NO₂, O₃

Same GD-MI framework, different objectives!

</div>
</div>

---

<!-- _paginate: false -->

![bg contain](assets/images/sustainability_lab_prompt_subtitles_generated_20251217_162815.png)

---

# Main Takeaways

1. **GD-MI** = First gradient-based MI maximization for sensor placement

2. **Scalability breakthrough:** $O(I)$ vs $O(n \cdot k)$
   - Enables **continental-scale** optimization

3. **Quality preserved:** Matches Greedy MI where tractable, **4% better** than MaxVar at scale

4. **Real-world ready:** Deployed framework for India air quality monitoring

---

<!-- _class: lead -->
<!-- _paginate: false -->

# Thank You!

<div style="display:flex; justify-content:center; gap:3rem; margin:1.5rem 0;">
<div class="qr" style="text-align:center;">
<img src="assets/images/qr_paper.png" />
<div style="font-size:0.7em; margin-top:0.3rem;">Paper</div>
</div>
<div class="qr" style="text-align:center;">
<img src="assets/images/qr_lab.png" />
<div style="font-size:0.7em; margin-top:0.3rem;">Lab</div>
</div>
</div>

**Sustainability Lab @ IIT Gandhinagar**

Positions: PhD · Postdoc · RA · Intern

{patel_zeel, vinayak.rana, nipun.batra}@iitgn.ac.in

---

<!-- _paginate: false -->

# Backup Slides

---

# Impact: Same Budget, Better Outcomes

**The cascade effect:**

Better placement (GD-MI)
↓
Better predictions (lower RMSE)
↓
Better pollution maps (policy-ready)
↓
Better health outcomes (targeted interventions)

> **4% RMSE improvement** at national scale = **millions** of people better served

---

# Dataset: WUSTL PM₂.₅

- **Source:** Washington University in St. Louis
- **Resolution:** 0.1° × 0.1° (~11 km)
- **Period:** 1998-2018 (21 years monthly)
- **Split:** Train 98-08 | Val 09-10 | Test 11-18

---

# Full Model Benchmark

| Model | NLL ↓ | RMSE ↓ |
|-------|:-----:|:------:|
| CNP | 0.48 | 11.46 |
| Random Forest | -0.11 | 6.55 |
| GP | -0.19 | 5.16 |
| ConvCNP | -0.27 | 5.28 |
| ConvGNP | -0.30 | 5.31 |
| TabPFN | -0.37 | 5.09 |
| **TNP-D** | **-0.44** | **4.90** |

---

# Constraint: Keep Sensors on Land

$$\mathcal{L}_{\text{OOR}} = \sum_i \exp\Big(\text{dist}(\color{#00a651}{x_i}, \text{land}) - \delta\Big) - 1$$

Soft penalty grows exponentially as <span class="green">sensors</span> drift toward ocean

---

# Scalability Analysis

![width:600px center](assets/images/scalability.png)

- GD-MI runtime **independent of pool size**
- At 20K candidates: GD-MI is **100× faster** than Greedy MI
- Enables continental-scale optimization

---

# More Results: k = 50

![width:700px center](assets/images/quality_50_india.png)

---

# More Results: k = 100

![width:700px center](assets/images/quality_100_india.png)
