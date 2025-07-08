function [data, auxData, metaData, txtData, weights] = mydata_Anodonta_cygnea
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Anodonta_cygnea'; 
metaData.species_en = 'Swan mussel'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', '0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L','L-Ww','L-Wd'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 13]; 

%% set data
% zero-variate data

data.tp = 2*365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ChojRosi2011';   
  temp.tp = C2K(16.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 12*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki_nl';   
  temp.am = C2K(16.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 20;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Jans2015';

data.Wwb = 7e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = 'Based on 306 till 309 mum glochidium length, but rather flat: 0.5*4/3*pi*0.015^3';
  
data.Ri  = 7e3; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(16.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Guessed based on value for kap';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), shell length (cm)
 15.123	3.854
 45.291	4.324
 75.876	4.653
106.885	4.777
136.691	4.841
167.667	5.281
197.874	5.365
228.089	5.368
258.291	5.503
288.493	5.627
319.112	5.620
349.723	5.693
379.533	5.716];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(13.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LimaCarv2004';
%
data.tW = [ ... % time since birth (d), total weight (g)
 15.287	 6.665
 45.439	 8.556
 76.452	 8.806
107.041	 9.665
137.634	10.402
168.242	10.713
198.056	10.660
228.609	12.612
258.366	14.259
288.929	15.908
319.548	15.855
350.162	15.984
380.379	15.930];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'total weight'};  
temp.tW    = C2K(13.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LimaCarv2004';

LWWW = [ ... % shell length (mm), total, wet flesh, dry flesh weight (g)
 4.98   7.93 1.64 0.15
 6.01  18.3  5.4  0.7
 7.00  27.4  7.9  1
 7.96  39.8 12.5  1.8
 9.09  59.1 17.7  2.5
10.01  80.8 22.4  3.0
11.01 101.4 25.5  3.6
11.94 131.0 30.6  4.0
12.73 159.0 36.2  4.5
13.65 203.9 47.9  4.4];
data.LWt = LWWW(:,[1 2]); 
units.LWt   = {'cm', 'g'};  label.LWt = {'shell length', 'total wet weight'};  
bibkey.LWt = 'BascDuzg2009';
%
data.LWw = LWWW(:,[1 3]); 
units.LWw   = {'cm', 'g'};  label.LWw = {'shell length', 'flesh wet weight'};  
bibkey.LWw = 'BascDuzg2009';
%
data.LWd = LWWW(:,[1 4]); 
units.LWd   = {'cm', 'g'};  label.LWd = {'shell length', 'flesh dry weight'};  
bibkey.LWd = 'BascDuzg2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Glochidium is here not assumed to extract nutrients from the host fish';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'The European bitterling Rhodeus amarus fully depends on Anadonta to deposit its eggs inside the shell, while Anadonta clings its glochidia larvae (glochidia) to it and to metamorphose';
metaData.bibkey.F1 = {'Wiki_nl'}; 
F2 = 'Facultative hermaphroditic';
metaData.bibkey.F2 = 'Aldr1999'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5V66R'; % Cat of Life
metaData.links.id_ITIS = '983691'; % ITIS
metaData.links.id_EoL = '4749280'; % Ency of Life
metaData.links.id_Wiki = 'Anodonta_cygnea'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '39445'; % Taxonomicon
metaData.links.id_WoRMS = '234103'; % WoRMS
metaData.links.id_molluscabase = '234103'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nl.wikipedia.org/wiki/Zwanenmossel}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_nl'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anodonta_cygnea}}';
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
bibkey = 'LimaCarv2004'; type = 'Article'; bib = [ ... 
'author = {P. Lima and F. Carvalho and V. Vasconcelos and J. Machado}, ' ... 
'year = {2004}, ' ...
'title = {Studies on growth in the early adult of the freshwater mussel, \emph{Anodonta cygnea}}, ' ...
'journal = {Invertebrate Reproduction \& Development}, ' ...
'volume = {45}, ' ...
'pages = {117--125}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BascDuzg2009'; type = 'Article'; bib = [ ... 
'author = {N. S. Ba\c{s}\c{c}inar and E. D\"{u}zg\"{u}ne\c{s} and D. S. Misir and H. Polat and B. Zengin}, ' ... 
'year = {2009}, ' ...
'title = {Growth and Flesh Yield of the Swan Mussel \emph{Anodonta cygnea} ({L}innaeus, 1758) ({B}ivalvia: {U}nionidae) in {L}ake \c{C}ildir ({K}ars, {T}urkey)}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {9}, ' ...
'pages = {127--132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChojRosi2011'; type = 'Article'; bib = [ ... 
'author = {J. C. Chojnacki and B. Rosi\''{n}ska and J. Rudkiewicz and M. Smo{\l}a}, ' ... 
'year = {2011}, ' ...
'title = {Biometrics of the Swan Mussel \emph{Anodonta cygnea}}, ' ...
'journal = {Polish J. of Environ. Stud.}, ' ...
'volume = {20}, ' ...
'pages = {225--230}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Aldr1999'; type = 'Article'; bib = [ ... 
'author = {David C. Aldridge}, ' ... 
'year = {1999}, ' ...
'title = {THE MORPHOLOGY, GROWTH AND REPRODUCTION OF {U}NIONIDAE ({B}IVALVIA) IN A FENLAND WATERWAY}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {65}, ' ...
'pages = {47-60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jans2015'; type = 'Book'; bib = [ ... 
'author = {Jansen, B.}, ' ...
'year = {2015}, ' ...
'title  = {Veldgids Slakken en mossels}, ' ...
'publisher = {KNNV, Zeist}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

