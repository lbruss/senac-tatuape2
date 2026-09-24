//Declarando a função
function VerificaForm(frm){
    if(frm.nome.value===''){
        alert('Campo obrigatório');
        frm.nome.focus();
        return false;

        /*
        A função recebe como parâmetro frm, que representa
        o formulário.
        Usamos o if para garantir que o campo está vazio ou icorreto
        Se o campo não estiver válido:
        Mostra uma mensagem de alerta (alert)
        Coloca o cursor no campo com .focus()
        retorna false, impedindo o envio do formulário
        Se tudo estiver correto, retorna true e o formulário será enviado
        */
    }
    if(frm.email.value===''){
        alert('Campo obrigatório');
        frm.email.focus();
        return false;
    }
    if(frm.fone.value===''){
        alert('Campo obrigatório');
        frm.fone.focus();
        return false;
    }
    if(frm.sexo[0].checked==false && frm.sexo[1].checked==false){
        //Verifica se nenhum dos botões de opção (Masc e Fem) foi selecionado
    alert('Selecione o sexo');
    return false;
    }
    if(frm.soft1.checked==false && frm.soft2.checked==false && frm.soft3.checked==false){
        alert('Selecione pelo menos um software');
        return false;
    }
    if(frm.navegador.value=='Selecione'){
        alert('Selecione um navegador');
        frm.navegador.focus();
        return false;
    }
    if(frm.comentario.value==''){
        alert('Campo obrigatório');
        frm.comentario.focus();
        return false;
    }
    return true;
}