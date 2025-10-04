## Appendices

### Terminology

* **Orthogonality:** The design principle where components operate independently with minimal hidden dependencies, allowing them to be composed flexibly.
* **ECS (Entity-Component-System):** A data-oriented architectural pattern separating entities (IDs), components (data), and systems (logic).
* **Zero-Cost Abstraction:** A programming abstraction that does not introduce runtime overhead beyond equivalent handwritten code.
* **Deterministic:** Producing the same results under the same inputs, essential for reproducibility and debugging in simulations.
* **Pipeline:** A sequence of automated steps — at build time or runtime — that transforms inputs (e.g., assets, code) into usable outputs.
* **Build-Time Derivation:** The process of generating configuration, code, or metadata automatically based on the presence and type of source assets.
* **Lifecycle:** The structured series of phases defining how entities, assets, and systems are created, updated, and destroyed.
- **Stage:** A named lifecycle segment (e.g., **Boot**, **Menu**, **Gameplay**, **Paused**, **Shutdown**) with its own asset/policy profile.
* **Component:** A modular, reusable unit of behavior or data that can be attached to entities.
* **Asset:** A source-driven resource managed and versioned under the Asset Workflow, typically derived or generated at build time.
* **Configuration:** The subsystem that manages structured parameters across modules and build stages.
* **Plugin:** A loadable extension that augments or overrides existing engine functionality.
* **Module:** A self-contained package of related code, assets, or configuration participating in the engine’s build and execution processes.
* **Source-Driven Asset Workflow:** The approach where assets originate from source files and are transformed automatically into runtime-ready representations.
* **Asset-As-Logic:** A design principle where **standard, widely used asset formats** (e.g., glTF/USD for scenes, PNG/JPEG/TGA/DDS for textures, WAV/OGG/MP3 for audio, GLSL/WGSL/HLSL for shaders, SVG/Rive/Lottie for UI/animation, BehaviorTree JSON for behavior) carry **game intent** and structure, while engine code acts primarily as **glue** to bind those assets to systems.
* **Schema-Aware Loader:** A deterministic, Serde-compatible transformation that maps **established asset schemas** (e.g., glTF material/animation, Rive/Lottie JSON, behavior-tree JSON) into **strongly typed ECS components**, validated with standard validators. This preserves performance (zero-cost abstractions) and avoids inventing formats.
* **Capability-Scoped Binding:** A controlled interface used to connect **Lua** or **WASM** modules to engine systems. Modules are sandboxed and granted **minimal capabilities** (e.g., time, input events, ECS queries) with stable, testable ABIs, enabling safe hot-reload and predictable behavior.
* **Packfile:** A container bundling many small assets to reduce I/O overhead and improve seek locality.
* **Virtual File System (VFS):** Logical mount layer mapping engine paths to physical sources (dirs, packfiles).
* **Content-Addressable Storage (CAS):** Artifact cache keyed by content hash for reproducible builds.
* **Hot Reload:** Live replacement of code/assets while retaining engine state.
* **Stage Manager:** Engine subsystem that coordinates stage transitions and enforces the deterministic event order for OnExit/OnEnter/Suspend/Resume.
* **Effective Merge Order:** The precedence rule the Configuration System uses to resolve conflicting policy keys (Base → Profile → Platform → Stage → Runtime overlay).

---

### References and Inspirations

YAGE draws conceptual and architectural inspiration from several sources:

* **Rust Ecosystem:** Cargo, crates.io, and Rust’s ownership model form the foundation.
* **Webpack:** Inspiration for YAGE’s modular, configuration-driven engine assembly model.
* **Bevy Engine:** Demonstrates the viability of a Rust ECS engine and motivates further modularity.
* **Godot:** Emphasizes openness and accessibility, showing how community-driven engines can thrive.
* **Unity and Unreal Engine:** Industry standards that highlight both the strengths (rich tooling, ecosystems) and pitfalls (monolithic complexity) YAGE seeks to address.
* **Data-Oriented Design (DOD):** Architectural philosophy informing ECS and memory management strategies.

---

### Further Reading

For contributors and developers wishing to explore underlying concepts:

* **The Rust Book** (official Rust documentation).
* **Entity Component System Pattern** (GDC talks, blog posts).
* **Data-Oriented Design (DOD)** by Richard Fabian and related writings.
* **The Functional Programming Handbook** (general FP patterns in modern languages).
* **CI/CD in Game Development** (DevOps case studies for reproducibility).
