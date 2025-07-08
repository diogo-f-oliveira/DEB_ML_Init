function [data, auxData, metaData, txtData, weights] = mydata_Centropomus_undecimalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centropomiformes'; 
metaData.family     = 'Centropomidae';
metaData.species    = 'Centropomus_undecimalis'; 
metaData.species_en = 'Common snook'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMm', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 04 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 15];

%% set data
% zero-variate data

data.tb = 4;   units.tb = 'd';    label.tb = 'time since hatch at birth';   bibkey.tb = 'sms';   
  temp.tb = C2K(27);  units.temp.tb = 'K'; label.temp.tb = 'temperature';
data.am =  20* 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'iucn';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.145; units.Lh  = 'cm';  label.Lh  = 'total length at hatch';   bibkey.Lh  = 'sms';  
data.Lb  = 0.22; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'sms';  
data.Lp  = 17.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'iucn'; 
  comment.Lp = '15 till 20 cm for males; female gonads mature directly from the mature male gonads shortly after spawning, see F3';
data.Li  = 140;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'sms';
  comment.Wwb = 'based on egg diameter of 0.8 mm: 4/3*pi*0.04^3';
data.Wwi = 22e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'sms';

data.Ri  = 4e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
% females
data.tL_fBosque = [ ... % time since birth (yr), fork length (cm) 
 5  81.0
 6  81.6
 7  83.6
 8  84.2
 9  89.9
10  81.3
11  90.2
12 103.3
13  98.8
15  99.2];
data.tL_fBosque(:,1) = 365 * data.tL_fBosque(:,1); % convert yr to d
units.tL_fBosque   = {'d', 'cm'};  label.tL_fBosque = {'time since birth', 'fork length', 'female'};  
temp.tL_fBosque    = C2K(27);  units.temp.tL_fBosque = 'K'; label.temp.tL_fBosque = 'temperature';
bibkey.tL_fBosque = 'PereMend2013';
comment.tL_fBosque = 'data for females at coastal Barra el Bosque';
% males
data.tL_mBosque = [ ... % time since birth (yr), fork length (cm) 
 3 39.5
 4 53.5
 5 69.5
 6 77.5
 7 74.2
 8 76.9
 9 78.4
10 80.7
11 74.5
12 75.7
14 91.5];
data.tL_mBosque(:,1) = 365 * data.tL_mBosque(:,1); % convert yr to d
units.tL_mBosque   = {'d', 'cm'};  label.tL_mBosque = {'time since birth', 'fork length', 'male'};  
temp.tL_mBosque    = C2K(27);  units.temp.tL_mBosque = 'K'; label.temp.tL_mBosque = 'temperature';
bibkey.tL_mBosque = 'PereMend2013';
comment.tL_mBosque = 'data for males at coastal Barra el Bosque';
% females
data.tL_fPedro = [ ... % time since birth (yr), fork length (cm) 
 5 58.2
 6 83.9
 7 82.0
 8 88.5
 9 94.7
11 93.9
12 87.6
13 97.1
16 97.5];
data.tL_fPedro(:,1) = 365 * data.tL_fPedro(:,1); % convert yr to d
units.tL_fPedro   = {'d', 'cm'};  label.tL_fPedro = {'time since birth', 'fork length', 'female'};  
temp.tL_fPedro    = C2K(27);  units.temp.tL_fPedro = 'K'; label.temp.tL_fPedro = 'temperature';
bibkey.tL_fPedro = 'PereMend2013';
comment.tL_fPedro = 'data for females at coastal Barra San Pedro';
% males
data.tL_mPedro = [ ... % time since birth (yr), fork length (cm) 
 2 39.8
 3 42.3
 4 56.0
 5 75.2
 6 75.2
 7 74.3
 8 78.8
 9 77.9
10 78.3
11 82.2
12 83.7
13 85.5
17 94.5];
data.tL_mPedro(:,1) = 365 * data.tL_mPedro(:,1); % convert yr to d
units.tL_mPedro   = {'d', 'cm'};  label.tL_mPedro = {'time since birth', 'fork length', 'male'};  
temp.tL_mPedro    = C2K(27);  units.temp.tL_mPedro = 'K'; label.temp.tL_mPedro = 'temperature';
bibkey.tL_mPedro = 'PereMend2013';
comment.tL_mPedro = 'data for males at coastal Barra San Pedro';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fBosque','tL_mBosque'}; subtitle1 = {'data for females, males at Barra el Bosque'};
set2 = {'tL_fPedro','tL_mPedro'}; subtitle2 = {'data for females, males at Barra San Pedro'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight relationship: W = 0.0069 * TL^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; freshwater; brackish; reef-associated; amphidromous; depth range ? - 22 m. Tropical; 25 C - 31 C, preferred 27 C';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'protandric hermaphrodite';
metaData.bibkey.F3 = 'iucn'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'SB4Z'; % Cat of Life
metaData.links.id_ITIS = '167648'; % ITIS
metaData.links.id_EoL = '46580162'; % Ency of Life
metaData.links.id_Wiki = 'Centropomus_undecimalis'; % Wikipedia
metaData.links.id_ADW = 'Centropomus_undecimalis'; % ADW
metaData.links.id_Taxo = '45046'; % Taxonomicon
metaData.links.id_WoRMS = '280068'; % WoRMS
metaData.links.id_fishbase = 'Centropomus-undecimalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centropomus_undecimalis}}';
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
bibkey = 'PereMend2013'; type = 'Article'; bib = [ ... 
'author = {M. A. Perera-Garcia and M. Mendoza-Carranza and W. Contreras-S\''{a}nchez and A. Ferrara and M. Huerta-Ortiz and R. E. Hernandez-Gomez}, ' ... 
'year = {2013}, ' ...
'title = {Comparative age and growth of common snook \emph{Centropomus undecimalis} ({P}isces: {C}entropomidae) from coastal and riverine areas in {S}outhern {M}exico}, ' ...
'journal = {Rev. Biol. Trop.}, ' ...
'volume = {61}, ' ...
'pages = {807--819}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/Centropomus-undecimalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sms'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sms.si.edu/irlspec/Centro_undeci.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/191835/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
