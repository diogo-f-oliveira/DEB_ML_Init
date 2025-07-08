function [data, auxData, metaData, txtData, weights] = mydata_Paleosuchus_palpebrosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Alligatoridae';
metaData.species    = 'Paleosuchus_palpebrosus'; 
metaData.species_en = 'Cuvier''s dwarf caiman'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFm', 'biFr'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvr', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 10];

%% set data
% zero-variate data

data.ab = 3*30.5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Wiki';   
  temp.ab = C2K(29); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 8*365;     units.ap = 'd';    label.ap = 'age at puberty for female';  bibkey.ap = 'CampMahn2013';
  temp.ap = C2K(23); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = '4-7 yrs';
data.am = 53*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 13;       units.Lb  = 'cm';  label.Lb  = 'SVL at birth';           bibkey.Lb  = 'CampMahn2013';  
data.Lp  = 60;      units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for female'; bibkey.Lp  = 'CampMahn2013'; 
data.Li  = 77;      units.Li  = 'cm';  label.Li  = 'ultimate SVL for female';   bibkey.Li  = 'CampMahn2013';
  comment.Li = 'Wiki: max total length 120 cm';
data.Lim = 91.5;      units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for male';    bibkey.Lim  = 'CampMahn2013';
  comment.Lim = 'Wiki: max total length 140 cm';

data.Wwb = 50;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'crocodilian';
  comment.Wwb = '46 to 55 g';
data.Wwi = 12e3;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'Wiki';

data.Ri  = 2*17/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = {'Wiki','ADW'};   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10 to 25 eggs per clutch, 1 to 3 clutches per yr in captivity';
 
% uni-variate data

% time length Data for females
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.211	14.084
0.316	15.812
0.475	15.812
0.527	17.853
0.580	16.754
0.580	15.026
0.580	14.398
0.580	14.084
0.791	25.236
0.791	22.565
0.844	17.539
1.002	18.482
1.107	21.309
1.107	20.366
1.318	22.251
1.371	23.822
1.529	26.492
1.845	34.503
1.845	27.435
2.267	38.115];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f   = {'yr', 'cm'};  label.tL_f = {'time since birth', 'SVL'};  
temp.tL_f = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'CampMahn2013'};
comment.tL_f = 'Data for females';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'temperature effects sex of neonate: below  31 C neonates are male, above 32 C they are female';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4C47J'; % Cat of Life
metaData.links.id_ITIS = '551814'; % ITIS
metaData.links.id_EoL = '791224'; % Ency of Life
metaData.links.id_Wiki = 'Paleosuchus_palpebrosus'; % Wikipedia
metaData.links.id_ADW = 'Paleosuchus_palpebrosus'; % ADW
metaData.links.id_Taxo = '50624'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Paleosuchus&species=palpebrosus'; % ReptileDB
metaData.links.id_AnAge = 'Paleosuchus_palpebrosus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paleosuchus_palpebrosus}}';
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
bibkey = 'CampMahn2013'; type = 'Article'; bib = [ ... 
'author = {Zilca Campos and William E. Magnusson and Van\''{i}lio Marques}, ' ... 
'year = {2013}, ' ...
'title = {GROWTH RATES OF \emph{Paleosuchus palpebrosus} AT THE SOUTHERN LIMIT OF ITS RANGE}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {69}, ' ...
'number = {4}, ' ...
'pages = {405-410}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Paleosuchus_palpebrosus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'crocodilian'; type = 'Misc'; bib = ...
'howpublished = {\url{http://crocodilian.com/paleosuchus/captivecare.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

