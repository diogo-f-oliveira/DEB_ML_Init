function [data, auxData, metaData, txtData, weights] = mydata_Mauremys_sinensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Geoemydidae';
metaData.species    = 'Mauremys_sinensis'; 
metaData.species_en = 'Chinese stripe-necked turtle'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ap = 6*365;     units.ap = 'd';    label.ap = 'age at puberty for female';      bibkey.ap = 'ChenLue1998';
  temp.ap = C2K(24);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 16.2*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for M. japonica';

data.Lb = 4; units.Lb = 'cm';   label.Lb = 'carapace length at birth';                bibkey.Lb = 'ChenLue1998';
data.Lp = 20;  units.Lp = 'cm';   label.Lp = 'carapace length at puberty for female';  bibkey.Lp = 'ChenLue1998';
data.Lpm = 13;  units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for male'; bibkey.Lpm = 'ChenLue1998';
data.Li = 25;  units.Li = 'cm';   label.Li = 'ultimate carapace length for female';   bibkey.Li = 'ChenLue1998';
data.Lim = 16.3; units.Lim = 'cm';  label.Lim = 'ultimate carapace length for male';  bibkey.Lim = 'ChenLue1998';

data.Wwb = 7.17; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'ChenLue1998';
  comment.Wwb = 'based on (Lb/Li)^3*Wwi';
data.Wwp = 896; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'ChenLue1998';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwpm = 246; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'ChenLue1998';
  comment.Wwpm = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 1750;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'ChenLue1998';
data.Wwim = 246; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';      bibkey.Wwim = 'ChenLue1998';
  comment.Wwim = 'based on (Lim/Li)^3*Wwi';

data.Ri  = 12.6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'ChenLue1998';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time (d), carapace length (cm)
2 10.46
3 11.30
4 13.29
5 14.32
6 15.15
7 18.36
8 21.89
9 23.18];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'carapace length', 'female'};  
temp.tL_f    = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ChenLue1998';
comment.tL_f = 'Data for females, temp is guessed';
%
data.tL_m = [ ... % time (d), carapace length (cm)
2 10.48
3 10.92
4 11.35
5 11.88
6 12.61
7 14.47
8 15.20];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'carapace length', 'male'};  
temp.tL_m    = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ChenLue1998';
comment.tL_m = 'Data for males, temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
%weights.tL_f = 5 * weights.tL_f;
%weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'This species is known to hybridize with the Chinese pond turtle, the Japanese pond turtle, and the Chinese box turtle ';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3YFWN'; % Cat of Life
metaData.links.id_ITIS = '949165'; % ITIS
metaData.links.id_EoL = '458849'; % Ency of Life
metaData.links.id_Wiki = 'Mauremys_sinensis'; % Wikipedia
metaData.links.id_ADW = 'Mauremys_sinensis'; % ADW
metaData.links.id_Taxo = '1685684'; % Taxonomicon
metaData.links.id_WoRMS = '1055804'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Mauremys&species=sinensis'; % ReptileDB
metaData.links.id_AnAge = 'Mauremys_sinensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mauremys_sinensis}}';
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
bibkey = 'ChenLue1998'; type = 'Article'; bib = [ ... 
'author = {T.-H. Chen and K.-Y. Lue}, ' ... 
'year = {1998}, ' ...
'title = {Ecology of the Chinese Stripe-Necked Turtle, \emph{Ocadia sinensis} ({T}estudines: {E}mydidae), in the {K}eelung {R}iver, {N}orthern {T}aiwan}, ' ...
'journal = {Copeia}, ' ...
'volume = {4}, ' ...
'pages = {944--952}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mauremys_japonica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
