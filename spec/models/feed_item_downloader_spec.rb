require 'rails_helper'

RSpec.describe FeedItemDownloader, :type => :model do

  let(:dangerous_content) { <<-EOF
  <div id="current_article"><div id="meta" style="display: none;"><div id="article_id">2099</div></div><div class="h3" id="title" style="display: inline;">Dungeon Mini: Tablet-Rollenspiel mit echten Figuren</div>&nbsp;&nbsp;<span id="source"><a href="https://www.heise.de/newsticker/meldung/Dungeon-Mini-Tablet-Rollenspiel-mit-echten-Figuren-3617474.html?wt_mc=rss.ho.beitrag.atom">original</a></span><p id="subscription_name">heise.de+content</p><br><p id="body"><div class="meldung_wrapper">

    <!-- RSPEAK_STOP -->
    <figure class="aufmacherbild">
            <img src="//1.f.ix.de/scale/geometry/695/q75/imgs/18/2/1/3/6/5/4/8/Dungeon_Mini_00-f1d6550f7ddd61d8.png">
    </figure>
    <!-- RSPEAK_START -->

            <p class="meldung_anrisstext"><strong>Dungeon Mini heißt die Mischung aus Brett- und Videospiel, mit der das französische Studio Ynnis Interactive sein Glück auf Kickstarter versucht. Wir haben uns die Mischung aus D&amp;D und Skylanders angesehen.</strong></p>
            
                    
            <p>Tabletop-Rollenspiele sind klasse - allerdings braucht man für eine zünftige Runde um den Küchentisch menschliche Mitstreiter und den unersetzlichen Spielleiter, der das Abenteuer plant und kommentiert. Kein Wunder, dass Rollenspiele als eins der ersten Genres den Weg auf den Computer fanden: Kollege PC ist als Spielleiter nie müde, übernimmt das Steuern von Monstern, das Zuschnappen von Fallen und berechnet obendrein komplexe Würfelaktionen mit vielseitigen Würfeln mit links.</p>
<p>Das am Donnerstag <a href="https://www.kickstarter.com/projects/438269196/dungeon-mini?token=ab2ab3ef" target="_blank" rel="external">mit einer Kickstarter-Kampagne gestartete Action-Rollenspiel Dungeon Mini</a> des französischen Entwicklers Ynnis Interactive verbindet Tabletop- und Computer-Rollenspiel und mischt noch eine kräftige Prise Skylanders dazu. Denn die Kerker, durch die man in dem Titel läuft, springt und schnetzelt, reagieren auf die Bewegungen einer dreidimensionalen Heldenminiatur. Zum Start planen die Designer einen Zwergenkrieger und eine Elfenbogenschützin. Finden sich genug Unterstützer, stoßen eine Zauberin und ein Schurke zur Gruppe.</p>
<p>
</p><div class="gallery compact" data-content-id="3617440" data-data-url="/bilderstrecke/bilderstrecke_3617440.html?view=jsonp;cid=3617474;lid=5" data-debug="0" data-image-cursor="0" data-inline-color-schema="light" data-inline-layout="compact" data-inline-ratio="1:1" data-noscript-url="/newsticker/bilderstrecke/bilderstrecke_3617440.html?back=3617474" data-title="Dungeon Mini">
	<span style="display:none" class="image-num">Bild <span class="cur-image">1</span> von <span class="image-count">4</span></span>
	<h2><a href="http://www.heise.de/newsticker/bilderstrecke/bilderstrecke_3617440.html?back=3617474" title="Bilderstrecke: Dungeon Mini (4 Bilder)">Dungeon Mini (4 Bilder)</a></h2>
	<a href="http://www.heise.de/newsticker/bilderstrecke/bilderstrecke_3617440.html?back=3617474" title="Bilderstrecke: Dungeon Mini (4 Bilder)"><div class="gallery-inner"><figure><img src="//1.f.ix.de/scale/geometry/696/q50/imgs/71/2/1/3/6/5/2/5/Dungeon_Mini_02-c662454138103833.JPG"></figure></div></a>
	
	<figcaption>Mit genug Energiepunkten darf selbst ein schwerer Zwergenkrieger den Sprung über einen gähnenden Abhang wagen. Die Punkte regenerieren sich von selbst wieder.<br> (Bild: Roland Austinat)</figcaption>
</div>


<h3 class="subheading">Vier kontaktfreudige Helden</h3>
<p>Die vier Helden wirken sich ganz praktisch auf das Spielgeschehen aus: Die Bogenschützin kann beispielsweise weiter entfernte Feinde erledigen, an denen der Krieger nicht unbeschadet vorbeikommen würde. Aber auch solo sind die Abenteurer nicht hilflos: So springen wir bei einem Test des Prototyps als Zwerg in einem rattenverseuchten Raum auf Holzkisten, die die Biester nicht hochklettern können. Etwas später hüpfen wir über gähnende Abgründe und erspähen mit der Fackel in der Hand einen verborgenen Schalter, der eine Pfeilfalle deaktiviert. Uns gelingt es sogar, eine Riesenspinne hinters Licht zu führen, die uns unentwegt mit Gift bespritzt: Wir verzichten auf einen aussichtslosen Kampf, huschen im richtigen Moment hinter einer schützenden Kiste hervor, um vier Runen zu aktivieren und dann das Weite zu suchen.</p>
<p>Die Heldenfiguren, die wir auf dem Tablet umherschieben, benötigen keine Batterie. Stattdessen verpasste Partnerstudio Volumique ihnen drei kapazitive Kontakte, die winzige Ströme von der Haut über die Figur auf die Pad-Oberfläche leiten. Beim Zwergenkrieger regelt der linke Kontakt die Stellung des Schildes, der rechte die Position des Schwertes und der mittlere die Blickrichtung des kurzen Kollegen. So lassen sich Kämpfe entweder mit herzhaften Schwerthieben, aus der vorsichtigen Deckung oder mit raumgreifenden Schritten um den und die Gegner herum bestreiten. Allerdings stellte sich bei unserem Ortstermin mit einem Prototyp heraus, dass man nicht zu kalte Finger haben sollte - sonst ruft das Spiel mit konzentrisch dargestellten Kreisen um Hilfe.</p>
<p>
</p><div>

    <div class="yt-video-container">
        <iframe class="yt_video" width="400" height="246" src="//www.youtube.com/embed/bxK-4y4jH8w?wmode=transparent" frameborder="0" allowfullscreen=""></iframe>
    </div>


    <span class="bildunterschrift">
        <p>Dungeon Mini: Vorstellung des Spielkonzepts im Kickstarter-Trailer</p>
    </span>

</div>

<style type="text/css"><![CDATA[
    .yt-video-container {
        position: relative;
        padding-bottom: 56.25%;
        padding-top: 24px;
        height: 0;
        overflow: hidden;
        margin-top: 30px;
    }
    .yt-video-container iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }
]]></style>

<h3 class="subheading">Abenteuer auch auf älterer Hardware</h3>
<p>Im Dungeon des bösen Magiers Maleferus sammeln Spieler nicht nur Schlüssel, Fackeln und Heiltränke ein. Mit aufgelesenem Gold kaufen sie ihren Helden neue Waffen und Ausrüstungsgegenstände, während das Sammeln von Erfahrungspunkten rollenspielgemäß zum Stufenaufstieg und dem Freischalten neuer Fähigkeiten führt. Zauberer sollen neue Sprüche auch unterwegs erlernen können, indem sie mit dem Finger Runden nachzeichnen oder gar neue entwerfen und deren Resultate begutachten können.</p>
<p>Technisch begnügt sich Dungeon Mini mit älterer Hardware: Wer ein 7-Zoll-Tablet mit Android 5.0 beziehungsweise iOS 6 besitzt, ist bereit für das Abenteuer. Wir spielten das Spiel ohne Probleme auf einem iPad 2 – von den kalten Fingern des PR-Mitarbeiters einmal abgesehen. Der Abstecher in die mit Spinnen, Kobolde, Ratten und sonstigem Gesocks gefüllte Unterwelt soll derzeit rund eineinhalb Stunden dauern. Erreichen die Entwickler diverse Stretch Goals, soll die Spielzeit auf fünf Stunden ansteigen. Apropos: Wie es sich für ein Kickstarter-Projekt gehört, gibt es zahlreiche Möglichkeiten, Dungeon Mini zu unterstützen. Ab 35 Euro lockt ein Held, ab 60 Euro locken zwei einfarbige Figuren, ab 1000 Euro greift ein Miniaturenprofi zum Pinsel, um den rund sechs Zentimeter hohen Helden zu bemalen.<!-- AUTHOR-DATA-MARKER-BEGIN -->

<!-- RSPEAK_STOP -->
<span class="ISI_IGNORE">(<a href="mailto:hag@ct.de" title="Hartmut Gieselmann">hag</a>)</span>
<br class="clear">
<!-- RSPEAK_START -->
<!-- AUTHOR-DATA-MARKER-END -->
</p>

        </div></p><div id="read-later-link"><a href="http://www.google.com" onclick="window.open(this.href,'_self');window.open('#','_blank');"><click>Here</click></a></div></div>
EOF
}

  describe '#sanitize_content' do

    it 'does its job' do
      sanitized_content = FeedItemDownloader.sanitize_content(dangerous_content)
      expect(sanitized_content).not_to match(/<style/)
    end

  end
end
