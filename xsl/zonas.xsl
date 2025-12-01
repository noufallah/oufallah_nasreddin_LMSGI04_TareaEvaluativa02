<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Módulo: Lenguaje de Marcas y Sistemas de Gestión de la Información
    Tarea: LMSGI04 Tarea evaluativa 2. XSLT
    UD: UD04 Transformación de datos
    Autor: Nasreddin Oufallah
    Fecha: 29/11/2025
	Url Github :
    
    Descripción: Transformación XSLT para mostrar las zonas del jardín botánico
    que abren antes o a las 10:00, marcando en azul las ubicaciones exteriores.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Configuración de salida HTML5 -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
                <meta charset="utf-8"/>
                <meta name="description" content="Zonas del Jardín Botánico"/>
                <title>Zonas - Jardín Botánico</title>
            </head>

            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Logotipo"/>
                    <a href="zonas.html">Zonas</a>
                    <a href="plantas.html">Plantas</a>
                    <a href="actividades.html">Actividades</a>
                </header>

                <main>
                    <h1>ZONAS</h1>
                    <table>
                        <tr>
                            <th>ZONA</th>
                            <th>Ubicación</th>
                            <th>Horario</th>
                        </tr>
                        <!-- Filtrar zonas que abren antes o a las 10:00 -->
                        <xsl:for-each select="jardinBotanico/zonas/zona">
                            <tr>
                                <td>
                                    <xsl:value-of select="nombre"/>
                                </td>
                                <!-- Ubicación con clase azul si contiene "Exterior" -->
                                <td>
									<xsl:choose>
										<xsl:when test="contains(ubicacion, 'Exterior')">
											<span class="azul"><xsl:value-of select="ubicacion"/></span>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="ubicacion"/>
										</xsl:otherwise>
									</xsl:choose>

                                </td>
                                <!-- Horario -->
                                <td>
                                    <xsl:value-of select="horarioapertura"/> - <xsl:value-of select="horariocierre"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>