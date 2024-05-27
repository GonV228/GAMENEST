
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/faq.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="accordion">
            <div class="content">
                <div class="label">¿Como comprar en GameNest?</div>
                <div class="answer1">
                    <p>   1. Seleccione un juego</p>
                    <p>   2. Presione el botón de agregar el carrito</p>
                    <p>   3. Dentro del carrito presione "Proceder al pago"</p>
                    <p>   4. Seleccione su método de pago y presione "Pagar"</p>
                    <p>   5. Su juego estará disponible para su descarga</p>

                </div>    
                <div class="label">¿Como puedo realizar un reembolso?</div>
                    <p class="answer"> 
                        Para realizar un reembolso dirijasé al apartado de 'Soporte' y seleccione 'Solicitar reembolso'.
                        Tendrá que rellenar un formulario y pasará a revisión.
                    </p>    
                <div class="label">¿Cuales son sus métodos de pago?</div>
                <div class="answer1">
                    <p>   Tenemos los siguientes métodos de pago:</p>
                    <p>   1. Yape/Plin</p>
                    <p>   2. Pago Efectivo</p>
                    <p>   3. Tarjeta de crédito/débito</p>

                </div>   
                
                <div class="label">¿Cuales son sus métodos de pago?</div>
                <div class="answer1">
                    <p>   Tenemos los siguientes métodos de pago:</p>
                    <p>   1. Yape/Plin</p>
                    <p>   2. Pago Efectivo</p>
                    <p>   3. Tarjeta de crédito/débito</p>

                </div>   
            </div>
            
        </div> 
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const labels = document.querySelectorAll('.label');
                labels.forEach(label => {
                    label.addEventListener('click', function () {
                        const content = this.parentElement;
                        const answer = this.nextElementSibling;
                        //Mostrar la clase activa
                        content.classList.toggle('active');
                        //Ocultar respuestas
                        document.querySelectorAll('.accordion .content').forEach(item => {
                            if (item !== content) {
                                item.classList.remove('active');
                            }
                        });

                        if (content.classList.contains('active')) {
                            answer.classList.add('active');
                        } else {
                            answer.classList.remove('active');
                        }
                    });
                });
            });
        </script>
    </body>
</html>
