function [data, auxData, metaData, txtData, weights] = mydata_Aphanius_iberus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Aphanius_iberus'; 
metaData.species_en = 'Spanish toothcarp'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2020 10 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.ab = 8;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Wiki';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.4 * 365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'FernHern1988';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'FernHern1988'; 
  comment.Lp = 'based on tp 2 mnth and tL data';
data.Li  = 5.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';   bibkey.Wwb = 'FernHern1988';
  comment.Wwb = 'based on egg diameter of 0.75-1.75 mm: pi/6*0.15^3';
data.Wwi = 2.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi=  'based on 0.00933*Li^3.20, see F1';
  
data.Ri  = 900/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL_f = [ ... %  time since birth (mnth), total length (cm)
0.014	0.300
1.015	1.731
1.961	2.656
2.969	2.856
3.964	2.679
4.913	3.024];
data.tL_f(:,1) = 30.5 * data.tL_f(:,1); % covert mnth to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time', 'total length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FernHern1988';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... %  time since birth (yr), total length (cm)
0.014	0.300
1.000	1.760
1.963	2.264
2.956	2.537
3.965	2.432
4.916	2.560];
data.tL_m(:,1) = 30.5 * data.tL_m(:,1); % covert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time', 'total length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FernHern1988';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males as supposed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00933 * (TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase';
F2 = 'a short-lived species';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'FB5R'; % Cat of Life
metaData.links.id_ITIS = '165725'; % ITIS
metaData.links.id_EoL = '46566756'; % Ency of Life
metaData.links.id_Wiki = 'Aphanius_iberus'; % Wikipedia
metaData.links.id_ADW = 'Aphanius_iberus'; % ADW
metaData.links.id_Taxo = '44468'; % Taxonomicon
metaData.links.id_WoRMS = '126429'; % WoRMS
metaData.links.id_fishbase = 'Aphanius-iberus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aphanius_iberus}}';
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
bibkey = 'FernHern1988'; type = 'Article'; bib = [ ... 
'author = {C. Fernandez-Delgado and J. A. Hernando and M. Herreraa and M. Bellido}, ' ... 
'year = {1988}, ' ...
'title = {Age, growth and reproduction of \emph{Aphanius iberus} ({C}uv. \& {Va}al., 1846) in the lower reaches of the {G}uadalquivir rivir (south-west {S}pain)}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {20}, ' ...
'pages = {227-234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Aphanius-iberus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

