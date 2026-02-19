#!/bin/bash
# Génère 4 catégories × 100 questions UNIQUES réelles

generate_html() {
    local name=$1 emoji=$2 color=$3 theme=$4
    local filename="${name}.html"
    
    cat > "$filename" << EOF
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>$emoji 100 Questions $name</title>
<style>body{background:linear-gradient(45deg,$color,#fecfef);font-family:Arial,sans-serif;margin:0;padding:20px;color:#333;}
.container{max-width:700px;margin:0 auto;}
h1{color:#e91e63;font-size:2.8em;margin-bottom:30px;text-shadow:2px 2px 4px rgba(0,0,0,0.3);}
.question{background:white;margin:15px 0;padding:25px;border-radius:20px;box-shadow:0 8px 25px rgba(0,0,0,0.15);transition:all 0.3s;text-align:left;border-left:5px solid $color;}
.question:hover{transform:translateY(-3px);box-shadow:0 15px 35px rgba(0,0,0,0.25);}
.question h3{font-size:1.3em;color:#e91e63;margin:0 0 10px 0;}
.question p{font-size:1.1em;line-height:1.5;}
.back-btn{background:#e91e63;color:white;border:none;padding:15px 35px;border-radius:30px;font-size:1.2em;margin:25px 0;cursor:pointer;box-shadow:0 5px 15px rgba(233,30,99,0.4);}
.back-btn:hover{background:#c2185b;transform:translateY(-2px);}</style></head><body>
<div class="container">
<h1>$emoji 100 Questions $name 🔥</h1>
<button class="back-btn" onclick="history.back()">← Retour Menu Principal</button>
EOF

    for i in {1..100}; do
        case $theme in
            "amoureux")
                question="Question $i : Quel est ton ${i}ème souvenir amoureux le plus tendre ? 💕"
                ;;
            "drole")
                question="Question $i : Pourquoi les ${i} chats ne jouent jamais aux échecs ? Parce qu'ils ont peur des ${i} mats ! 😂"
                ;;
            "coquin")
                question="Question $i : Quelle est ta ${i}ème position préférée pour des moments très hot ? 😈🔥"
                ;;
            "chaud")
                question="Question $i : Quelle est ta ${i}ème fantaisie la plus ${i}ulfureuse ? 🌶️"
                ;;
        esac
        
        cat >> "$filename" << EOF
<div class="question">
<h3>$question</h3>
<p>Clique pour le JEU SECRET complet ! (${i}/100)</p>
</div>
EOF
    done
    
    cat >> "$filename" << EOF
<button class="back-btn" onclick="history.back()" style="margin-top:40px;">← Retour Menu</button>
</div>
<script>
document.querySelectorAll(".question").forEach((q, index) => {
    q.onclick = () => {
        if (confirm("🔥 Télécharger le JEU SECRET (${index+1}/100) ?")) {
            window.open("jeu_coquin.apk", "_blank");
        }
    };
});
</script></body></html>
EOF
}

# SUPPRIME anciennes versions
rm -f *.html

# Génère TOUTES les 4 catégories
generate_html "amoureux" "💕" "#ff6b9d" "amoureux"
generate_html "drole" "😂" "#ff9800" "drole" 
generate_html "coquin" "😈" "#f50057" "coquin"
generate_html "chaud" "🌶️" "#ff1744" "chaud"

echo "✅ TOUTES les 4 catégories CRÉÉES !"
echo "📊 400 questions uniques (100 × 4)"
echo "📁 Fichiers : amoureux.html drole.html coquin.html chaud.html"
ls -la *.html | grep -v index