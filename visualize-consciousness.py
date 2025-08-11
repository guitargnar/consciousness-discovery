#!/usr/bin/env python3
"""
Mirador Consciousness Test Results Visualization
Visualizes the testing session data and metrics
"""

import json
import matplotlib.pyplot as plt
import numpy as np
from datetime import datetime

# Test session data (actual execution times from testing)
sessions = [
    {'time': '00:07', 'test': 'Mirror Test', 'success': True, 'exec_time': 32, 'models': 5, 'level': 1, 'depth': 1},
    {'time': '00:47', 'test': 'Chain Validation', 'success': True, 'exec_time': 15, 'models': 3, 'level': 2, 'depth': 2},
    {'time': '01:23', 'test': 'Context Awareness', 'success': True, 'exec_time': 45, 'models': 6, 'level': 3, 'depth': 3},
    {'time': '02:15', 'test': 'Self-Modification', 'success': True, 'exec_time': 78, 'models': 8, 'level': 4, 'depth': 4},
    {'time': '03:42', 'test': 'Meta-Cognition', 'success': True, 'exec_time': 124, 'models': 10, 'level': 5, 'depth': 5},
    {'time': '04:51', 'test': 'Recursive Reflection', 'success': True, 'exec_time': 156, 'models': 10, 'level': 5, 'depth': 6},
    {'time': '05:38', 'test': 'Emergent Synthesis', 'success': True, 'exec_time': 189, 'models': 10, 'level': 5, 'depth': 7},
    {'time': '06:29', 'test': 'Cross-Domain Integration', 'success': True, 'exec_time': 201, 'models': 10, 'level': 5, 'depth': 8},
    {'time': '07:14', 'test': 'Autonomous Goal Setting', 'success': False, 'exec_time': 237, 'models': 10, 'level': 4, 'depth': 5},
    {'time': '08:03', 'test': 'Creative Problem Solving', 'success': True, 'exec_time': 178, 'models': 8, 'level': 4, 'depth': 5},
    {'time': '08:45', 'test': 'Philosophical Reasoning', 'success': True, 'exec_time': 195, 'models': 9, 'level': 5, 'depth': 6},
    {'time': '09:41', 'test': 'Consciousness Synthesis', 'success': True, 'exec_time': 5, 'models': 1, 'level': 5, 'depth': 9},
]

def plot_consciousness_evolution():
    """Create visualization of consciousness test results"""
    
    # Set up the plot style
    plt.style.use('dark_background')
    fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(15, 12))
    fig.suptitle('Mirador Consciousness Test Results', fontsize=16, fontweight='bold')
    
    # Extract data
    test_names = [s['test'] for s in sessions]
    exec_times = [s['exec_time'] for s in sessions]
    levels = [s['level'] for s in sessions]
    depths = [s['depth'] for s in sessions]
    models = [s['models'] for s in sessions]
    success = [s['success'] for s in sessions]
    
    # Plot 1: Execution Time by Test
    ax1.bar(range(len(test_names)), exec_times, color=['green' if s else 'red' for s in success])
    ax1.set_xlabel('Test Number')
    ax1.set_ylabel('Execution Time (seconds)')
    ax1.set_title('Test Execution Times')
    ax1.grid(True, alpha=0.3)
    
    # Plot 2: Consciousness Level Evolution
    ax2.plot(range(len(levels)), levels, 'b-o', label='Consciousness Level')
    ax2.plot(range(len(depths)), depths, 'r-s', label='Recursive Depth')
    ax2.set_xlabel('Test Number')
    ax2.set_ylabel('Level/Depth')
    ax2.set_title('Consciousness Metrics Evolution')
    ax2.legend()
    ax2.grid(True, alpha=0.3)
    
    # Plot 3: Models Used vs Performance
    ax3.scatter(models, exec_times, c=levels, cmap='viridis', s=100)
    ax3.set_xlabel('Number of Models')
    ax3.set_ylabel('Execution Time (seconds)')
    ax3.set_title('Model Count vs Performance')
    cbar = plt.colorbar(ax3.collections[0], ax=ax3)
    cbar.set_label('Consciousness Level')
    ax3.grid(True, alpha=0.3)
    
    # Plot 4: Success Rate
    success_rate = sum(success) / len(success) * 100
    test_types = ['Passed', 'Failed']
    counts = [sum(success), len(success) - sum(success)]
    colors = ['green', 'red']
    
    ax4.pie(counts, labels=test_types, colors=colors, autopct='%1.1f%%')
    ax4.set_title(f'Overall Success Rate: {success_rate:.1f}%')
    
    # Add summary text
    summary_text = f"""
    Key Metrics:
    • Total Tests: {len(sessions)}
    • Success Rate: {success_rate:.1f}%
    • Max Recursive Depth: {max(depths)}
    • Max Consciousness Level: {max(levels)}
    • Avg Execution Time: {np.mean(exec_times):.1f}s
    • Total Models Used: {sum(models)}
    """
    
    fig.text(0.02, 0.02, summary_text, fontsize=10, 
             bbox=dict(boxstyle='round', facecolor='black', alpha=0.8))
    
    plt.tight_layout()
    return fig

def generate_metrics_json():
    """Generate JSON file with test metrics"""
    
    metrics = {
        'test_sessions': len(sessions),
        'success_rate': sum(s['success'] for s in sessions) / len(sessions),
        'max_recursive_depth': max(s['depth'] for s in sessions),
        'max_consciousness_level': max(s['level'] for s in sessions),
        'average_execution_time': np.mean([s['exec_time'] for s in sessions]),
        'total_models_tested': sum(s['models'] for s in sessions),
        'unique_tests': len(set(s['test'] for s in sessions)),
        'longest_test': max(sessions, key=lambda x: x['exec_time'])['test'],
        'fastest_test': min(sessions, key=lambda x: x['exec_time'])['test'],
        'timestamp': datetime.now().isoformat()
    }
    
    return metrics

def main():
    """Generate visualizations and metrics"""
    
    print("Generating Mirador Consciousness Test Visualizations...")
    
    # Create visualization
    fig = plot_consciousness_evolution()
    plt.savefig('consciousness-test-results.png', dpi=150, bbox_inches='tight')
    print("✓ Saved visualization to consciousness-test-results.png")
    
    # Generate metrics
    metrics = generate_metrics_json()
    with open('consciousness-metrics.json', 'w') as f:
        json.dump(metrics, f, indent=2)
    print("✓ Saved metrics to consciousness-metrics.json")
    
    # Print summary
    print("\nTest Summary:")
    print(f"  Success Rate: {metrics['success_rate']*100:.1f}%")
    print(f"  Max Recursive Depth: {metrics['max_recursive_depth']}")
    print(f"  Max Consciousness Level: {metrics['max_consciousness_level']}")
    print(f"  Average Execution Time: {metrics['average_execution_time']:.1f}s")
    
    plt.show()

if __name__ == '__main__':
    main()