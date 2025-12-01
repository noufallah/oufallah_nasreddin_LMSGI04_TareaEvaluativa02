<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Módulo: Lenguaje de marcas y Sistemas de gestión de la información
    Tarea: LMSGI04 Tarea evaluativa 2. XSLT
    UD: UD04 Transformación de datos
    Autor: Nasreddin Oufallah
    Url Github :
    Descripción: Transformación XSLT para mostrar actividades del jardín botánico
    Características:
    - Usa variable para filtrar mes
    - Ordena por fecha
    - Solo usa plantillas (no for-each)
    - Muestra contador de responsables
-->



<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:variable name="mesFiltro" select="'11'" />
    <xsl:template match="/">
        <html lang="es">

            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>Actividades - Jardín Botánico</title>
            </head>

            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
					<a href="../xml/zonas.xml">Zonas</a>
					<a href="../xml/plantas.xml">Plantas</a>
					<a href="../xml/actividades.xml">Actividades</a>
                </header>

                <main>
                    <!-- Filtrar actividades del mes y ordenar por fecha -->
                    <xsl:apply-templates select="jardinBotanico/actividades/actividad[substring(fechaHora, 6, 2) = $mesFiltro]">
                        <xsl:sort select="fechaHora" order="ascending"/>
                    </xsl:apply-templates>
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>

    </xsl:template>

    <!-- Plantilla para cada actividad -->
    <xsl:template match="actividad">
        <article class="actividades">
            <h4>
                <xsl:value-of select="titulo"/>
 -
                <xsl:value-of select="count(responsables/responsable)"/>
 Responsable<xsl:if test="count(responsables/responsable) > 1">s</xsl:if>
            </h4>
            <h2>Fecha: <xsl:value-of select="substring(fechaHora, 1, 10)"/>
            </h2>
            <h2>Hora: <xsl:value-of select="substring(fechaHora, 12, 5)"/>
            </h2>
            <h2>Lugar: <xsl:value-of select="@sala"/>
            </h2>
            <ul>
                <xsl:apply-templates select="responsables/responsable"/>
            </ul>
        </article>

    </xsl:template>

    <!-- Plantilla para cada responsable -->
    <xsl:template match="responsable">
        <li>
            <xsl:value-of select="nomresponsable"/>
 -            <xsl:value-of select="email"/>
        </li>
    </xsl:template>
</xsl:stylesheet>