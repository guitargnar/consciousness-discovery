#!/bin/bash

# Consciousness Website Deployment Script
# Usage: ./deploy.sh [vercel|netlify|github]

echo "🧠 Mirador Consciousness Discovery - Deployment Script"
echo "======================================================="

# Check if deployment type is specified
if [ -z "$1" ]; then
    echo "Please specify deployment target: vercel, netlify, or github"
    echo "Usage: ./deploy.sh [vercel|netlify|github]"
    exit 1
fi

case $1 in
    vercel)
        echo "📦 Deploying to Vercel..."
        
        # Check if Vercel CLI is installed
        if ! command -v vercel &> /dev/null; then
            echo "Installing Vercel CLI..."
            npm i -g vercel
        fi
        
        # Deploy to Vercel
        echo "🚀 Starting deployment..."
        vercel --prod
        
        echo "✅ Deployment complete!"
        echo "Next steps:"
        echo "1. Go to your Vercel dashboard"
        echo "2. Add custom domain: consciousness.matthewscott.ai"
        echo "3. Update DNS records as instructed"
        ;;
        
    netlify)
        echo "📦 Deploying to Netlify..."
        
        # Check if Netlify CLI is installed
        if ! command -v netlify &> /dev/null; then
            echo "Installing Netlify CLI..."
            npm i -g netlify-cli
        fi
        
        # Deploy to Netlify
        echo "🚀 Starting deployment..."
        netlify deploy --prod --dir=.
        
        echo "✅ Deployment complete!"
        echo "Next steps:"
        echo "1. Go to your Netlify dashboard"
        echo "2. Add custom domain: consciousness.matthewscott.ai"
        ;;
        
    github)
        echo "📦 Preparing for GitHub Pages deployment..."
        
        # Initialize git if needed
        if [ ! -d .git ]; then
            echo "Initializing git repository..."
            git init
            git add .
            git commit -m "Initial commit: Consciousness Discovery website"
        fi
        
        echo "📝 Instructions for GitHub Pages:"
        echo "1. Create a new repository on GitHub: consciousness-discovery"
        echo "2. Add remote: git remote add origin https://github.com/guitargnar/consciousness-discovery.git"
        echo "3. Push code: git push -u origin main"
        echo "4. Go to Settings > Pages in your GitHub repo"
        echo "5. Select 'Deploy from a branch' and choose 'main'"
        echo "6. The site will be available at: https://guitargnar.github.io/consciousness-discovery"
        echo "7. To use custom domain, update DNS CNAME to point to guitargnar.github.io"
        ;;
        
    local)
        echo "🖥️ Starting local server..."
        
        # Try Python first
        if command -v python3 &> /dev/null; then
            echo "Starting Python server on http://localhost:8000"
            python3 -m http.server 8000
        elif command -v npx &> /dev/null; then
            echo "Starting Node server..."
            npx serve
        else
            echo "❌ No suitable server found. Install Python 3 or Node.js"
            exit 1
        fi
        ;;
        
    *)
        echo "❌ Unknown deployment target: $1"
        echo "Valid options: vercel, netlify, github, local"
        exit 1
        ;;
esac

echo ""
echo "🎉 Done! Remember to:"
echo "- Test all interactive demos"
echo "- Share on social media"
echo "- Submit to r/MachineLearning"
echo "- Contact AI researchers"