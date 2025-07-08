  function [data, auxData, metaData, txtData, weights] = mydata_Lophiosilurus_alexandri
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pseudopimelodidae';
metaData.species    = 'Lophiosilurus_alexandri'; 
metaData.species_en = 'Pacama'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr','biFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 11];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 36.51;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';   bibkey.Lp = 'FilhBazz2020';
data.Lpm = 29.88;     units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';   bibkey.Lpm = 'FilhBazz2020';
data.Li = 72;     units.Li = 'cm';   label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MeloCruz2022';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 783.05;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'FilhBazz2020';
data.Wwpm = 444.1;   units.Wwpm = 'g';    label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = 'FilhBazz2020';
data.Wwi = 3.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 5 kg, based on 0.00646*Li^3.09, see F1, gives 3.5 kg';

data.GSI = 0.03; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'FilhBazz2020';
  temp.GSI = C2K(25); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), length (mm)
 0.	6.563
 1.	7.594
 2.	8.250
 3.	8.844
 4.	9.938
 5.	10.344
 6.	11.594
 7.	12.313
 8.	13.031
 9.	13.625
10.	13.938
11.	14.438
12.	14.719
13.	14.688
14.	15.219
15.	15.469
16.	15.750
17.	15.438
18.	15.781
19.	15.594
20.	15.938
21.	16.156
22.	16.469
23.	16.688
24.	16.500
25.	16.594
26.	16.844
27.	16.656
28.	17.281
29.	17.281];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL = {'d', 'cm'};  label.tL = {'time since hatch','total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MellSant2015';
comment.tL = 'mouth and anus opened at 2 d';
%
data.tL_fm = [ ... % time since hatch (d), total length (cm)
    278	18.688 18.310
    372	23.042 23.703
    481	27.775 26.172
    593	30.810 29.489
    734	33.373 33.372
    845	32.822 34.520
    968	39.536 39.912];
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since hatch','total length'};  
temp.tL_fm = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'FilhBazz2020';

% time-weight
data.tW_fm = [ ... % time since hatch (d), weight (g)
    278	 83.019 90.566
    372	200.000 207.547
    481	335.849 256.604
    593	441.509 369.811
    734	607.547 577.358
    845	664.151 618.868
    968	935.849 935.849];
units.tW_fm = {'d', 'g'};  label.tW_fm = {'time since hatch','weight'};  
temp.tW_fm = C2K(25);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
treat.tW_fm = {1, {'females','males'}};
bibkey.tW_fm = 'FilhBazz2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 2;
weights.tL_fm = weights.tL_fm * 3;
weights.tW_fm = weights.tW_fm * 3;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 3;
weights.GSI = weights.GSI * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00646*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to the rio Sao Francisco basin';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3W297'; % Cat of Life
metaData.links.id_ITIS = '681828'; % ITIS
metaData.links.id_EoL = '214614'; % Ency of Life
metaData.links.id_Wiki = 'Lophiosilurus_alexandri'; % Wikipedia
metaData.links.id_ADW = 'Lophiosilurus_alexandri'; % ADW
metaData.links.id_Taxo = '179102'; % Taxonomicon
metaData.links.id_WoRMS = '1020026'; % WoRMS
metaData.links.id_fishbase = 'Lophiosilurus-alexandri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Lophiosilurus_alexandri}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MellSant2015'; type = 'Article'; bib = [ ...
'doi = {10.1590/1982-0224-20140161}, ' ...
'author = {Gabriel Caetano Guimar\~{a}es de Mello and Jos\''{e} Enemir dos Santos and Rodrigo Jos\''{e} Guimar\~{a}es-Cruz and Alexandre Lima Godinho and Hugo Pereira Godinho}, ' ...
'year = {2015}, ' ...
'title = {Allometric larval growth of the bottom-dwelling catfish \emph{Lophiosilurus alexandri} {S}teindachner, 1876 ({S}iluriformes: {P}seudopimelodidae)}, ' ... 
'journal = {Neotropical Ichthyology}, ' ...
'volume = {13(4)}, '...
'pages = {677-684}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FilhBazz2020'; type = 'Article'; bib = [ ...
'doi = {10.1016/j.anireprosci.2020.106311}, ' ...
'author = {Reinaldo Melillo Filho and Nilo Bazzoli and Walisson de Souza e Silva and Deliane Cristina Costa and T\''{u}lio Pacheco Boaventura and Gustavo Soares da Costa Julio and Ronald Kennedy Luz}, ' ...
'year = {2020}, ' ...
'title = {Rearing and maturation of \emph{Lophiosilurus alexandri} ({S}teindachner, 1876) in controlled conditions: First reports and future perspective}, ' ... 
'journal = {Animal Reproduction Science}, ' ...
'volume = {214}, '...
'pages = {106311}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MeloCruz2022'; type = 'Article'; bib = [ ...
'doi = {10.1016/j.anireprosci.2022.107100}, ' ...
'author = {Rafael M.C. Melo and Cl\''{a}udia K. F. Cruz and Anfr\''{e} A. Weber and Ronald K. Luz and Nilo Bazzoli and Elizete Rizzo}, ' ...
'year = {2022}, ' ...
'title = {Effects of temperature manipulation on gamete development and reproductive activity in the farmed catfish \emph{Lophiosilurus alexandri}}, ' ... 
'journal = {Animal Reproduction Science}, ' ...
'volume = {247}, '...
'pages = {107100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lophiosilurus-alexandri.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

