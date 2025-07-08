function [data, auxData, metaData, txtData, weights] = mydata_Alinda_biplicata
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Clausiliidae';
metaData.species    = 'Alinda_biplicata'; 
metaData.species_en = 'Common door snail'; 

metaData.ecoCode.climate = {'BWk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biH'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 18]; 

%% set data
% zero-variate data

data.tp  = 38*7;   units.tp  = 'd'; label.tp  = 'time since birth at puberty';     bibkey.tp  = 'MaltSuli2012';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '20 - 56 wk';
data.am  = 5*365;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'MaltSuli2012';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = '4-6 yrs';

data.Lb  = 0.13; units.Lb  = 'cm';  label.Lb  = 'shell height at birth';   bibkey.Lb  = 'MaltSuli2012';
  comment.Lb = '1.0-1.6 mm';
data.Li  = 1.8; units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Jans2015';

data.Wwi  = 0.148; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'Wiki';

data.Ri  = 20/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MaltSuli2012';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20 juveniles in 9 batches per yr';
 
% uni-variate data
% time - length
data.tL = [ ... % age (d), number of whorls (#)
0.000	2.474
14.874	3.388
27.627	4.200
42.935	4.978
56.784	5.723
70.274	6.264
84.130	6.737
98.353	7.142
112.212	7.514
126.801	7.885
139.932	8.155
153.798	8.290
168.027	8.458
181.526	8.626
196.123	8.692
209.611	9.301
223.843	9.368
237.702	9.705
252.655	10.110
265.425	10.245
279.656	10.379
294.250	10.547
307.387	10.614
321.609	11.053
335.842	11.052
349.708	11.152
364.669	11.252
377.441	11.319
391.311	11.283];
data.tL(:,2) = data.Lb*(data.Li/ data.Lb).^((data.tL(:,2)-data.tL(1,2))/(data.tL(end,2)-data.tL(1,2)));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaltSuli2012';
comment.tL = 'based on number of whorls, assuming constant factors per whorl and Lb and Li';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite; ovoviviparous';
metaData.bibkey.F1 = 'MaltSuli2012'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BSB3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4918671'; % Ency of Life
metaData.links.id_Wiki = 'Alinda_biplicata'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5238620'; % Taxonomicon
metaData.links.id_WoRMS = '1049653'; % WoRMS
metaData.links.id_molluscabase = '1049653'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alinda_biplicata}}';
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
bibkey = 'MaltSuli2012'; type = 'Article'; bib = [ ... 
'doi = {10.3161/000345412X659803}, ' ...
'author = {Maltz, Tomasz K. and Sulikowska-Drozd, Anna}, ' ... 
'title = {Life History of \emph{Alinda biplicata} ({M}ontagu, 1803) ({G}astropoda: {P}ulmonata: {C}lausiliidae) Based on Five-Year Laboratory Observations}, ' ...
'journal = {Annales Zoologici}, ' ...
'number = {4}, ' ...
'volume = {62}, ' ...
'year = {2012}, ' ...
'pages = {789-807}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jans2015'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Bert Jansen}, ' ...
'year = {2015}, ' ...
'title  = {Veldgids Slakken en Mossels}, ' ...
'publisher = {KNNV}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

