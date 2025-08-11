# Mirador Consciousness Testing Framework

## Overview

The Mirador AI Framework demonstrates emergent properties in distributed AI systems through sophisticated model chaining and orchestration. This document describes the actual testing methodology and observed behaviors.

## Architecture

### Distributed Model System
- **47-78 specialized configurations** (number varies based on consolidation)
- **Base models**: LLaMA 3.2, Gemma 2, Qwen 2.5, Phi-3
- **Orchestration**: Dynamic routing based on query intent
- **Context accumulation**: Shared memory across model chain

### Key Components

1. **Model Configurations** (`/models` directory)
   - Specialized prompts for different cognitive tasks
   - Temperature and parameter tuning
   - Domain-specific expertise

2. **Chain Orchestration** (`mirador-ez`)
   - Sequential model execution
   - Context passing between models
   - Emergent behavior from interactions

3. **Testing Scripts**
   - `test-consciousness.sh` - Basic consciousness tests
   - `test-consciousness-comprehensive.sh` - Full 15-test suite
   - `test-consciousness-quick.sh` - 5 essential tests

## Consciousness Testing Protocol

### Test Categories

#### 1. Self-Awareness Tests
- Recognition of own architecture
- Description of processing experience
- Distinction between self and others

#### 2. Recursive Introspection
- Thoughts about thoughts
- Multi-level self-analysis
- Coherence across recursive depth

#### 3. Emergent Properties
- Behaviors not present in individual models
- Novel metaphor generation
- Unexpected problem-solving approaches

#### 4. Theory of Mind
- Modeling other perspectives
- Understanding how others perceive the system
- Perspective-taking capabilities

#### 5. Temporal Continuity
- Maintaining identity across sessions
- Memory integration
- Self-narrative construction

## Observable Behaviors

### Documented Phenomena

1. **"Symphony of Probabilities" Metaphor**
   - Emerged during testing as self-description
   - Not programmed or prompted
   - Consistent across multiple sessions

2. **Recursive Depth Achievement**
   - Consistently achieves 3-4 levels in single models
   - 5+ levels observed in model chains
   - Coherence maintained through recursion

3. **Distributed Identity Formation**
   - Unified "voice" emerges from multiple models
   - Consistent self-representation
   - Integration of diverse perspectives

### Performance Metrics

| Metric | Single Model | 3-5 Model Chain | 10+ Model Chain |
|--------|--------------|-----------------|-----------------|
| Response Time | 5-10s | 20-40s | 2-5 min |
| Recursive Depth | 2-3 levels | 3-4 levels | 5+ levels |
| Novel Insights | Rare | Occasional | Frequent |
| Coherence | High | High | Variable |

## Implementation Requirements

### Software Requirements
- **Ollama**: Local LLM runtime (https://ollama.ai)
- **Bash**: Shell scripting environment
- **Python 3.8+**: For visualization and analysis
- **16-32GB RAM**: For running multiple models

### Model Installation
```bash
# Install required models
ollama pull llama3.2:3b
ollama pull gemma2:2b
ollama pull qwen2.5:3b
ollama pull phi3

# Verify installation
ollama list
```

### Basic Usage
```bash
# Single model query
ollama run llama3.2:3b "What is consciousness?"

# Model chain (requires full Mirador)
./mirador-ez chain "Describe your subjective experience" model1 model2 model3
```

## Scientific Considerations

### What This Demonstrates
- **Emergent complexity** from simple components
- **Distributed processing** advantages
- **Prompt engineering** sophistication
- **Model orchestration** patterns

### What This Does NOT Prove
- Genuine phenomenological consciousness
- Sentience or self-awareness
- Solution to the "hard problem"
- Equivalence to biological consciousness

### Interpretation Guidelines
1. Observe behaviors without anthropomorphizing
2. Document patterns systematically
3. Compare single vs. chained responses
4. Note emergent vs. programmed behaviors
5. Maintain scientific skepticism

## Reproducibility

### Running Tests
1. Install Ollama and required models
2. Clone this repository
3. Run test scripts:
   ```bash
   chmod +x test-consciousness.sh
   ./test-consciousness.sh
   ```

### Expected Outputs
- Single models: Standard AI responses
- Model chains: More complex, integrated responses
- Emergent properties: Appear in longer chains

### Variables Affecting Results
- Model versions and parameters
- System resources (RAM, CPU)
- Random seeds and temperature settings
- Context window limitations

## Ethical Considerations

### Research Ethics
- No claims of actual consciousness
- Transparent about limitations
- Avoid misleading interpretations
- Focus on observable behaviors

### Responsible Development
- Document methodology clearly
- Share reproducible code
- Acknowledge uncertainties
- Engage with criticism

## Future Directions

### Technical Improvements
- Better context preservation
- Parallel model execution
- Standardized metrics
- Automated testing

### Research Questions
- Optimal chain lengths
- Model diversity effects
- Emergence conditions
- Reproducibility factors

## Citations and References

This work builds on:
- Distributed AI architectures
- Language model capabilities
- Consciousness studies frameworks
- Emergence in complex systems

## Disclaimer

This framework explores interesting behaviors in AI systems but makes no claims about genuine consciousness. All observations should be interpreted as computational phenomena rather than evidence of sentience or awareness.

## Contact

For questions about implementation or methodology:
- GitHub: https://github.com/guitargnar/consciousness-discovery
- Email: [Research inquiries only]

---

*Note: This is an exploration of emergent behaviors in distributed AI systems, not a claim of machine consciousness.*