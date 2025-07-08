function [data, auxData, metaData, txtData, weights] = mydata_Manduca_sexta

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Lepidoptera'; 
metaData.family     = 'Sphingidae';
metaData.species    = 'Manduca_sexta'; 
metaData.species_en = 'Tobacco hornworm'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Th'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'eiHn'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ae'; 'am';  'Wwb'; 'Wwj';  'Ni'}; 
metaData.data_1     = {'t-Ww'; 't-JO'; 't-N'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'James Maino'; 'Bas Kooijman'};    
metaData.date_subm = [2016 05 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2019 08 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2024 10 16];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 16];

%% set data
% zero-variate data

data.ab = 4;    units.ab = 'd';   label.ab = 'age at birth';                 bibkey.ab = 'Wiki';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 30;    units.tj = 'd';   label.tj = 'time since birth at pupation'; bibkey.tj = 'GrunClar2015';
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.te = 18;    units.te = 'd';   label.te = 'time since pupation at emergence'; bibkey.te = 'Wiki';
  temp.te = C2K(27);  units.temp.te = 'K'; label.temp.te = 'temperature';
data.am = 5.3;     units.am = 'd';   label.am = 'life span as imago';           bibkey.am = 'SasaRidd1984';
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.8e-3;units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Wiki'; 
  comment.Wwb = 'based on egg diameter 0f 1.5 mm: pi/6*0.15^3';
data.Wwj = 11.3;  units.Wwj = 'g';  label.Wwj = 'wet weight at pupation';      bibkey.Wwj = 'GrunClar2015'; 
%data.Wwe = 2.5;    units.Wwe = 'g';  label.Wwe = 'wet weight of%emergence';     bibkey.Wwe = 'HayeMcCl1992'; % ?

data.Ni  = 845;    units.Ni  = '#';  label.Ni  = 'cumulative # of eggs';        bibkey.Ni  = 'SasaRidd1984';  
 
% uni-variate data

% time-weight larva
data.tW = [ ... % time since birth (d), wet weight (g)
0.824	0.002
1.827	0.005
2.902	0.008
3.871	0.009
4.877	0.009
5.808	0.016
6.883	0.029
7.852	0.036
8.858	0.035
9.862	0.048
10.830	0.083
11.833	0.130
12.873	0.185
13.951	0.195
14.849	0.199
15.853	0.279
16.857	0.451
17.896	0.730
18.864	1.141
19.832	1.572
20.946	1.599
21.916	1.570
22.849	1.944
23.889	2.727
24.857	4.036
25.862	5.662
26.902	7.530
27.871	9.323
28.912	11.338
29.918	10.934];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'larval wet weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GrunClar2015'; 
  

% time-spec resp data pupa
data.tjO =  [ ... % (d, ml/d.g),  O2 consumption during pupation (27C)
        0.9981712	6.48998	; 
        4.9888384	2.18369	;
        8.9722464	1.92065	;
        12.8932544	3.43793	;
        16.8852528	4.30635	;
        20.826832	8.5358] ;     
units.tjO  = {'d', 'ml/d.g'};  label.tjO = {'time since pupation', 'pupal spec. O_2 consumption'};  
temp.tjO   = C2K(27);  units.temp.tjO = 'K'; label.temp.tjO = 'temperature';
bibkey.tjO = 'Odel1998'; 

% time- egg production imago
data.tN = [ ...    % (d, #), egg production of imago through time (24C)
        1	      0	        
        2	     99.9153
        3	    201.331
        4	    369.122
        5	    458.913
        5.3654	492.177];
units.tN   = {'d', '#'};  label.tN = {'time since mating', 'cumulative number of eggs'};  
temp.tN    = C2K(24);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'SasaRidd1984'; 
comment.tN = 'Egg production is assumed to proceed proportional to time since emergence minus 1 d';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwj = 3 * weights.Wwj;
weights.tj = 3 * weights.tj;
weights.ab = 0 * weights.ab;
weights.am = 5 * weights.am;
% % weights.te = 5 * weights.te;
weights.Wwb = 5 * weights.Wwb;
weights.tN =  3 * weights.tN;
% weights.Ni = 3 * weights.Ni;
% weights.tjO = 2 * weights.tjO;
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 50 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '5 (normal) till 8 (at caloric restriction) instars from birth till pupation';
D2 = 'Part of energy in imago structure is assumed to conert to  eggs';
D3 = 'mod_1: references corrected/added,  data added and changed, data re-digitized, no conversion from structure to eggs';
D4 = 'mod_2: parameter estimation redone';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Imagos only feed on nectar';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72SYK'; % Cat of Life
metaData.links.id_ITIS = '936100'; % ITIS
metaData.links.id_EoL = '506145'; % Ency of Life
metaData.links.id_Wiki = 'Manduca_sexta'; % Wikipedia
metaData.links.id_ADW = 'Manduca_sexta'; % ADW
metaData.links.id_Taxo = '114444'; % Taxonomicon
metaData.links.id_WoRMS = '1488629'; % WoRMS
metaData.links.id_lepidoptera = '53481'; % lepidoptera

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Manduca_sexta}}';
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
bibkey = 'SasaRidd1984'; type = 'Article'; bib = [ ... 
'author = {Sasaki, M. and Riddiford, L. M.}, ' ... 
'year = {1984}, ' ...
'title = {Regulation of reproductive behaviour  and egg maturation in the tobacco hawk moth, \emph{Manduca sexta}}, ' ...
'doi = {10.1111/j.1365-3032.1984.tb00713.x}, ' ...
'journal = {Physiological Entomology}, ' ...
'volume = {9}, ' ...
'pages = {315-327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HayeMcCl1992'; type = 'Article'; bib = [ ... 
'author = {S. E. Hayes and J. B. McClintock and C. J. Watson and R. D. Watson}, ' ... 
'year = {1992}, ' ...
'title = {Growth, energetics and food conversion efficiency during the last larval stadium of the tobacco hornworm (\emph{Manduca sexta})}, ' ...
'journal = {Comparative Biochemistry and Physiology Part A: Physiology}, ' ...
'doi = {10.1016/0300-9629(92)90153-H}, ' ...
'volume = {102}, ' ...
'pages = {395--399}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Odel1998'; type = 'Article'; bib = [ ... 
'author = {J. P. Odell}, ' ... 
'year = {1998}, ' ...
'title = {Energetics of Metamorphosis in Two Holometabolous Insect  Species: \emph{Manduca sexta} ({L}epidoptera: {S}phingidae) and \emph{Tenebrio molitor} ({C}oleoptera: {T}enebrionidae)}, ' ...
'doi = {10.1002/(SICI)1097-010X(19980401)280:5<344::AID-JEZ3>3.0.CO;2-O}, ' ...
'journal = {J. Exp. Zool.}, ' ...
'volume = {280}, ' ...
'pages = {344-353}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GrunClar2015'; type = 'Article'; bib = [ ... 
'author = {Laura W. Grunert and Jameson W. Clarke and Chaarushi Ahuja and Harish Eswaran and H. Frederik Nijhout}, ' ... 
'year = {2015}, ' ...
'title = {A Quantitative Analysis of Growth and Size Regulation in Manduca sexta: The Physiological Basis of Variation in Size and Age at Metamorphosis}, ' ...
'doi = {10.1371/journal.pone.0127988}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {10(5)}, ' ...
'pages = {e0127988}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];