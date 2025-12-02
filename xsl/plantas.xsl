<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Módulo: Lenguaje de marcas y Sistemas de gestión de la información
    Tarea: LMSGI04 Tarea evaluativa 2. XSLT
    UD: UD04 Transformación de datos
    Descripción: Transformación XSLT para mostrar las plantas del jardín botánico
    Autor: Nasreddin Oufallah
    Fecha: Noviembre 2025
    Url Github : https://noufallah.github.io/oufallah_nasreddin_LMSGI04_TareaEvaluativa02/
-->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Configuración de salida HTML -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- Plantilla principal que genera la estructura HTML -->
    <xsl:template match="/">
        <html lang="es">

            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>Plantas - Jardín Botánico</title>
            </head>

            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="../xml/zonas.xml">Zonas</a>
                    <a href="../xml/plantas.xml">Plantas</a>
                    <a href="../xml/actividades.xml">Actividades</a>
                </header>

                <main id="jardinbotanico">
                    <!-- Aplicar plantilla por cada elemento <planta> del XML -->
                    <h1>PLANTAS</h1>
                    <xsl:apply-templates select="jardinBotanico/plantas/planta"/>

                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>

    </xsl:template>

    <!-- Plantilla que se aplica a cada elemento <planta> -->
    <xsl:template match ="planta">

        <article class="articulo">
            <!-- Imagen de la planta  -->
            <img class="imagen" src="../img/{@foto}" alt="{nombreComun}"/>
            <!-- Si es luminosidad es Alta -->
            <xsl:if test="luminosidad = 'Alta'">
                <img src="../img/Alta.png" class="alta-icono" alt="Luminosidad alta"/>

            </xsl:if>
            <!-- Nombre común con enlace a Wikipedia -->
            <h2>
                <a href="https://es.wikipedia.org/wiki/{@familia}" target="_blank">
                    <xsl:value-of select="nombreComun"/>
                </a>
            </h2>
            <!-- Mostrar el nivel de luminosidad -->
            <h3>
                <xsl:value-of select="luminosidad"/>
            </h3>

        </article>

    </xsl:template>


</xsl:stylesheet>