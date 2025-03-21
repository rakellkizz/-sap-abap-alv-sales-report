SAP ABAP ALV Sales Report

Um relatório ALV para análise de vendas no SAP, permitindo filtros dinâmicos, exportação de dados e layout customizável.
## 
📌 Detalhes do Projeto
- 🔹 **Tecnologia**	
- 🔹 **Tipo**	
- 🔹**Objetivo**

ABAP	Relatório ALV (Grid Display)	Fornecer uma visão detalhada das vendas para tomada de decisão
## 
🚀 Recursos do Relatório

- ✔️ **Geração de relatório ALV estruturado**  
- ✔️ **Filtros dinâmicos para segmentação de vendas**  
- ✔️ **Exportação para Excel e outros formatos**  
- ✔️ **Totais e subtotais automáticos por categoria**  
- ✔️ **Layout personalizável no SAP GUI**  

🎯 **Demonstração do Relatório**

🔹 **Tela Inicial (Filtros de Seleção)**
O usuário pode inserir filtros como data, cliente e status da venda antes de gerar o relatório.


🔹 **Saída do Relatório (ALV Grid Display)**
Após a execução, os dados são exibidos de forma estruturada no ALV Grid.


🔹 **Exportação para Excel**
Os usuários podem exportar os dados para análise externa diretamente pelo ALV.

🛠 Instalação e Configuração

1️⃣ **Criar o Programa ABAP**
Acesse a transação SE38 no SAP.
Crie um novo programa chamado Z_ALV_SALES_REPORT.
Copie e cole o código do arquivo Z_ALV_SALES_REPORT.abap.
Salve e ative o programa.

2️⃣ **Executar o Relatório**
Acesse a transação SE38 e execute Z_ALV_SALES_REPORT.
Preencha os filtros desejados.
Clique em Executar (F8) para visualizar o relatório ALV
.
📜 Código ABAP (Trecho Principal)
abap
Copiar
Editar
DATA: gt_sales TYPE TABLE OF zsales_data,
      wa_sales TYPE zsales_data.

SELECT * FROM zsales_data INTO TABLE gt_sales.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program = sy-repid
  TABLES
    t_outtab          = gt_sales.
🔹 Código completo: Acesse aqui.

📢 Feedback e Contribuições
💡 Tem sugestões para melhorar o projeto?
📢 Abra uma Issue ou contribua com um Pull Request!

📬 Contato: [Seu e-mail ou LinkedIn]

📌 Licença
Este projeto é open source sob a licença MIT.

🚀 Gostou do projeto?
Deixe um ⭐ no repositório!
Gratidão!!!

