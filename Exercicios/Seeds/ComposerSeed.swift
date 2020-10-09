//
//  PeopleSeed.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import Foundation

struct ComposerSeed {
    private static let items: [Composer] = [
        
        //MARK: - Bach
        Composer(
            name: "Johann Sebastian Bach",
            imageName: K.Images.Composers.bachImageName,
            birthDate: 1685,
            deathDate: 1750,
            profileDescription: """
Music poured out of Bach, all for the greater glory of God and, in Bach’s words, “the refreshment of the soul.” Organ music, church cantatas and incidental music for his employers were his daily bread.  Bach, one of the greatest classical composers, wrote ceaselessly: it’s interesting that the hardest-working composer of all time should also be the one closest to musical perfection. For many, JS Bach’s endless lines, elaborate counterpoint and flowing harmonies somehow express the ideal state of all music – something beyond the shortness and contingency of human life. Playing Bach’s music on keyboard or solo instrument is also an amazing form of balancing therapy for the mind. Listen to Bach’s ‘Prelude In C Major’ from The Well-Tempered Clavier – a collection of preludes and fugues in all 24 major and minor keys which is generally regarded as being among the most important works in the history of classical music.
"""),
        
        //MARK: - Mozart
        Composer(
            name: "Wolfgang Amadeus Mozart",
            imageName: K.Images.Composers.mozartImageName,
            birthDate: 1756,
            deathDate: 1791,
            profileDescription: """
Forget all that stuff about taking dictation from God. Mozart was always working, teaching himself to be a better composer and trying to be more than just a maker of music. He was a philosopher whose language was music, a pure product of the Enlightenment who believed the world could be healed through its power. He attempted to do all this in a way that strikes our ears as the purest ever conceived. That can tend to make us undervalue the intellectual and political weight of what Mozart, one of the best classical composers, had to say. Listen to the ‘Overture’ from one of Mozart’s greatest operas The Marriage Of Figaro.
"""),
        
        //MARK: - Beethoven
        Composer(
            name: "Ludwig van Beethoven",
            imageName: K.Images.Composers.beethovenImageName,
            birthDate: 1770,
            deathDate: 1827,
            profileDescription: """
It’s not just the tunes, the blazing triumphs, the thundering highlights or the contemplative hymns and the rhapsodies. We all love Beethoven because even though it was all such a struggle against the world, his emotions and his deafness, he never lost his idealism or his faith. Beethoven, one of the greatest classical composers, is the composer as hero, alone against the universe, striving to understand, express, worship and improve it with his music. This titanic struggle comes across in almost everything he wrote, alongside a great lyrical tenderness and the overpowering sense of music being dragged into a new era. Listen to Beethoven’s Symphony No. 3 In E Flat, Op. 55 (Eroica) which was written in honour of Napoleon and is regularly voted the greatest symphony of all time.
"""),
        
        //MARK: - Tchaikovsky
        Composer(
            name: "Pyotr Ilyich Tchaikovsky",
            imageName: K.Images.Composers.tchaikovskyImageName,
            birthDate: 1840,
            deathDate: 1893,
            profileDescription: """
The beau idéal of the Romantic composer, Tchaikovsky, put Russian music on the European map. A devotion to Mozart, Bellini and Donizetti reflects his own endless melodic gifts, which he yoked to a brilliant orchestral sense, plus his own very intense emotionality. This is music that wears its heart on its sleeve and concentrates obsessively on love, death and fate. Tchaikovsky, one of the greatest classical composers, is best known for his charming and ebullient ballets and piano concerto, but his symphonies possess much greater emotional depth. His operas, particularly Eugene Onegin, have a profoundly touching personal quality that makes them among the most loveable in the repertoire. Listen to ‘Dance of the Reed Pipes’ from one of Tchaikovsky’s most popular ballets The Nutcracker.
"""),
        
        //MARK: - Wagner
        Composer(
            name: "Richard Wagner",
            imageName: K.Images.Composers.wagnerImageName,
            birthDate: 1813,
            deathDate: 1883,
            profileDescription: """
You can love other composers more, but it’s hard to argue that Wagner, one of the greatest classical composers, didn’t have the most boundless musical imagination of all time. He stretched the language beyond all previous limits to create a wholly new expressive role for the orchestra, taking the forms and harmonic structures that had existed since Beethoven and before and subjecting them to extreme stress in order to convey uncanny depths of feeling and motivation. Wagner’s orchestra, forever commentating on the utterances and experiences of his operatic characters, taps into the subconscious in a striking way. This music can take possession of you like no other. The stories are fun, too. Listen to Georg Solti’s recording of Wagner’s epic Ring cycle which was described by BBC Music Magazine as “the finest recording ever made”.
"""),
        
        //MARK: - Brahms
        Composer(
            name: "Johannes Brahms",
            imageName: K.Images.Composers.brahmsImageName,
            birthDate: 1833,
            deathDate: 1897,
            profileDescription: """
Because he chose to work in forms and idioms that had apparently reached their zenith a generation earlier, Brahms has (wrongly) been thought academic and dull. You may even picture a stern and bearded patriarch, but the younger Brahms was a passionate Romantic Adonis, tormented with love for the wife of his mentor Robert Schumann. In the symphony and concerto Brahms found the ideal vehicle for combining his intellectual devotion to these forms, based on counterpoint and development, with a lyrical and spiritual dimension devoted to the idea of pure music in a way that was very unusual for the normal, wildly subjective Romantic composer. From the time of his great Symphony No. 1 Brahms’ place in music life was assured.
"""),
        
        //MARK: - Schubert
        Composer(
            name: "Franz Schubert",
            imageName: K.Images.Composers.schubertImageName,
            birthDate: 1797,
            deathDate: 1828,
            profileDescription: """
Schubert was one of the greatest classical composers and there’s a serenity to much of his work which, if you didn’t know better, you might attribute to the idea that it all came easily to him. Yet his music has a special quality of interiority, expressed through an almost Italian devotion to melody combined with some rigorously German ideas of harmony and development. Much of Schubert’s orchestral work has a radiant air of contemplation and a delight in slow-moving beauty. But it is in his hundreds of songs and chamber works that he expresses himself most precisely, unerringly finding the source and expression of all human experience – from joy to hollowest grief. Listen to Schubert’s masterpiece setting of Ave Maria.
"""),
        
        //MARK: - Schumann
        Composer(
            name: "Robert Schumann",
            imageName: K.Images.Composers.schumannImageName,
            birthDate: 1810,
            deathDate: 1856,
            profileDescription: """
Schumann is widely regarded as one of the greatest composers of the Romantic era. He is particularly renowned for his piano music, songs (lieder) and orchestral music. The originality of his work pushed at emotional, structural and philosophical boundaries. Schumann’s music is largely programmatic, meaning it tells a story (through music, not specifically through words). His musical influence extended decades into the future – his impact on Brahms, Liszt, Wagner, Elgar and Fauré, and beyond, is immeasurable. And he remains among the best-loved of all 19th-century composers. Listen to Schumann’s Carnaval – a selection of piano miniatures representing masked revellers at Carnival.
"""),
        
        //MARK: - Verdi
        Composer(
            name: "Giuseppe Verdi",
            imageName: K.Images.Composers.verdiImageName,
            birthDate: 1813,
            deathDate: 1901,
            profileDescription: """
Italian opera of the mid-19th century seems almost too unsubtle a creature to have produced a great composer. Yet over the course of 50 years, Verdi turned its forthright poundings into a vehicle for conveying the most tearing emotions in an incredibly powerful way. Italian music had always relied on the power of melody, particularly conveyed through the voice. Verdi, one of the greatest classical composers, added a growing harmonic and orchestral sophistication. He combines deep compassion with a usually black view of human loneliness and hypocrisy to create intensely personal dramas of love and death, conveyed through a melodic genius of great sorrowful power. Listen to Verdi’s Messa da Requiem, one of the most famous and enthralling settings of the Requiem Mass.
"""),
        
        //MARK: - Handel
        Composer(
            name: "George Frideric Handel",
            imageName: K.Images.Composers.handelImageName,
            birthDate: 1685,
            deathDate: 1759,
            profileDescription: """
He might have been Bach’s exact contemporary, but Handel and Bach could hardly be more different. Handel’s concerns are intensely human – real, aching hearts – and he is the master of massive effects made through the most apparently simple musical language. But don’t be misled by the grand ceremonial stuff and those vast choruses: they may be stirring and joyous, but the real man is to be found in the love songs and arias that deal with heartbreak and moral choice in his operas and oratorios. It is his exactness – finding the precise musical expression of intensely felt and isolated moments and feelings – that makes Handel, one of the greatest classical composers, different. And nobody could place a musical pause quite like him. Listen to Handel’s Messiah – an oratorio which traces the story of Jesus Christ and is one of the greatest choral works of all time.
"""),
        
        //MARK: - Haydn
        Composer(
            name: "Franz Joseph Haydn",
            imageName: K.Images.Composers.haydnImageName,
            birthDate: 1732,
            deathDate: 1809,
            profileDescription: """
Haydn was one of the best composers of the classical period. Almost single-handedly Haydn established the formats on which classical music would be based for more than a century. Two titles are regularly bestowed upon him: “Father of the Symphony” and “Father of the String Quartet”. But his influence was equally important on the concerto, the piano sonata and the piano trio. Haydn’s most celebrated pupil was Ludwig van Beethoven, and his musical form casts a huge shadow over the music of subsequent composers including Schubert, Mendelssohn and Brahms. Listen to Haydn’s String Quartet In D Major, Op 76, one of Haydn’s most renowned string quartets.
"""),
        
        //MARK: - Vivaldi
        Composer(
            name: "Antonio Vivaldi",
            imageName: K.Images.Composers.vivaldiImageName,
            birthDate: 1678,
            deathDate: 1741,
            profileDescription: """
Vivaldi’s influence on the development of Baroque music was immense. He ignited transformations in music for the church, the opera house and the concert hall. But his most important achievement was in his music for strings. He introduced a range of new styles and techniques to string playing and consolidated one of its most important genres, the concerto. Vivaldi’s concertos became a model for his contemporaries, and the form was soon one of the most important in eighteenth century Europe. Vivaldi’s The Four Seasons, a set of four violin concertos, are among the most popular pieces in the classical music repertoire.
"""),
        
        //MARK: - Stravinsky
        Composer(
            name: "Igor Stravinsky",
            imageName: K.Images.Composers.stravinskyImageName,
            birthDate: 1882,
            deathDate: 1971,
            profileDescription: """
Stravinsky is widely considered one of the most important and influential composers of the 20th century. Although he composed masterpieces for almost every genre he is particularly well-known for the ballet music he composed for Diaghilev’s Ballet Russes including The Firebird, Petrushka, and The Rite Of Spring which famously caused a riot at its premiere in Paris. During the course of a long career Stravinsky composed an astonishingly wide variety of music. His work encompassed styles as diverse as Romanticism, Neoclassicism and Serialism. His style hallmarks include Russian folk inflections, rhythmic energy and orchestral virtuosity. Listen to The Rite Of Spring which caused a scandal at its premiere in 1913 but is now widely regarded as one of the most influential musical works of the 20th century.
"""),
        
        //MARK: - Chopin
        Composer(
            name: "Frédéric Chopin",
            imageName: K.Images.Composers.chopinImageName,
            birthDate: 1810,
            deathDate: 1849,
            profileDescription: """
Chopin was one of the greatest composers of the Romanic era. As a pianist and composer his musical understanding and visionary imagination remains inimitable. Among the influences on his style of composition were Polish folk music, the classical tradition of JS Bach, Mozart, and Schubert, and the atmosphere of the Paris salons of which he was a frequent guest. His innovations in style, harmony, and musical form, and his association of music with nationalism, were influential throughout and after the late Romantic period. No other composer has contributed as many significant works to the piano’s repertoire. Listen to Chopin’s Nocturne In E Flat Major, his best-known Nocturne.
"""),
        
        //MARK: - Mendelssohn
        Composer(
            name: "Felix Mendelssohn",
            imageName: K.Images.Composers.mendelssohnImageName,
            birthDate: 1809,
            deathDate: 1847,
            profileDescription: """
Mendelssohn was a German composer, pianist, musical conductor, and teacher and one of the most-celebrated figures of the early Romantic period. Robert Schumann, a close friend, perceptively described him as “the Mozart of the 19th century”. In his music Mendelssohn largely observed Classical models and practices while initiating key aspects of Romanticism. The Hebrides Overture and the Scottish and Italian Symphonies are quintessentially Romantic fusions of the musical and the visual. So too is the F sharp minor ‘Barcarolle’ from the second book of Songs Without Words op.30/6. Listen to The Hebrides overture inspired by the composer’s visit to the Hebrides islands off the west coast of Scotland.
"""),
        
        //MARK: - Debussy
        Composer(
            name: "Claude Debussy",
            imageName: K.Images.Composers.debussyImageName,
            birthDate: 1862,
            deathDate: 1918,
            profileDescription: """
Debussy was one of the most influential composers of the late 19th and early 20th centuries and is regarded as the founder of musical impressionism. Reacting against the dominant influence of Germanic music with its logical rigours of form and development, he sought a new music of colour, sensation, fleeting mood and relaxed form that would be distinctively French, as well as distinctively his own. He developed a highly original system of harmony and musical structure and his music was perceived as sharing certain characteristics with the Impressionist painters. Listen to ‘Clair De Lune‘, perhaps Debussy’s best-loved piano piece, from Suite Bergamasque.
"""),
        
        //MARK: - Liszt
        Composer(
            name: "Franz Liszt",
            imageName: K.Images.Composers.lisztImageName,
            birthDate: 1811,
            deathDate: 1886,
            profileDescription: """
Liszt was one of the most important composers of the Romantic period and is widely considered to be one of the greatest pianists of all time. He created the orchestral symphonic poem and devised the leitmotif technique that Wagner used in his epic operas. His piano compositions, such as the Études, the Hungarian Rhapsodies and the Mephisto Waltzes are brilliant showpieces, requiring both technical skill and expressivity. Many of his piano compositions are amongst the most technically challenging in the repertoire and he was known for popularising the music of other composers through his piano arrangements. Listen to Piano Sonata In B Minor which is generally acknowledged to be Liszt’s masterpiece.
"""),
        
        //MARK: - Rachmaninov
        Composer(
            name: "Sergei Rachmaninov",
            imageName: K.Images.Composers.rachmaninovImageName,
            birthDate: 1873,
            deathDate: 1943,
            profileDescription: """
Rachmaninov was a legendary Romantic Russian composer, pianist and conductor. His music is characterised by sweeping melodies, virtuosic pianism and heady orchestration. Most of his pieces are in a late Romantic style akin to Tchaikovsky, although strong influences of Chopin and Liszt are apparent. Rachmaninov’s Piano Concerto No. 2 is one of the greatest works in the piano repertoire.
"""),
        
        //MARK: - Dvořák
        Composer(
            name: "Antonín Dvořák",
            imageName: K.Images.Composers.dvorakImageName,
            birthDate: 1841,
            deathDate: 1904,
            profileDescription: """
Dvořák was one of the greatest classical composers and the first Czech composers to achieve worldwide recognition. He frequently incorporated folk elements from his Czech homeland into his music. After Brahms recommended his music for publication he turned full-time to composing in a wide range of forms but most successfully for the orchestra and for chamber music. Of his nine symphonies the most famous, From The New World, was written during his time as Director of the National Conservatory of Music in New York.

"""),
        
        //MARK: - Mahler
        Composer(
            name: "Gustav Mahler",
            imageName: K.Images.Composers.mahlerImageName,
            birthDate: 1860,
            deathDate: 1911,
            profileDescription: """
Mahler’s Romantic style was much influenced by Brahms, Wagner and Bruckner. Mahler’s symphonies were often conceived on an immense scale, with immense philosophical subjects: love and hate, joy in life and terror of death, the beauty of nature, innocence and bitter experience. He was also a great composer of songs, and in these smaller forms he distilled the essence of intense human emotions, developing and enriching his exquisite melodic gift in the process. Listen to Mahler’s Symphony No. 5 – the fourth movement, ‘Adagietto’, may be Mahler’s most famous composition and is the most frequently performed of his works.
""")
    ]
    
    static func seed() -> [Composer] {
        return self.items
    }
}
