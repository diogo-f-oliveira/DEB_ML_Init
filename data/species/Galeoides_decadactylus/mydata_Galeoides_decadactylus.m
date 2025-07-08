function [data, auxData, metaData, txtData, weights] = mydata_Galeoides_decadactylus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polynemiformes'; 
metaData.family     = 'Polynemidae';
metaData.species    = 'Galeoides_decadactylus'; 
metaData.species_en = 'Lesser African threadfin'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd', 'jiFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 07];

%% set data
% zero-variate data

data.am = 16*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'WehyAmpo2017';   
  temp.am = C2K(25.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11.6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.775 mm as typical for Polydactylus: pi/6*0.0775^3'; 
data.Wwi  = 1467;  units.Wwi  = 'g';  label.Wwi  = 'ultimate weight'; bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on  0.00794*Li^3.10, see F1; max published weight 75 kg';

data.GSI = 0.096; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'WehyAmpo2017';
  temp.GSI = C2K(25.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
93.918	10.549
124.736	10.822
217.171	12.759
365+92.981	18.294
365+122.986	18.653
365+216.250	19.557
365+248.663	21.466
730+94.111	23.630
730+124.914	24.850
730+158.577	24.693
730+185.728	25.997
730+248.589	26.027
1095+94.418	29.741
1095+124.826	30.271
1095+184.829	31.418
1095+216.875	31.003
1460+123.553	33.713
1460+159.647	33.730
1460+185.182	34.689
1825+93.889	    37.314
1825+123.893	37.758
1825+157.960	37.774];
data.tL(:,1) = data.tL(:,1) + 200;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(25.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WehyAmpo2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_Eig','tL_Roe','tL_Der','tL_Cha','tL_Rop'}; subtitle1 = {'Data for loc Eig, Roe, Der, Cha, Rop'};
% set2 = {'tL_Fli','tL_Spr','tL_Fit','tL_Mar','tL_Bri'}; subtitle2 = {'Data for loc Fli, Spr, Fit, Mar, Bri'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3F3T8'; % Cat of Life
metaData.links.id_ITIS = '645691'; % ITIS
metaData.links.id_EoL = '46578835'; % Ency of Life
metaData.links.id_Wiki = 'Galeoides_decadactylus'; % Wikipedia
metaData.links.id_ADW = 'Galeoides_decadactylus'; % ADW
metaData.links.id_Taxo = '174671'; % Taxonomicon
metaData.links.id_WoRMS = '126997'; % WoRMS
metaData.links.id_fishbase = 'Galeoides-decadactylus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galeoides_decadactylus}}';
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
bibkey = 'WehyAmpo2017'; type = 'article'; bib = [ ... 
'author = {Wehye, A.S. and S.K. Amponsah}, ' ... 
'year = {2017}, ' ...
'title = {Growth, Mortality and Exploitation rates of Lesser African threadfin, \emph{Galeoides decadactylus} ({B}loch, 1795) within the coastal waters of {L}iberia}, ' ...
'journal = {International Journal of Fisheries and Aquatic Research}, ' ...
'volume = {2(2)}, ' ...
'pages = {43-49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EmmaGbes2010'; type = 'article'; bib = [ ... 
'author = {Emmanuel, B.E. and Gbesan, K and Osibona, A.O.}, ' ... 
'year = {2010}, ' ...
'title = {Morphology, Fecundity and diet of \emph{Galeoides decadactylus} ({P}isces: {P}olynemidae) ({B}loch, 1795) off {N}igerian coast}, ' ...
'journal = {Nature and Science}, ' ...
'volume = {8(3}, ' ...
'pages = {15-23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Galeoides-decadactylus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

