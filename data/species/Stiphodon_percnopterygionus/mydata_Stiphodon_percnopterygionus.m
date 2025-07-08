function [data, auxData, metaData, txtData, weights] = mydata_Stiphodon_percnopterygionus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Stiphodon_percnopterygionus'; 
metaData.species_en = 'Sicydiine goby'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TO','TPi'};
metaData.ecoCode.habitat = {'bjMc','jiFr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 21];

%% set data
% zero-variate data

data.ab = 4;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'YamaTach2006';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.125;   units.Lb  = 'cm';  label.Lb  = 'std length at birth';  bibkey.Lb  = 'YamaTach2006'; 
data.Lp  = 2;   units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'YamaTach2006'; 
data.Li  = 4.2;   units.Li  = 'cm';  label.Li  = 'ultimate std length for females';  bibkey.Li  = 'fishbase';
data.Lim  = 3.7;   units.Lim  = 'cm';  label.Lim  = 'ultimate std length for males';  bibkey.Lim  = 'fishbase';

data.Wwb = 6.9e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'YamaTach2006';
  comment.Wwb = 'based on egg length 0.54–0.58 mm and width 0.49–0.50 mm : pi/6*0.055*0.049^2';
data.Wwp = 0.092;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01122*Li^3.04, see F1';
data.Wwi = 0.88;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.01122*Li^3.04, see F1';

% uni-variate data

% time-length
data.tL = [... %  time since birth (d), std length (cm)
    0 0.125
  115 1.35 % from fishbase, when larvae terun to freshwater
  210 2.0
  300 2.5
  550 4.2];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YamaTach2006';

% length-fecundity
data.LN = [ ... % standard length (cm), fecundity (#)
2.240	2061.070
2.339	1672.560
2.376	1155.897
2.382	1327.854
2.453	1369.844
2.655	1517.490
2.729	2204.608
2.784	2590.908
2.813	2074.359
2.815	1493.690
2.846	3321.207
2.863	2826.332
2.869	2546.680
2.879	3019.652
2.897	2159.190
2.907	2933.234
2.914	1556.789
2.929	3169.480
2.950	2351.971
2.987	1598.751
3.031	1856.190
3.081	4006.001
3.144	2607.257
3.147	4349.149
3.168	3596.156
3.191	1660.348
3.305	4067.315
3.324	2346.616
3.381	5550.096
3.381	10130.731
3.490	2365.741];
units.LN   = {'cm', '#'};  label.LN = {'std length','fecundity'};  
temp.LN    = C2K(28);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'YamaTach2006';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01122*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6ZW3X'; % Cat of Life
metaData.links.id_ITIS = '638095'; % ITIS
metaData.links.id_EoL = '46576776'; % Ency of Life
metaData.links.id_Wiki = 'Stiphodon_percnopterygionus'; % Wikipedia
metaData.links.id_ADW = 'Stiphodon_percnopterygionus'; % ADW
metaData.links.id_Taxo = '188275'; % Taxonomicon
metaData.links.id_WoRMS = '282899'; % WoRMS
metaData.links.id_fishbase = 'Stiphodon-percnopterygionus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stiphodon_percnopterygionus}}';
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
bibkey = 'YamaTach2006'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10228-005-0307-1}, ' ...
'author = {Yamasaki, N. and Tachihara, K.}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive biology and morphology of eggs and larvae of \emph{Stiphodon percnopterygionus} ({G}obiidae: {S}icydiinae) collected from {O}kinawa {I}sland}, ' ...
'journal = {Ichthyological Research}, ' ...
'volume = {53(1)}, ' ...
'pages = {13–18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Stiphodon-percnopterygionus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
