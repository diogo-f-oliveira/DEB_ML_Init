function [data, auxData, metaData, txtData, weights] = mydata_Pterophyllum_scalare

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Pterophyllum_scalare'; 
metaData.species_en = 'Freshwater Angelfish';

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'};
metaData.data_1     = {'t-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 10 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 04];

%% set data
% zero-variate data

data.ab = 58.2;   units.ab = 'd';   label.ab = 'life span';                 bibkey.ab = 'KorzSzal2012';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'hatch at 1288 h post fertilization, start feeding at 4-5 d post hatch';
data.am = 9*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 1.033e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'KorzSzal2012';
data.Wwp = 17;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'OrteCort2009';
data.Wwi = 26.14;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'EspiFern2017';

% uni-variate data

% time-weight
data.tWw = [ ... % time (d), wet weight (g)
29.621	0.198
44.212	0.348
58.803	0.473
72.629	0.697
86.462	1.144
99.908	1.492
114.508	1.913
128.356	2.879
141.813	3.597
156.437	4.835
185.288	6.865
204.924	8.845
219.919	9.662
233.776	10.924];
units.tWw   = {'d', 'g'};  label.tWw = {'time', 'wet weight'};  
temp.tWw   = C2K(28.6);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'EspiFern2017';

% weight - fecundity
iNWLH = [ ... % fish id, # of eggs, weight (g), length (cm), height (cm)
1 530 32 16.5 20.0 
2 332 25 17.0 23.7 
3 1082 50 22.0 28.8 
4 297 18 12.5 13.0 
5 417 27 17.0 20.0
6 234 20 12.5 15.0 
7 445 32 16.5 20.0 
8 421 25 17.0 23.7 
9 403 27 17.0 20.0 
10 506 27 17.0 20.0 
11 462 32 16.5 20.0
12 413 25 17.0 23.7
13 868 50 22.0 28.8
14 385 18 12.5 12.5
15 309 27 17.0 20.0
16 374 20 12.5 15.0
17 518 32 16.5 20.0
18 364 25 17.0 23.7
19 505 27 17.0 20.0
20 511 27 17.0 20.0];
data.WwN = iNWLH(:,[3 2]);
units.WwN   = {'g', '#'};  label.WwN = {'wet weight', 'fecundity'};  
temp.WwN   = C2K(28);  units.temp.WwN = 'K'; label.temp.WwN = 'temperature';
bibkey.WwN = 'OrteCort2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'female and males guard nest';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-weight: Ww in g = 0.03162*(TL in cm)^3.00';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4Q2JF'; % Cat of Life
metaData.links.id_ITIS = '169845'; % ITIS
metaData.links.id_EoL = '206748'; % Ency of Life
metaData.links.id_Wiki = 'Pterophyllum_scalare'; % Wikipedia
metaData.links.id_ADW = 'Pterophyllum_scalare'; % ADW
metaData.links.id_Taxo = '46171'; % Taxonomicon
metaData.links.id_WoRMS = '1016080'; % WoRMS
metaData.links.id_fishbase = 'Pterophyllum-scalare'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterophyllum_scalare}}';
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
bibkey = 'EspiFern2017'; type = 'Article'; bib = [ ... 
'author = {Carmen Helena Espitia-Manrique and Jo\~{a}o Batista Kochenborger Fernandes and Nilva Kazue Sakomura and \''{A}ngel Andr\''{e}s Arias-Vigoya and Thiago Matias Torres do Nascimento and Edney Pereira da Silva and Cleber Fernando Menegasso Mansano}, ' ... 
'year = {2017}, ' ...
'title = {Description of growth and body composition of freshwater angelfish (\emph{Pterophyllum scalare}) by Gompertz model}, ' ...
'journal = {R. Bras. Zootec}, ' ...
'volume = {46(8)}, ' ...
'pages = {631-637}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OrteCort2009'; type = 'Article'; bib = [ ... 
'author = {Armando A. Ortega-Salas and Isabel Cort\''{e}s and Hugo Reyes-Bustamante}, ' ... 
'year = {2009}, ' ...
'title = {Fecundity, growth, and survival of the angelfish \emph{Pterophyllum scalare} ({P}erciformes: {C}ichlidae) under laboratory conditions}, ' ...
'journal = {Rev. Biol. Trop. (Int. J. Trop. Biol. ISSN-0034-7744)}, ' ...
'volume = {57(3)}, ' ...
'pages = {741-747}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KorzSzal2012'; type = 'Article'; bib = [ ... 
'author = {Agata Korzelecka-Orkisz and Zuzanna Szalast and Dorota Pawlos and Izabella Smaruj and Adam Ta\~{n}ski and Joanna Szulc and Krzysztof Formicki}, ' ... 
'year = {2012}, ' ...
'title = {Early ontogenesis of the angelfish, \emph{Pterophyllum scalare} {S}chultze, 1823 ({C}ichlidae)}, ' ...
'journal = {Neotropical Ichthyology}, ' ...
'volume = {10(3)}, ' ...
'pages = {567-576}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pterophyllum-scalare.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

