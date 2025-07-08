function [data, auxData, metaData, txtData, weights] = mydata_Lynceus_brachyurus
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Laevicaudata'; 
metaData.family     = 'Lynceidae';
metaData.species    = 'Lynceus_brachyurus'; 
metaData.species_en = 'Common lynceus'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'biD'};
metaData.ecoCode.gender  = {'Hha'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 09]; 

%% set data
% zero-variate data

data.tp = 11;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(26);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 150;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.3;  units.Lp = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'Patt2014';
  comment.Lp = 'caparace width 2.5 mm';
data.Li  = 0.7;  units.Li = 'cm';  label.Li  = 'ultimate carapace length';   bibkey.Li  = 'Patt2014';

data.Wwb  = 4.5e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'Patt2014';
  comment.Wwb = 'based on egg diameter of 200-210 mum of Eulimnadia antlei and photos: pi/6*205e-4^3';
data.Wwi  = 0.099;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on length 0.7 cm, height 0.6 cm, thickness 0.6 cm: 0.5*pi/4*0.7*0.6^2; uncertain because of water in carapace';

data.Ri  = 160/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Patt2014';   
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Number od eggs very variable; brood 123-223, brood interval guessed at 2 d';
 
% uni-variate data

% time-length
data.tL = [ ... % time (wk), carapace length (cm)
19	0.277
20	0.328
21	0.331
22	0.329
23	0.336
24	0.34];
data.tL(:,1) = -115 + 7*data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'carapace length'};  
temp.tL = C2K(26); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Patt2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;
weights.Wwi = 5 * weights.Wwi;
weights.Li = 5 * weights.Li;
weights.tL = 5 * weights.tL; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Shape of nauplii very different from juveniles/adults: flat with dorsal sheet';
metaData.bibkey.F1 = 'Patt2014'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BJSYZ'; % Cat of Life
metaData.links.id_ITIS = '83771'; % ITIS
metaData.links.id_EoL = '55698253'; % Ency of Life
metaData.links.id_Wiki = 'Lynceus_brachyurus'; % Wikipedia
metaData.links.id_ADW = 'Lynceus_brachyurus'; % ADW
metaData.links.id_Taxo = '33144'; % Taxonomicon
metaData.links.id_WoRMS = '593146'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lynceus_brachyurus}}';
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
bibkey = 'Patt2014'; type = 'Article'; bib = [ ... 
'doi = {10.1163/1937240X-00002279}, ' ...
'author = {Wendell K. Patton}, ' ... 
'year = {2014}, ' ...
'title = {ON THE NATURAL HISTORY AND FUNCTIONAL MORPHOLOGY OF THE CLAM SHRIMP, \emph{Lynceus_brachyurus} {M}\"{u}ller ({B}RANCHIOPODA: {L}AEVICAUDATA)}, ' ...
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {34(6)}, ' ...
'pages = {677-703}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

