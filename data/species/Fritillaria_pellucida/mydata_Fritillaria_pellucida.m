function [data, auxData, metaData, txtData, weights] = mydata_Fritillaria_pellucida
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Appendicularia'; 
metaData.order      = 'Copelata'; 
metaData.family     = 'Fritillariidae';
metaData.species    = 'Fritillaria_pellucida'; 
metaData.species_en = 'Sea-squirt'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPn'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(13.5); % K, body temperature
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wdb'; 'Wdi'; 'Ni'};  
metaData.data_1     = {'t-L'; 't-Wd'; 'L-Wd'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};          
metaData.date_subm   = [2022 06 02];                  
metaData.email       = {'bas.kooijman@vu.nl'};        
metaData.address     = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 02]; 

%% set data
% zero-variate data;
data.am = 16; units.am = 'd';    label.am = 'life span';      bibkey.am = 'Fena1976';   
  temp.am = C2K(13.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.024; units.Lb = 'cm';  label.Lb = 'trunc length at birth';   bibkey.Lb = 'Fena1976';
data.Lp = 0.024; units.Lp = 'cm';  label.Lp = 'trunc length at puberty'; bibkey.Lp = 'Fena1976';
  comment.Lp = 'based on assumption that puberty coincides with birth, like in Oikopleura_dioica';
data.Li = 0.15; units.Li = 'cm';  label.Li = 'asymptotic trunc length'; bibkey.Li = 'Fena1976';
  
data.Wwb = 7.23e-6; units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Fena1976';
  comment.Wwb = 'based on egg diameter of 0.024 cm: pi/6*0.024^3';
data.Wdb = 32e-9; units.Wdb = 'g';    label.Wdb = 'dry weight at birth';   bibkey.Wdb = 'Fena1976';    
data.Wdi = 9.12e-6; units.Wdi = 'g';    label.Wdi = 'dry weight at death';   bibkey.Wdi = 'Fena1976';    

data.Ni = 28; units.Ni = '#';    label.Ni = 'number of eggs at death';   bibkey.Ni = 'guess';
  comment.Ni = 'based on weight-correct value for Oikopleura_dioica: 164*9.12/52.6';

% length-weight
data.LWd = [ ... % length of trunc (mum), dry weight (mug)
241.7951	0.0308
656.9216	0.6597
997.3147	3.0160
1284.4653	7.2521
1514.0871	9.1713];
data.LWd(:,1) = data.LWd(:,1)/1e4;
data.LWd(:,2) = data.LWd(:,2)/1e6;
units.LWd = {'cm', 'g'};     label.LWd = {'trunc length', 'dry weight'};  
bibkey.LWd = 'Fena1976';

% time-length
data.tL = [ ... % time since birth (d), trunc length (mum)
 0	240.8585
 2	620.2360
 5	948.2732
10	1249.3063
16	1405.7806];
data.tL(:,2) = data.tL(:,2)/1e4;
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'trunc length'};  
temp.tL = C2K(13.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fena1976';

% time-weight
data.tWd = [ ... % time since birth (d), dry weight (mug)
0	0.0324
2	0.6613
5	3.1714
10	7.4833
16	9.1756];
data.tWd(:,2) = data.tWd(:,2)/1e6;
units.tWd = {'d', 'g'};     label.tWd = {'time since birth', 'dry weight'};  
temp.tWd = C2K(13.5);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
bibkey.tWd = 'Fena1976';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Allocation to reproduction starts at birth, so E_Hp = E_Hb';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'dies at first spawning';
metaData.bibkey.F1 = 'Fena1976'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6K28F'; % Cat of Life
metaData.links.id_ITIS = '159674'; % ITIS, genus only
metaData.links.id_EoL = '46585637'; % Ency of Life
metaData.links.id_Wiki = 'Fritillariidae'; % Wikipedia
metaData.links.id_ADW = 'Fritillaria_pellucida'; % ADW
metaData.links.id_Taxo = '114889'; % Taxonomicon
metaData.links.id_WoRMS = '103386'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fritillariidae}}';   
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
bibkey = 'Fena1976'; type = 'article'; bib = [ ... 
'doi = {10.1007/bf00388800}, ' ...
'author = {Fenaux, R.}, ' ...
'year = {1976}, ' ...
'title  = {Cycle vital, croissance et production chez \emph{Fritillaria pellucida} ({A}ppendicularia), dans la baie de {V}illefranche-sur-{M}er, {F}rance}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {34(3)}, ' ...
'pages = {229–238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

