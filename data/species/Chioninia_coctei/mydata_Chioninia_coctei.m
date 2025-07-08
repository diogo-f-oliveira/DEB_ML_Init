function [data, auxData, metaData, txtData, weights] = mydata_Chioninia_coctei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Scincidae';
metaData.species    = 'Chioninia_coctei'; 
metaData.species_en = 'Cape Verde giant skink'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TPav'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dg', 'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data;
data.ab = 160;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temp';
  comment.ab = 'Based on Tiliqua rugosa';
data.tp = 6*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'AndrGuar2003';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'AndrGuar2003';
  temp.tpm = C2K(25); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 16*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AndrGuar2003'; 
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 6.95;   units.Lb  = 'cm';   label.Lb  = 'snout to vent length at birth';  bibkey.Lb  = 'guess'; 
  comment.Lb = 'based on (Wwb/Wwi)^(1/3)*Li: (9.22/858)^(1/3)*31.5';
data.Lp  = 23;   units.Lp  = 'cm';   label.Lp  = 'snout to vent length at puberty'; bibkey.Lp  = 'AndrGuar2003';
  comment.Lp = 'based on 14.1 cm is juv, 24.1 is adult; value for Tiliqua rugosa';
data.Li  = 31.5;   units.Li  = 'cm';   label.Li  = 'ultimate SVL for females';      bibkey.Li  = 'AndrGuar2003';
  comment.Li = 'based on female/male ration of max values: 35*25.5/28.3';
data.Lim  = 35;   units.Lim  = 'cm';   label.Lim  = 'ultimate SVL for males';       bibkey.Lim  = 'AndrGuar2003';
 
data.Wwb = 9.22;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'AndrGave1998';
  comment.Wwi = 'Based on eggs of length 3.655 cm, diameter 2.195 cm: pi/6*3.655*2.195^2';
data.Wwi = 858;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on Tiliqua rugosa: 900*(31.5/32)^3';

data.Ri  = 2/365/2;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'AndrGuar2003';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 young per litter, assumed 1 litter per 2 yr';
 
% uni-variate data
data.tL_f = [ % time since birth (yr), SVL (cm)
 4	14.097 % juv
 6	24.258
 6	25.952
 7	23.573
 7	26.315
 8	28.129
 8	24.339
 8	25.548
 9	24.460
 9	27.403
10	28.210
11	25.468
12	27.726];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'females'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AndrGuar2003'; comment.tL_f = 'Data for females';
%
data.tL_m = [ % time since birth (yr), SVL (cm)
 5	25.508
 6	28.089
 6	28.573
 7	25.952
 8	23.774
 8	31.073
 9	30.468
10	26.476
13	28.895
16	32.040];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'age', 'length', 'males'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AndrGuar2003'; comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% overwriting weights
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Considered to be extinct in 2013';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '69TCT'; % Cat of Life
metaData.links.id_ITIS = '1182513'; % ITIS
metaData.links.id_EoL = '1055894'; % Ency of Life
metaData.links.id_Wiki = 'Chioninia_coctei'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4682956'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Chioninia&species=coctei'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chioninia_coctei}}';   % replace my_pet by latin species name
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
bibkey = 'AndrGuar2003'; type = 'Article'; bib = [ ...  % 
'author = {Franco Andreone and Fabio M. Guarino}, ' ...
'title = {Giant and long-lived? {A}ge structure in \emph{Macroscincus coctei}, an extinct skink from {C}ape {V}erde}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {24}, ' ...
'number = {4}, ' ...
'pages = {459-470}, ' ...
'year = {2003}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndrGave1998'; type = 'Article'; bib = [ ...  % 
'author = {Franco Andreone and Elena Gavett}, ' ...
'title = {Some remarkable  specimens  of the giant {C}ape {V}erde skink, \emph{Macroscincus coctei} (Dum\''{e}ril  \& {B}ibron,  1839), with notes about its distribution  and  causes of its possible extinction}, ' ...
'journal = {Ital. J.  Zool.}, ' ...
'volume = {65}, ' ...
'pages = {413-421}, ' ...
'year = {1998}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 