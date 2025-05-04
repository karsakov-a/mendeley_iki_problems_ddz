<?xml version="1.0" encoding="utf-8"?>
<style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" default-locale="ru-RU">
  <info>
    <title>Russian GOST R 7.0.5-2008 (Ру́сский) - A A</title>
    <id>http://csl.mendeley.com/styles/735553421/gost-r-7-0-5-2008</id>
    <link href="http://www.zotero.org/styles/gost-r-7-0-5-2008" rel="self"/>
    <link href="http://chetvericov.ru/stil-oformleniya-dlya-mendeley-i-zotero-csl-po-gost-r-705-2008/" rel="documentation"/>
    <link href="http://protect.gost.ru/document.aspx?control=7&amp;id=173511" rel="documentation"/>
    <author>
      <name>Andrey Chetverikov</name>
      <email>andrey@chetvericov.ru</email>
      <uri>http://chetvericov.ru</uri>
    </author>
    <contributor>
      <name>A A</name>
      <uri></uri>
    </contributor>
    <category citation-format="author-date"/>
    <category field="generic-base"/>
    <summary>Russian GOST-2008 style.</summary>
    <updated>2025-04-24T14:01:22+00:00</updated>
    <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
  </info>

  <macro name="editor">
    <names variable="editor" prefix="/ под ред. " delimiter=", " suffix=".">
      <name initialize-with=". " delimiter=", " delimiter-precedes-last="always"/>
    </names>
  </macro>

  <macro name="author">
    <names variable="author">
      <name name-as-sort-order="all" sort-separator=" " initialize-with=". " delimiter=", " delimiter-precedes-last="always" font-style="italic"/>
      <label form="short" prefix=" " text-case="lowercase"/>
    </names>
  </macro>

  <macro name="author_short">
    <names variable="author">
      <name form="short" name-as-sort-order="all" sort-separator=" " delimiter=", " delimiter-precedes-last="always"/>
      <substitute>
        <text variable="title"/>
      </substitute>
    </names>
  </macro>

  <macro name="access">
    <choose>
      <if variable="URL">
        <text value="[Электронный ресурс]. "/>
        <text variable="URL" prefix="URL: "/>
        <group prefix=" (" suffix=")">
          <text term="accessed" suffix=": "/>
          <date variable="accessed">
            <date-part name="day" suffix="." form="numeric-leading-zeros"/>
            <date-part name="month" suffix="." form="numeric-leading-zeros"/>
            <date-part name="year"/>
          </date>
        </group>
      </if>
    </choose>
  </macro>

  <macro name="title">
    <text variable="title"/>
  </macro>

  <macro name="publisher">
    <group>
      <text variable="publisher-place"/>
      <text value=": "/>
      <text variable="publisher"/>
    </group>
    <text macro="year-date" suffix="." prefix=", "/>
    <text variable="edition" prefix="Вып. "/>
  </macro>

  <macro name="year-date">
    <date variable="issued">
      <date-part name="year"/>
    </date>
  </macro>

  <macro name="language-sort">
    <text variable="note"/>
    <text value="Z999"/>
  </macro>

  <macro name="citation-number">
    <text variable="citation-number" suffix=". "/>
  </macro>

  <macro name="doi">
    <choose>
      <if variable="DOI">
        <text variable="DOI" prefix="DOI: "/>
      </if>
    </choose>
  </macro>

  <citation disambiguate-add-year-suffix="true">
    <sort>
      <key macro="language-sort"/>
      <key macro="author"/>
      <key variable="issued"/>
    </sort>
    <layout prefix="(" suffix=")" delimiter="; ">
      <names variable="author">
        <name form="long" suffix=" "/>
        <substitute>
          <text value="и др."/>
        </substitute>
      </names>
      <text macro="year-date"/>
    </layout>
  </citation>

  <locale xml:lang="en">
    <terms>
      <term name="et-al">и др.</term>
      <term name="editor" form="verb">под ред.</term>
      <term name="accessed">дата обращения</term>
    </terms>
  </locale>

  <locale xml:lang="ru">
    <terms>
      <term name="et-al">и др.</term>
      <term name="editor" form="verb">под ред.</term>
      <term name="accessed">дата обращения</term>
    </terms>
  </locale>

  <bibliography>
    <sort>
      <key macro="language-sort"/>
      <key macro="author"/>
      <key variable="issued"/>
    </sort>
    <layout suffix=".">
      <text macro="citation-number"/>
      <names variable="author" font-style="italic" delimiter=", ">
        <name form="long" sort-separator=" " suffix=". "/>
        <substitute>
          <text value="и др."/>
        </substitute>
      </names>
      <choose>
        <if type="book">
          <group delimiter=". ">
            <text macro="title"/>
            <text macro="editor"/>
            <text macro="publisher"/>
            <text variable="number-of-pages" suffix=" с."/>
            <text macro="doi"/>
          </group>
        </if>
        <else-if type="chapter paper-conference">
          <group delimiter=". ">
            <text macro="title"/>
            <text variable="container-title" prefix="// "/>
            <text macro="publisher"/>
            <text variable="volume" prefix="Т. "/>
            <text variable="issue" prefix="№ "/>
            <text variable="page" prefix="С. "/>
          </group>
        </else-if>
        <else-if type="article-journal">
          <group delimiter=". ">
            <text macro="title"/>
            <text variable="container-title" prefix="// "/>
            <text macro="year-date"/>
            <text variable="volume" prefix="Т. "/>
            <text variable="issue" prefix="№ "/>
            <text variable="page" prefix="С. "/>
            <text macro="doi"/>
          </group>
        </else-if>
        <else-if type="webpage">
          <group delimiter=". ">
            <text macro="title"/>
            <text macro="access"/>
          </group>
        </else-if>
      </choose>
    </layout>
  </bibliography>
</style>