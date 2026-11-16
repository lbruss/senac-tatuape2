/* GERADOR DE BANNERS E PRODUTOS */

// Gerador de Banners com 6 paletas e estilos visuais distintos
function gerarBannerSVG(titulo, subtitulo, index){
    const paletasBanner = [
        ['#0f2027', '#203a43', '#2c5364'], //1. Dark Cyab e Navy
        ['#833ab4', '#fd1d1d', '#fcb045'], //2. Sunset Orage e Violet
        ['#11998e', '#38ef7d', '#0575e6'], //3. Tropical Blue
        ['#d31027', '#ea384d', '#7b4397'], //4. Red $ Purple
        ['#000428', '#004e92', '#00c6ff'], //5. Deep Royal Blue
        ['#4568dc', '#b06ab3', '#e84393'], //6. Magenta & Soft Indigo
    ];

    const cores = paletasBanner[index % paletasBanner.length];
    //Permite a escolha das cores o '%' significa operador módulo
    //Permite reutilizar as paletas de forma infinita

    //Criando uma string com múltiplas linhas
    //SVG = É uma linguagem que descreve gráficos vetoriais bidimensionais
    //Cria imagens escaláveis, isto é, que não perdem a qualidade ao serem
    //redimensionadas, ao contrário das imagens JEPG ou PNG
    const svg = `
    <svg xmlns ="http://www.w3.org/2000/svg" width="1200" height="400" viewBox="0 0 1200 400"
    <defs>
        <linearGradient id="bannerGrad-${index}" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" stop-color="${cores[0]}"/>
        <stop offset="50%" stop-color="${cores[1]}"/>
        <stop offset="100%" stop-color="${cores[2]}"/>
        </linearGradient>
        <pattern id="pat-${index}" width="40" height="40" patternUnits="userSpaceOnUse">
            <circle cx="20" cy="20" r="2" fill="white" opacity="0.15"/>
        </pattern>
    </defs>
    <rect width="100%" height="100%" fill="url(#bannerGrad-${index}"/>
    <rect width="100%" height="100%" fill="url(#pat-${index}"/>
    <circle cx="1100" cy="80" r="180" fill="white" opacity="0.05"/>
    <circle cx="1100" cy="320" r="140" fill="white" opacity="0.05"/>
    </svg>`;
    return `data:image/svg+xml;charset=utf-8,${encodeURIComponent}`;
}

//Até aqui criamos um código que cria de forma dinâmica um Banner SVG (imagem de fundo vetorial)
//Gerando um fundo sem precisar usar imagens prontas, tudo desenhado pelo código
//width="1200" height="400" define as dimensões do banner no formato horizontal
//A seção <defs> funciona como uma área de configurações
//Podendo ser reutilizada a qualquer momento
//Neste código criamos cor gradiente em um padrão de bolinhas
//O banner será formado por 4 camadas
//Camada 1 = Gradiente colorido
//Camada 2 = Textura de bolinhas
//Camada 3 = Grande círculo translúcido à direita
//Camada 4 = Grande círculo translúcido à esquerda
//Gerando um banner responsivo

//Gerador de Fotos de Produtos