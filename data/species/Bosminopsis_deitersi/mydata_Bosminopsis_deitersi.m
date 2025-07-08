function [data, auxData, metaData, txtData, weights] = mydata_Bosminopsis_deitersi
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Bosminidae';
metaData.species    = 'Bosminopsis_deitersi'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'A','B','C','D'};
metaData.ecoCode.ecozone = {'TN','TP','TA','TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab_T'; 'ap_T'; 'am_T'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdi'; 'Ri_T'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 14]; 

%% set data
% zero-variate data

data.ab_25 = 1.21;    units.ab_25 = 'd';    label.ab_25 = 'age at birth';                bibkey.ab_25 = 'MelaRoch2006';   
  temp.ab_25 = C2K(25);  units.temp.ab_25 = 'K'; label.temp.ab_25 = 'temperature'; 
data.ab_20 = 1.62;    units.ab_20 = 'd';    label.ab_20 = 'age at birth';                bibkey.ab_20 = 'MelaRoch2006';   
  temp.ab_20 = C2K(20);  units.temp.ab_20 = 'K'; label.temp.ab_20 = 'temperature'; 
data.tp_25 = 2.74;    units.tp_25 = 'd';    label.tp_25 = 'time since birth at at puberty'; bibkey.tp_25 = 'MelaRoch2006';   
  temp.tp_25 = C2K(25);  units.temp.tp_25 = 'K'; label.temp.tp_25 = 'temperature'; 
data.tp_20 = 4.56;    units.tp_20 = 'd';    label.tp_20 = 'time since birth at at puberty'; bibkey.tp_20 = 'MelaRoch2006';   
  temp.tp_20 = C2K(20);  units.temp.tp_20 = 'K'; label.temp.tp_20 = 'temperature'; 
data.am_25 = 16.60;    units.am_25 = 'd';    label.am_25 = 'life span';                bibkey.am_25 = 'MelaRoch2006';   
  temp.am_25 = C2K(25);  units.temp.am_25 = 'K'; label.temp.am_25 = 'temperature'; 
data.am_20 = 19.55;    units.am_20 = 'd';    label.am_20 = 'life span';                bibkey.am_20 = 'MelaRoch2006';   
  temp.am_20 = C2K(20);  units.temp.am_20 = 'K'; label.temp.am_20 = 'temperature'; 

data.Lb  = 0.0200; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'MelaRoch2006';
data.Lp  = 0.0413; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'MelaRoch2006';
data.Li  = 0.0510; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'MelaRoch2006';

data.Wdb  = 0.23e-6;  units.Wdb  = 'g';  label.Wdb  = 'dry weight at birth';   bibkey.Wdb  = 'MelaRoch2006';
data.Wdi  = 0.70e-6;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'MelaRoch2006';

data.Ri_25 = 1.6/1.48;    units.Ri_25 = '#/d';    label.Ri_25 = 'max reprod rate';  bibkey.Ri_25 = 'MelaRoch2006';   
  temp.Ri_25 = C2K(25);  units.temp.Ri_25 = 'K'; label.temp.Ri_25 = 'temperature';
  comment.Ri_25 = 'based on clutch size 1.6, clutch interval 1.48 d';
data.Ri_20 = 1.47/1.88;    units.Ri_20 = '#/d';    label.Ri_20 = 'max reprod rate';  bibkey.Ri_20 = 'MelaRoch2006';   
  temp.Ri_20 = C2K(20);  units.temp.Ri_20 = 'K'; label.temp.Ri_20 = 'temperature';
  comment.Ri_20 = 'based on clutch size 1.47, clutch interval 1.88 d';

% uni-variate data
% time-length
data.tL = [ ... % instar (#), length (mm) at 25, 20 C
    0 0.20800 0.18525
    1 0.25350 0.24050
    2 0.29343 0.28229
    3 0.31200 0.30829
    4 0.32067 0.33800
    5 0.35100 0.36400
    6 0.35100 0.37267
    7 0.39000 NaN
    8 0.39000 NaN];
data.tL(:,2:3) = data.tL(:,2:3)/10; % convert mm to cm
units.tL   = {'d', 'cm', 'cm'};  label.tL = {'instar', 'length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MelaRoch2006'; treat.tL = {1, {'25 C','20 C'}}; 
instar.tL = [1.48 1.88]; % intermoult interval

%% set weights for all real data
weights = setweights(data, []);
weights.tL(:,1) = 5 * weights.tL(:,1); 
weights.Li = 3 * weights.Li; 
weights.Lb = 3 * weights.Lb; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.instar = instar;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = 'MLZJ'; % Cat of Life
metaData.links.id_ITIS = '83954'; % ITIS
metaData.links.id_EoL = '42628618'; % Ency of Life
metaData.links.id_Wiki = '327087'; % Wikipedia
metaData.links.id_ADW = 'Bosminopsis_deitersi'; % ADW
metaData.links.id_Taxo = '143799'; % Taxonomicon
metaData.links.id_WoRMS = '933270'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MelaRoch2006'; type = 'Article'; bib = [ ... 
'author = {Mel\~{a}o, M. G. and Rocha, O.}, ' ... 
'year = {2006}, ' ...
'title = {Life history, population dynamics, standing biomass and production of \emph{Bosminopsis deitersi} ({C}ladocera) in a shallow tropical reservoir}, ' ...
'journal = {Acta Limnol. Bras.}, ' ...
'volume = {18(4)}, ' ...
'pages = {433-450}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
