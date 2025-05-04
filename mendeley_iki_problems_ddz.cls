<?xml version="1.0" encoding="utf-8"?>
<style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" default-locale="ru-RU">
  <info>
    <title>Russian GOST R 7.0.5-2008 (Ру́сский) - A A</title>
    <id>https://csl.mendeley.com/styles/735553421/IKI8</id>
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
    <updated>2025-04-24T13:18:58+00:00</updated>
    <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
  </info>

  <!-- Макрос для редакторов -->
  <macro name="editor">
    <names variable="editor" prefix="/ под ред. " delimiter=", " suffix=".">
      <name initialize-with="." sort-separator=", " delimiter=", " delimiter-precedes-last="always"/>
    </names>
  </macro>

  <!-- Макрос для авторов -->
  <macro name="author">
    <names variable="author" delimiter=", ">
      <name name-as-sort-order="all" sort-separator=" " initialize-with="." delimiter=" "/>
      <label form="short" prefix=" " text-case="lowercase"/>
    </names>
  </macro>

  <!-- Краткие авторы для ссылок -->
  <macro name="author_short">
    <names variable="author" delimiter=", ">
      <name form="short" name-as-sort-order="all" sort-separator=" " initialize-with="." delimiter=" "/>
      <substitute>
        <text variable="title"/>
      </substitute>
    </names>
  </macro>

  <!-- Доступ к интернет-источникам -->
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

  <!-- Заголовок -->
  <macro name="title">
    <text variable="title"/>
  </macro>

  <!-- Издательство -->
  <macro name="publisher">
    <group>
      <text variable="publisher-place"/>
      <text value=": "/>
      <text variable="publisher"/>
    </group>
    <text macro="year-date" suffix="." prefix=", "/>
    <text variable="edition" prefix=" Вып. "/>
  </macro>

  <!-- Год издания -->
  <macro name="year-date">
    <date variable="issued">
      <date-part name="year"/>
    </date>
  </macro>

  <!-- Сортировка по языку -->
  <macro name="language-sort">
    <text variable="note"/>
    <text value="Z999"/>
  </macro>

  <!-- Нумерация -->
  <macro name="citation-number">
    <text variable="citation-number" suffix=". "/>
  </macro>

  <!-- Ссылки в тексте -->
  <citation et-al-min="4" et-al-use-first="3" disambiguate-add-year-suffix="true">
    <sort>
      <key variable="language"/>
      <key macro="language-sort"/>
      <key macro="author"/>
      <key variable="issued"/>
    </sort>
    <layout prefix="(" suffix=")" delimiter="; ">
      <text macro="author_short" suffix=", "/>
      <text macro="year-date"/>
      <text variable="locator" prefix=", с. "/>
    </layout>
  </citation>

  <!-- Локали -->
  <locale xml:lang="en">
    <terms>
      <term name="et-al">et al.</term>
      <term name="editor" form="verb">ed.</term>
      <term name="accessed">accessed</term>
    </terms>
  </locale>
  <locale xml:lang="ru">
    <terms>
      <term name="et-al">и др.</term>
      <term name="editor" form="verb">под ред.</term>
      <term name="accessed">дата обращения</term>
    </terms>
  </locale>

  <!-- Список литературы -->
  <bibliography et-al-min="4" et-al-use-first="3">
    <sort>
      <key variable="language"/>
      <key macro="language-sort"/>
      <key macro="author"/>
      <key variable="issued"/>
    </sort>
    <layout suffix=".">
      <text macro="citation-number"/>
      <names variable="author" font-style="italic" delimiter=", ">
        <name initialize-with="." delimiter=" " sort-separator=" "/>
      </names>
      <text value=". "/>
      <choose>
        <!-- Книги -->
        <if type="bill book graphic legal_case legislation motion_picture report song" match="any">
          <group delimiter=". ">
            <text variable="title"/>
            <text macro="editor"/>
            <text macro="publisher"/>
            <text variable="number-of-pages" suffix=" с."/>
            <text variable="DOI" prefix="DOI: "/>
          </group>
        </if>
        <!-- Статьи в журналах -->
        <else-if type="article-journal article-magazine article-newspaper broadcast interview manuscript map patent personal_communication speech thesis" match="any">
          <text variable="title"/>
          <group delimiter=". " prefix=" // ">
            <text variable="container-title"/>
            <text variable="volume" prefix="Т. "/>
            <text variable="issue" prefix="№ "/>
            <text macro="year-date"/>
            <text variable="page" prefix="С. "/>
            <text variable="DOI" prefix="DOI: "/>
          </group>
        </else-if>
        <!-- Главы в книгах -->
        <else-if type="chapter paper-conference" match="any">
          <group delimiter=". " prefix=" // ">
            <text variable="title"/>
            <text variable="container-title"/>
            <text variable="collection-title"/>
            <text macro="editor"/>
          </group>
          <text macro="publisher"/>
          <text variable="page" prefix="С. "/>
        </else-if>
        <!-- Интернет-источники -->
        <else-if type="webpage post-weblog" match="any">
          <text variable="title"/>
          <text prefix=" " macro="access"/>
        </else-if>
        <!-- Все остальные типы -->
        <else>
          <text variable="title"/>
          <group delimiter=". " prefix=" // ">
            <text variable="container-title"/>
            <text variable="volume" prefix="Т. "/>
            <text variable="issue" prefix="№ "/>
            <text macro="year-date"/>
            <text variable="page" prefix="С. "/>
            <text variable="DOI" prefix="DOI: "/>
          </group>
        </else>
      </choose>
    </layout>
  </bibliography>
</style>