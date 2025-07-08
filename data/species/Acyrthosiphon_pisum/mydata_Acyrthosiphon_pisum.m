function [data, auxData, metaData, txtData, weights] = mydata_Acyrthosiphon_pisum

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Hemiptera'; 
metaData.family     = 'Aphididae';
metaData.species    = 'Acyrthosiphon_pisum'; 
metaData.species_en = 'Pea aphid'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH', 'TPa'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biAb', 'biHe'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Wdb'; 'Wdp'; 'Ri'}; 
metaData.data_1     = {'t-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2013 01 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 02 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 04 13];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 19]; 

%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ShinSisk2003';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 9;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Sequ1991';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki: 7-10 d';
data.am = 30;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.14; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'estimated from Lp * (Wb/Wp)^(1/3) = .042^(1/3) * 0.4';
data.Lp  = 0.4;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki';

data.Wdb = 0.042;units.Wdb = 'mg';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'Sequ1991';
data.Wdp = 1;    units.Wdp = 'mg';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'Sequ1991';

data.Ri  = 12;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-12 young per d';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), dry weight (g)
1.007	0.042
2.014	0.053
2.993	0.105
4.000	0.198
4.952	0.253
6.014	0.398
6.966	0.646
8.000	0.882
9.034	1.018
10.041	0.920];
units.tW   = {'d', 'mg'};  label.tW = {'time since birth', 'dry weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Sequ1991';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.g = 1;  units.psd.g = '-';       label.psd.g = 'energy investment ratio';
weights.psd.g = weights.psd.kap * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Allocation to reproduction is here assumed to occur in the final instar only, but this is questionable';
D2 = 'Pseudodata g = 1 is added to avoid convergence to very low g with very high z';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'parthenogenetic, sexual eggs overwinter and hatch into females';
metaData.bibkey.F1 = 'Sequ1991'; 
F2 = 'nymphs hatch and reach maturity in 4 moults';
metaData.bibkey.F2 = 'Sequ1991'; 
F3 = 'Besides differences between sexual and parthenogenetic morphs, winged and wingless morphs exist';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'A. pisum hosts primary endosymbiont Buchnera aphidicola, for synthesis of amino acids, required for reproduction; Buchnera is transmitted from mothers to offspring, A. pisum also hosts a range of facultative bacterial symbionts that can be transmitted maternally and horizontally';
metaData.bibkey.F4 = 'Wiki'; 
F5 = 'diapauze is temp independent';
metaData.bibkey.F5 = 'ShinSisk2003'; 
F6 = 'growth rate of asexually-produced embryos approximately doubles between 5 C and 10 C and between 10 C and 16 C: T_A = 10.5 kK';
metaData.bibkey.F6 = 'ShinSisk2003'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5,'F6',F6);

%% Links
metaData.links.id_CoL = '7GJFD'; % Cat of Life
metaData.links.id_ITIS = '200572'; % ITIS
metaData.links.id_EoL = '588004'; % Ency of Life
metaData.links.id_Wiki = 'Acyrthosiphon_pisum'; % Wikipedia
metaData.links.id_ADW = 'Acyrthosiphon_pisum'; % ADW
metaData.links.id_Taxo = '19482'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_aphid = '25510'; % aphid

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acyrthosiphon_pisum}}';
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
bibkey = 'Sequ1991'; type = 'Phdthesis'; bib = [ ... 
'author = {Sequeira, R. V.}, ' ... 
'year = {1991}, ' ...
'title = {Nutritional and physiological ecology of insect host - parasitoid interactions: the pea aphid - \emph{Aphidius ervi} system}, ' ...
'school = {Simon Fraser Univ.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShinSisk2003'; type = 'Article'; bib = [ ... 
'author = {Shingleton, A. W. and Sisk, G. C. and Stern, D.}, ' ... 
'year = {2003}, ' ...
'title = {Diapause in the pea aphid (\emph{Acyrthosiphon pisum}) is a slowing but not a cessation of development}, ' ...
'journal = {BMC Developmental Biology}, ' ...
'doi = {10.1186/1471-213X-3-7}, ' ...
'volume = {3}, ' ...
'pages = {7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

