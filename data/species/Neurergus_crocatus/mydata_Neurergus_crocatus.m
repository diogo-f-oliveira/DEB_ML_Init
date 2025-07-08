function [data, auxData, metaData, txtData, weights] = mydata_Neurergus_crocatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Neurergus_crocatus'; 
metaData.species_en = 'Yellow-spotted newt,'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTh', 'jiFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp % 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 45;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'Wiki';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
data.Li  = 6.34;   units.Li  = 'cm';  label.Li  = 'ultimate SVL of females';   bibkey.Li  = 'amphibiaweb';
  comment.Li = '5.66 – 7.03 cm';
data.Lim  = 6.38;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL of males';   bibkey.Lim  = 'amphibiaweb';
  comment.Lim = 'max males length from fig. 5';

data.Wwb = 4.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 8.87;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight at birth';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Neurergus_microspilotus: 5.978*(6.34/5.558)^3';

data.Ri  = 120/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(17);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'eggs in clusters of 20-40 eggs; 5 clusters per season assumed' ;

% uni-variate data
% time-length
data.tL_f = [ ... time since birth (year) , SVL (cm)
 5	6.032
 6	6.569
 6	6.464
 7	6.397
 7	6.457
 7	6.581
 7	6.660
 7	6.778
 7	6.824
 8	6.738
 8	6.928
 9	7.026
 9	6.586
 9	6.849
 9	6.954
 9	7.400
 9	6.770
10	7.143
10	7.189
10	6.604
10	6.644
10	7.038
11	6.932
11	7.273
12	7.207
12	7.542
12	7.371
13	7.219
13	7.652
14	7.060];  % SVL at f and T
data.tL_f(:,1) = data.tL_f(:,1) * 365; % year to day
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'UzumAvci2011';
comment.tL_f = 'females';
%
data.tL_m = [ ... time since birth (weeks), SVL (cm)
 8	6.776
 9	7.211
10	7.261
10	7.450
10	7.884
10	7.982
11	7.163
11	7.205
11	7.625
12	7.507
12	7.703
12	7.465
12	7.766
12	7.927
13	7.550
13	8.152
16	8.182
17	8.077];  % SVL at f and T
data.tL_m(:,1) = data.tL_m(:,1) * 365; % year to day
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'UzumAvci2011';
comment.tL_m = 'males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tp = 3 * weights.tp;
weights.ab = 0 * weights.ab;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only.';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '6RZ29'; % Cat of Life
metaData.links.id_ITIS = '668375'; % ITIS
metaData.links.id_EoL = '331054'; % Ency of Life
metaData.links.id_Wiki = 'Neurergus_crocatus'; % Wikipedia
metaData.links.id_ADW = 'Neurergus_crocatus'; % ADW
metaData.links.id_Taxo = '47294'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Neurergus+crocatus'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Neurergus_crocatus}}';
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
bibkey = 'UzumAvci2011'; type = 'article'; bib = [ ... 
'doi = {10.1080/11250001003636679}, ' ...
'author = {\"{U}z\"{u}m, N. and Avci, A. and \"{O}zdemir, N. and Ilgaz, \c{C}. and Olgun, K.}, ' ... 
'year = {2011}, ' ...
'title = {Body size and age structure of a breeding population portion of the {U}rmia salamander, \emph{Neurergus crocatus} {C}ope, 1862 ({C}audata: {S}alamandridae)}, ' ...
'journal = {Italian Journal of Zoology}, ' ...
'volume = {78(2)}, ' ...
'pages = {209–214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

